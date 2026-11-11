import { Diorama } from "./diorama.js";

const SAVE_KEY = "outer-clock-3d-v1";
const ERAS = globalThis.ERAS;

const keys = { up: false, down: false, left: false, right: false, run: false };
let state = load();
let world;
let seqAt = 0;
let last = performance.now();
const remotes = new Map();
let peer = null;
let conns = new Map();
let isHost = false;

function load() {
  try {
    const parsed = JSON.parse(localStorage.getItem(SAVE_KEY) || "null");
    if (parsed && parsed.order) return parsed;
  } catch (err) {
    console.warn(err);
  }
  return fresh();
}

function fresh() {
  const seed = String(Date.now());
  const order = ERAS.map((era) => era.id);
  let hash = 0;
  for (const ch of seed) hash = (hash * 33 + ch.charCodeAt(0)) >>> 0;
  for (let i = order.length - 1; i > 0; i -= 1) {
    hash = (hash * 1664525 + 1013904223) >>> 0;
    const j = hash % (i + 1);
    const swap = order[i];
    order[i] = order[j];
    order[j] = swap;
  }
  const inteligencia = 1 + (hash % 10);
  const suerte = 1 + ((hash >>> 8) % 10);
  return {
    seed, order, byDate: {}, phase: "workshop", futureVisits: 0,
    flags: {}, inv: [], ambar: false, amber: null, amberUsedOn: "",
    photo: "", name: "", inside: null, inteligencia, suerte, machine: machineFrom(inteligencia, suerte)
  };
}

function machineFrom(inteligencia, suerte) {
  if (inteligencia >= 8 && suerte >= 8) return { name: "Máquina de dos coronas", hours: 72, hint: true };
  if (inteligencia >= 7) return { name: "Taller de engranajes", hours: 48, hint: true };
  if (suerte >= 7) return { name: "Reloj de arena fina", hours: 72, hint: false };
  if (inteligencia <= 3 && suerte <= 3) return { name: "Caja de latón", hours: 36, hint: false };
  return { name: "Máquina de bolsillo", hours: 48, hint: false };
}

function save() {
  localStorage.setItem(SAVE_KEY, JSON.stringify(state));
}

function todayKey() {
  const d = new Date();
  const p = (n) => String(n).padStart(2, "0");
  return d.getFullYear() + "-" + p(d.getMonth() + 1) + "-" + p(d.getDate());
}

function todayEra() {
  const today = todayKey();
  if (!state.byDate[today]) {
    const used = new Set(Object.values(state.byDate));
    state.byDate[today] = state.order.find((id) => !used.has(id)) || "eco";
    save();
  }
  return ERAS.find((era) => era.id === state.byDate[today]) || null;
}

function amberOn() {
  return state.amber && state.amber.date === todayKey() && state.amber.hour < state.machine.hours;
}

function say(who, text) {
  const box = document.getElementById("dialogue");
  box.hidden = false;
  document.getElementById("who").textContent = who;
  document.getElementById("line").textContent = text;
  document.getElementById("choices").replaceChildren();
}

function spendHour() {
  if (!amberOn()) return;
  state.amber.hour += 1;
  if (state.amber.hour >= state.machine.hours) {
    state.amber = null;
    state.amberUsedOn = todayKey();
    say("Tictac", "Se acabaron los días lentos. El mundo vuelve a su hora.");
  }
  save();
}

function complete(flag, note) {
  if (flag) state.flags[flag] = true;
  say("Tictac", note);
  save();
  renderHud();
  showPlace();
}

function has(item) {
  return state.inv.includes(item);
}

function give(item) {
  if (!has(item)) state.inv.push(item);
}

function take(item) {
  state.inv = state.inv.filter((name) => name !== item);
}

function colorsOf(era) {
  return (era && era.colors) || ["#1a120c", "#d7b56d", "#8c5a32"];
}

function lookFor(era) {
  const y = era && era.y ? era.y : "";
  if (y.indexOf("mucho") >= 0) return "cueva";
  if (y.indexOf("Ríos") >= 0) return "rio";
  if (y.indexOf("polvo") >= 0) return "polvo";
  if (y.indexOf("Burgos") >= 0) return "burgo";
  if (y.indexOf("Mareas") >= 0) return "marea";
  if (y.indexOf("Imprentas") >= 0) return "imprenta";
  if (y.indexOf("Vapor") >= 0) return "vapor";
  if (y.indexOf("Ondas") >= 0) return "ondas";
  if (y.indexOf("partida") >= 0) return "partida";
  if (y.indexOf("Después") >= 0) return "despues";
  return "taller";
}

function lookNow() {
  if (state.phase === "future") return "despues";
  if (state.phase === "play" || state.phase === "break") {
    const era = todayEra();
    return era ? lookFor(era) : "taller";
  }
  return "taller";
}

function houseNames() {
  const names = {
    cueva: ["La gruta", "El abrigo de piedra", "La hoguera"],
    rio: ["La casa del canal", "El archivo de vasijas", "La barca cubierta"],
    polvo: ["La casa blanca", "El horno", "El pozo"],
    burgo: ["El taller del burgo", "La posada", "El campanario"],
    marea: ["La cabaña del muelle", "La bodega", "El farol de proa"],
    imprenta: ["La prensa", "El cuarto del cajista", "La plaza cubierta"],
    vapor: ["La sala de calderas", "La oficina", "El andén cubierto"],
    ondas: ["La cabina", "El altillo", "La casa de la antena"],
    partida: ["El café", "El sótano", "El departamento"],
    despues: ["La calle cubierta", "El zaguán", "El archivo futuro"],
    taller: ["Tu taller", "La posada", "El archivo"]
  };
  return names[lookNow()] || names.taller;
}

function propsFor() {
  if (state.phase === "workshop" || state.phase === "workshop-return") {
    return [
      { id: "engranaje", label: "Engranaje", x: -2.2, z: 2.2, color: "#d7b56d" },
      { id: "lente", label: "Lente", x: 0, z: 2.4, color: "#9bb0d1" },
      { id: "aro", label: "Aro de latón", x: 2.2, z: 2.2, color: "#e0a15a" },
      { id: "maquina", label: "La máquina", x: 0, z: 0.4, color: "#6b5438" }
    ];
  }
  if (state.phase === "future") {
    return [
      { id: "abrigo", label: "El abrigo", x: -1.4, z: 1.2, color: "#5c5146" },
      { id: "puerta", label: "La puerta del fondo", x: 1.6, z: -0.2, color: "#2a241c" },
      { id: "volver", label: "Volver al taller", x: 3, z: 3, color: "#d7b56d" }
    ];
  }
  if (state.phase === "break") {
    return [{ id: "reloj", label: "Que mande el reloj", x: 0, z: 1.2, color: "#d7b56d" }];
  }
  const era = todayEra();
  if (!era) return [];
  if (era.puzzle === "combine") {
    return [
      { id: "a", label: era.a, x: -1.8, z: 1.6, color: era.colors[1] },
      { id: "b", label: era.b, x: 1.8, z: 1.6, color: era.colors[2] }
    ];
  }
  if (era.puzzle === "sequence") {
    return era.seq.map((label, index) => ({
      id: "s" + index, label, x: -2 + index * 1.6, z: 1.8, color: era.colors[1]
    }));
  }
  if (era.puzzle === "slow") {
    return [{ id: "hidden", label: era.hidden, x: 0.2, z: 1.2, color: "#f4efe4" }];
  }
  return [];
}

function showPlace() {
  let title = "El taller";
  let npc = "Tictac";
  let colors = ["#1a120c", "#d7b56d", "#8c5a32"];
  if (state.phase === "future") {
    title = "El futuro cercano";
    colors = ["#141820", "#8aa0b2", "#e0a15a"];
  } else if (state.phase === "play" || state.phase === "break") {
    const era = todayEra();
    if (era) {
      title = era.title;
      npc = era.npc;
      colors = colorsOf(era);
    }
  }
  world.build({
    colors,
    npc,
    look: lookNow(),
    inside: state.inside,
    houses: houseNames(),
    props: state.inside === 0 ? propsFor() : []
  });
  if (state.phase === "play") {
    const era = todayEra();
    if (era && era.puzzle === "slow") world.showProp("hidden", !state.flags[era.flag]);
  }
  world.setSlow(amberOn());
  if (state.inside != null) title = houseNames()[state.inside] || title;
  document.getElementById("title").textContent = title;
  let mission = "";
  if (state.phase === "workshop" || state.phase === "workshop-return") {
    mission = "Entrá a tu taller. Adentro juntá engranaje, lente y aro. Tu máquina es " + state.machine.name + ".";
  } else if (state.phase === "future") {
    mission = "Entrá a la primera casa. Adentro está el abrigo. No vas a ver quién.";
  } else if (state.phase === "break") {
    mission = "Entrá al taller y tocá el reloj que quedó.";
  } else {
    const era = todayEra();
    mission = era ? "Entrá a la primera casa. " + era.mission : "No quedan épocas nuevas.";
    if (era && state.machine.hint && era.puzzle === "combine") mission += " Piezas: " + era.a + " y " + era.b + ".";
    if (era && state.machine.hint && era.puzzle === "sequence") mission += " Orden: " + era.seq.join(", ") + ".";
    if (era && state.flags[era.flag]) mission += " Ya quedó hecho.";
  }
  document.getElementById("mission").textContent = mission;
}

function interact(id) {
  if (!id) return;
  if (id === "salir") {
    state.inside = null;
    save();
    showPlace();
    say("Tictac", "Otra vez en la calle. Las casas de esta época no tienen la misma forma.");
    return;
  }
  if (id.indexOf("door") === 0) {
    state.inside = Number(id.slice(4));
    save();
    showPlace();
    const names = houseNames();
    say("Tictac", "Estás en " + (names[state.inside] || "la casa") + ". " + (state.inside === 0 ? "Acá está la gente y lo que hay que buscar." : "Mirá los muebles. La misión está en la primera casa."));
    return;
  }
  if (state.phase === "workshop" || state.phase === "workshop-return") {
    if (id === "engranaje" || id === "lente" || id === "aro") {
      const name = id === "engranaje" ? "Engranaje" : id === "lente" ? "Lente" : "Aro de latón";
      give(name);
      say("Tictac", "Guardás " + name + ".");
      save();
      renderHud();
      return;
    }
    if (id === "maquina") {
      if (state.phase === "workshop-return") {
        state.inside = null;
        state.phase = "future";
        save();
        say("Tictac", "Un salto más. La cara sigue sin estar.");
        showPlace();
        return;
      }
      if (!has("Núcleo")) {
        say("Tictac", "Primero combiná las tres piezas.");
        return;
      }
      take("Núcleo");
      state.inside = null;
      state.phase = "future";
      state.futureVisits = 0;
      save();
      say("Tictac", "Un salto corto. No persigas la cara.");
      showPlace();
    }
    return;
  }
  if (state.phase === "future") {
    if (id === "abrigo") say("Vos", "Está vacío. No explica nada.");
    else if (id === "puerta") say("Vos", "Si entro, dejo de ver el cuadro. Me quedo acá.");
    else if (id === "volver") {
      state.futureVisits += 1;
      state.inside = null;
      state.phase = state.futureVisits < 2 ? "workshop-return" : (state.ambar ? "play" : "break");
      save();
      showPlace();
      say("Tictac", state.phase === "break" ? "El vidrio no da para otro salto." : "Podés saltar una vez más.");
    }
    return;
  }
  if (state.phase === "break" && id === "reloj") {
    state.ambar = true;
    state.inside = null;
    state.phase = "play";
    save();
    showPlace();
    say("Tictac", "A partir de ahora manda el reloj de afuera. Cada día, una época.");
    return;
  }
  const era = todayEra();
  if (!era || state.flags[era.flag]) {
    if (id === "npc" && era) say(era.npc, era.line);
    return;
  }
  spendHour();
  if (id === "npc") {
    say(era.npc, era.line);
    if (era.puzzle !== "dialogue") return;
    const box = document.getElementById("choices");
    era.choices.forEach((text, index) => {
      const button = document.createElement("button");
      button.type = "button";
      button.textContent = text;
      button.addEventListener("click", () => {
        spendHour();
        if (index === era.answer) complete(era.flag, "La frase queda. El futuro la va a leer.");
        else say(era.npc, "Esa frase no cambia la calle de mañana.");
      });
      box.appendChild(button);
    });
    return;
  }
  if (era.puzzle === "combine" && (id === "a" || id === "b")) {
    const item = id === "a" ? era.a : era.b;
    give(item);
    say(era.npc, "Guardás " + item + ".");
    save();
    renderHud();
    return;
  }
  if (era.puzzle === "sequence" && id.startsWith("s")) {
    const index = Number(id.slice(1));
    if (index === seqAt) {
      seqAt += 1;
      say(era.npc, era.seq[index] + ".");
      if (seqAt >= era.seq.length) {
        seqAt = 0;
        complete(era.flag, "El orden cierra.");
      }
    } else {
      seqAt = 0;
      say(era.npc, "El orden se desarma.");
    }
    return;
  }
  if (era.puzzle === "slow" && id === "hidden") {
    if (!amberOn()) {
      say(era.npc, "Se mueve. Con el ámbar, el mundo va a 1/24 y podés tomarlo.");
      return;
    }
    give(era.hidden);
    complete(era.flag, "En el día lento encontrás " + era.hidden + ".");
  }
}

function tryCombine() {
  if (state.phase === "workshop" || state.phase === "workshop-return") {
    if (has("Engranaje") && has("Lente") && has("Aro de latón")) {
      take("Engranaje");
      take("Lente");
      take("Aro de latón");
      give("Núcleo");
      say("Tictac", "El núcleo queda armado. Ponelo en la máquina.");
      save();
      renderHud();
    } else say("Tictac", "Faltan piezas del taller.");
    return;
  }
  const era = todayEra();
  if (!era || era.puzzle !== "combine" || state.flags[era.flag]) {
    say("Tictac", "Ahora no hay nada que combinar.");
    return;
  }
  spendHour();
  if (has(era.a) && has(era.b)) {
    take(era.a);
    take(era.b);
    give(era.result);
    complete(era.flag, "Combinás " + era.result + ".");
  } else say(era.npc, "Te falta una de las dos piezas.");
}

function activateAmber() {
  if (!state.ambar) {
    say("Tictac", "El ámbar aparece cuando la máquina se raja.");
    return;
  }
  if (state.amberUsedOn === todayKey()) {
    say("Tictac", "El ámbar de hoy ya se gastó.");
    return;
  }
  if (amberOn()) return;
  state.amber = { date: todayKey(), hour: 0 };
  save();
  say("Tictac", "Todos van a 1/24. Tenés " + state.machine.hours + " horas de ellos. Cada mirada gasta una.");
  showPlace();
}

function renderHud() {
  const now = new Date();
  const p = (n) => String(n).padStart(2, "0");
  document.getElementById("clock").textContent = p(now.getHours()) + ":" + p(now.getMinutes()) + ":" + p(now.getSeconds());
  const end = new Date(now);
  end.setHours(24, 0, 0, 0);
  const ms = end - now;
  document.getElementById("day-left").textContent = "Quedan " + Math.floor(ms / 3600000) + " h " + Math.floor((ms % 3600000) / 60000) + " min de este día";
  const era = state.phase === "play" ? todayEra() : null;
  document.getElementById("place-name").textContent = era ? era.title + " · " + era.y : "Outer Clock";
  if (amberOn()) {
    const hour = state.amber.hour;
    const days = Math.ceil(state.machine.hours / 24);
    document.getElementById("inner").textContent = "Día " + (Math.floor(hour / 24) + 1) + " de " + days + " · hora " + (hour % 24) + " · 1/24";
  } else {
    document.getElementById("inner").textContent = state.ambar ? "Ámbar listo" : "Sin ámbar todavía";
  }
  document.getElementById("stats").textContent = "Inteligencia " + state.inteligencia + " · Suerte " + state.suerte + ". " + state.machine.name + ".";
  const list = document.getElementById("inventory");
  list.replaceChildren();
  (state.inv.length ? state.inv : ["Las manos vacías."]).forEach((item) => {
    const li = document.createElement("li");
    li.textContent = item;
    list.appendChild(li);
  });
  const names = ["Vos"];
  remotes.forEach((person) => names.push(person.name || "Alguien"));
  document.getElementById("people").textContent = "En la plaza: " + names.join(", ");
}

function wireNet(conn) {
  conns.set(conn.peer, conn);
  conn.on("data", (data) => {
    const id = data.from || conn.peer;
    if (data.t === "pos") remotes.set(id, data);
    if (isHost) {
      const relay = { ...data, from: data.from || conn.peer };
      conns.forEach((other, otherId) => {
        if (otherId !== conn.peer && other.open) other.send(relay);
      });
    }
  });
  conn.on("close", () => {
    conns.delete(conn.peer);
    remotes.delete(conn.peer);
  });
}

function setupUi() {
  document.getElementById("combine").addEventListener("click", tryCombine);
  document.getElementById("amber").addEventListener("click", activateAmber);
  document.getElementById("hero-name").value = state.name || "";
  document.getElementById("hero-name").addEventListener("change", (event) => {
    state.name = event.target.value.slice(0, 24);
    save();
  });
  document.getElementById("photo").addEventListener("change", (event) => {
    const file = event.target.files && event.target.files[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = () => {
      state.photo = reader.result;
      world.setFace(state.photo);
      save();
    };
    reader.readAsDataURL(file);
  });
  document.getElementById("wipe").addEventListener("click", () => {
    localStorage.removeItem(SAVE_KEY);
    state = fresh();
    seqAt = 0;
    showPlace();
    renderHud();
    say("Tictac", "Partida nueva. " + state.machine.name + ".");
  });
  document.getElementById("host").addEventListener("click", () => {
    if (typeof globalThis.Peer === "undefined") {
      say("Tictac", "La sala necesita internet para el enlace de PeerJS.");
      return;
    }
    isHost = true;
    peer = new globalThis.Peer();
    peer.on("open", (id) => {
      document.getElementById("code").value = id;
      say("Tictac", "Pasale este código a quien quiera entrar en la misma plaza.");
    });
    peer.on("connection", wireNet);
  });
  document.getElementById("join").addEventListener("click", () => {
    const id = document.getElementById("code").value.trim();
    if (!id || typeof globalThis.Peer === "undefined") return;
    isHost = false;
    peer = new globalThis.Peer();
    peer.on("open", () => wireNet(peer.connect(id)));
  });
  window.addEventListener("keydown", (event) => {
    if (event.target.matches("input")) return;
    if (event.code === "KeyW" || event.code === "ArrowUp") keys.up = true;
    if (event.code === "KeyS" || event.code === "ArrowDown") keys.down = true;
    if (event.code === "KeyA" || event.code === "ArrowLeft") keys.left = true;
    if (event.code === "KeyD" || event.code === "ArrowRight") keys.right = true;
    if (event.code === "ShiftLeft") keys.run = true;
    if (event.code === "Equal" || event.code === "NumpadAdd") world.zoomBy(0.9);
    if (event.code === "Minus" || event.code === "NumpadSubtract") world.zoomBy(1.1);
    if (event.code === "KeyE") {
      const near = world.nearest(1.8);
      if (near) interact(near.userData.propId);
    }
  });
  window.addEventListener("keyup", (event) => {
    if (event.code === "KeyW" || event.code === "ArrowUp") keys.up = false;
    if (event.code === "KeyS" || event.code === "ArrowDown") keys.down = false;
    if (event.code === "KeyA" || event.code === "ArrowLeft") keys.left = false;
    if (event.code === "KeyD" || event.code === "ArrowRight") keys.right = false;
    if (event.code === "ShiftLeft") keys.run = false;
  });
  world.renderer.domElement.addEventListener("pointerdown", (event) => {
    const hit = world.pick(event.clientX, event.clientY);
    if (hit) interact(hit.userData.propId);
  });
}

function loop(now) {
  const dt = Math.min(0.05, (now - last) / 1000);
  last = now;
  world.move(dt, keys);
  world.frame(dt);
  const near = world.nearest(1.8);
  document.getElementById("prompt").textContent = near ? "E · " + near.userData.label : "W avanza, A y D giran, Shift corre. Rueda hace zoom. El mapa está abajo a la izquierda.";
  if (peer && peer.id && Math.floor(now / 120) !== Math.floor((now - dt * 1000) / 120)) {
    const msg = {
      t: "pos",
      from: peer.id,
      name: state.name || "Inventor",
      x: world.player.position.x,
      z: world.player.position.z,
      ry: world.player.rotation.y
    };
    conns.forEach((conn) => { if (conn.open) conn.send(msg); });
    world.setRemotes([...remotes.entries()].map(([id, person]) => ({ id, ...person })));
  }
  renderHud();
  requestAnimationFrame(loop);
}

world = new Diorama(document.getElementById("view"));
if (state.photo) world.setFace(state.photo);
setupUi();
showPlace();
say("Tictac", "Caminá por la plaza. " + state.machine.name + ". Inteligencia " + state.inteligencia + ", suerte " + state.suerte + ".");
requestAnimationFrame(loop);
