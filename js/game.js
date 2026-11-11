const SAVE_KEY = "outer-clock-web-v1";

const LINES = [
  "En el taller todavía huele a metal caliente.",
  "Armás la máquina con tres piezas que no sirven sueltas.",
  "El futuro te muestra el final, y esconde la cara de quien lo empuja.",
  "El vidrio se raja. Afuera, el reloj sigue. Cada día, una sola época."
];

let state = load();
let selected = [];
let seqAt = 0;
let lineAt = 0;
let toastTimer = 0;

const intro = document.getElementById("intro");
const shell = document.getElementById("shell");
const introLine = document.getElementById("intro-line");
const enterBtn = document.getElementById("enter");

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
  return {
    seed,
    order,
    byDate: {},
    phase: "workshop",
    futureVisits: 0,
    flags: {},
    inv: [],
    ambar: false,
    brujula: false,
    amber: null,
    amberUsedOn: "",
    photo: "",
    name: "",
    picked: [],
    inteligencia: 0,
    suerte: 0,
    machine: null
  };
}

function rollStat() {
  return 1 + Math.floor(Math.random() * 10);
}

function machineFrom(inteligencia, suerte) {
  if (inteligencia >= 8 && suerte >= 8) {
    return { id: "coronas", name: "Máquina de dos coronas", hours: 72, hint: true, note: "El ámbar dura tres días de ellos y la misión dice las piezas." };
  }
  if (inteligencia >= 7) {
    return { id: "engranajes", name: "Taller de engranajes", hours: 48, hint: true, note: "Ves qué objetos hay que unir." };
  }
  if (suerte >= 7) {
    return { id: "arena", name: "Reloj de arena fina", hours: 72, hint: false, note: "La suerte estira el ámbar a tres días de ellos." };
  }
  if (inteligencia <= 3 && suerte <= 3) {
    return { id: "caja", name: "Caja de latón", hours: 36, hint: false, note: "Una caja corta. El ámbar alcanza para un día y medio." };
  }
  return { id: "bolsillo", name: "Máquina de bolsillo", hours: 48, hint: false, note: "Un salto por día y dos días lentos con el ámbar." };
}

function ensureCharacter() {
  const missing = !state.inteligencia || !state.suerte || !state.machine;
  if (!state.inteligencia) state.inteligencia = rollStat();
  if (!state.suerte) state.suerte = rollStat();
  if (!state.machine) state.machine = machineFrom(state.inteligencia, state.suerte);
  if (missing) save();
}

function amberHours() {
  ensureCharacter();
  return state.machine.hours;
}

function save() {
  const copy = { ...state, photo: state.photo };
  localStorage.setItem(SAVE_KEY, JSON.stringify(copy));
}

function todayKey() {
  const d = new Date();
  return [d.getFullYear(), d.getMonth() + 1, d.getDate()].map((n, i) => i ? String(n).padStart(2, "0") : String(n)).join("-");
}

function eraById(id) {
  return ERAS.find((era) => era.id === id);
}

function todayEra() {
  const today = todayKey();
  if (!state.byDate[today]) {
    const used = new Set(Object.values(state.byDate));
    const next = state.order.find((id) => !used.has(id));
    state.byDate[today] = next || "eco";
    save();
  }
  return eraById(state.byDate[today]);
}

function dayFraction() {
  const now = new Date();
  const passed = now.getHours() * 3600 + now.getMinutes() * 60 + now.getSeconds();
  return passed / 86400;
}

function remainingText() {
  const now = new Date();
  const end = new Date(now);
  end.setHours(24, 0, 0, 0);
  const ms = end - now;
  const h = Math.floor(ms / 3600000);
  const m = Math.floor((ms % 3600000) / 60000);
  return "Quedan " + h + " h " + m + " min para que este día se cierre";
}

function clockText() {
  const now = new Date();
  return [now.getHours(), now.getMinutes(), now.getSeconds()].map((n) => String(n).padStart(2, "0")).join(":");
}

function amberOn() {
  return state.amber && state.amber.date === todayKey() && state.amber.hour < amberHours();
}

function innerText() {
  if (!amberOn()) return state.ambar ? "Ámbar listo. El mundo todavía va a tiempo normal." : "Todavía no tenés el ámbar.";
  const hour = state.amber.hour;
  const span = amberHours();
  const day = Math.floor(hour / 24) + 1;
  const days = Math.ceil(span / 24);
  const h = hour % 24;
  return "Día " + day + " de " + days + " · hora " + h + " · todos van a 1/24";
}

function say(who, text) {
  const box = document.getElementById("dialogue");
  box.hidden = false;
  document.getElementById("dialogue-who").textContent = who;
  document.getElementById("dialogue-text").textContent = text;
  document.getElementById("choices").replaceChildren();
}

function toast(text) {
  const el = document.getElementById("toast");
  el.textContent = text;
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => { el.textContent = ""; }, 4200);
}

function spendHour() {
  if (!amberOn()) return true;
  state.amber.hour += 1;
  if (state.amber.hour >= amberHours()) {
    state.amber = null;
    state.amberUsedOn = todayKey();
    toast("Se acabaron los dos días de ellos. El mundo vuelve a su hora.");
  }
  save();
  paintClock();
  return true;
}

function complete(flag, note) {
  if (flag) state.flags[flag] = true;
  toast(note);
  save();
  render();
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

function renderHotspots(spots) {
  const box = document.getElementById("hotspots");
  box.replaceChildren();
  spots.forEach((spot) => {
    const button = document.createElement("button");
    button.type = "button";
    button.className = "spot";
    button.textContent = spot.label;
    button.addEventListener("click", () => spot.onClick());
    box.appendChild(button);
  });
}

function futureCopy() {
  const flags = state.flags;
  if (state.futureVisits === 0) {
    return {
      title: "El futuro cercano",
      place: "Una calle mojada. Alcanzás a ver un abrigo en el suelo. El golpe viene de fuera del cuadro.",
      line: "No hay cara. Hay un ruido seco y el mundo se apaga."
    };
  }
  if (flags.documento_salvado || flags.diario || flags.guardia) {
    return {
      title: "La misma calle, cambiada",
      place: "Hay flores en la vereda y el farol está entero. El estruendo es otro: más lejos, detrás de una puerta cerrada.",
      line: "Seguís sin ver quién. Pero la calle ya no es la de la primera vez."
    };
  }
  return {
    title: "Otra forma del final",
    place: "La calle está tapiada. Esta vez no es un disparo: es un estallido detrás de un muro, y tampoco ves la mano.",
    line: "La máquina no aguanta un tercer salto."
  };
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

const LOOK_NAME = {
  cueva: "Cueva y ocre",
  rio: "Adobe y canal",
  polvo: "Polvo y olivo",
  burgo: "Piedra y campana",
  marea: "Madera y sal",
  imprenta: "Papel y plomo",
  vapor: "Hollín y vapor",
  ondas: "Cables y noche",
  partida: "Ciudad gris",
  despues: "Latón frío",
  taller: "Taller de latón"
};

function renderScene(title, when, place, image, spots, slow, look) {
  document.getElementById("scene-title").textContent = title;
  document.getElementById("scene-when").textContent = when + (look ? " · " + (LOOK_NAME[look] || look) : "");
  document.getElementById("scene-place").textContent = place;
  const bg = document.getElementById("scene-bg");
  const scene = document.getElementById("scene");
  scene.dataset.look = look || "taller";
  scene.classList.toggle("slow", slow);
  if (image) {
    bg.style.backgroundImage = "linear-gradient(90deg, rgba(12,9,7,.72), rgba(12,9,7,.15)), url(" + image + ")";
  } else {
    bg.style.backgroundImage = imageGradient();
  }
  renderHotspots(spots);
}

function imageGradient() {
  const era = todayEra();
  const colors = (era && era.colors) || ["#1a120c", "#d7b56d", "#3a2418"];
  return "linear-gradient(160deg, " + colors[0] + ", " + colors[1] + " 55%, " + colors[2] + ")";
}

function renderWorkshop() {
  const spots = [
    { label: "Mesa: engranaje", onClick: () => pickPart("Engranaje") },
    { label: "Estante: lente", onClick: () => pickPart("Lente") },
    { label: "Cajón: aro de latón", onClick: () => pickPart("Aro de latón") },
    { label: "La máquina", onClick: installCore }
  ];
  renderScene("El taller", "Hoy, antes de que el reloj mande", "Tres piezas, una máquina, y una foto si querés prestarle tu cara. La tuya es " + state.machine.name + ".", "img/taller.jpg", spots, false, "taller");
  document.getElementById("mission").textContent = "Armá el núcleo: engranaje, lente y aro. Después encendé la máquina.";
  say("Tictac", "Soy el pájaro del reloj. Mirá, tomá, combiná. El futuro no se apura.");
}

function pickPart(name) {
  if (!state.picked.includes(name)) state.picked.push(name);
  give(name);
  toast("Tomás " + name + ".");
  save();
  renderInventory();
}

function installCore() {
  if (!has("Núcleo")) {
    say("Tictac", "Ahí no entra un montón de piezas sueltas. Combinalas primero.");
    return;
  }
  take("Núcleo");
  state.phase = "future";
  state.futureVisits = 0;
  save();
  render();
  say("Tictac", "Listo. Un salto corto. No persigas la cara.");
}

function renderFuture() {
  const copy = futureCopy();
  renderScene(copy.title, "Dentro de poco", copy.place, "img/futuro.jpg", [
    { label: "El abrigo en el suelo", onClick: () => say("Vos", "Está vacío. No explica nada.") },
    { label: "La puerta del fondo", onClick: () => say("Vos", "Si entro, dejo de ver el cuadro. Me quedo acá.") },
    { label: "Volver al taller", onClick: returnFromFuture }
  ], false, "despues");
  document.getElementById("mission").textContent = "Mirá. No vas a ver quién. Después volvé.";
  say("Tictac", copy.line);
}

function returnFromFuture() {
  state.futureVisits += 1;
  if (state.futureVisits < 2) state.phase = "workshop-return";
  else state.phase = state.brujula ? "play" : "break";
  save();
  render();
}

function renderReturn() {
  renderScene("El taller, otra vez", "La máquina todavía responde", "Podés saltar una vez más. Tu máquina es " + state.machine.name + ". " + state.machine.note, "img/taller.jpg", [
    { label: "Saltar otra vez", onClick: () => { state.phase = "future"; save(); render(); } }
  ], false, "taller");
  document.getElementById("mission").textContent = "Un salto más. Después el vidrio no da para otro.";
  say("Tictac", "Si insistís, la muerte cambia de forma. La cara sigue sin estar.");
}

function renderBreak() {
  state.ambar = true;
  state.brujula = true;
  save();
  renderScene("La máquina se raja", "A partir de ahora manda el reloj de la pared", "Te quedan el ámbar y la brújula. Con " + state.machine.name + " el mundo va a 1/24 durante " + amberHours() + " horas de ellos.", "img/taller.jpg", [
    {
      label: "Que mande el reloj",
      onClick: () => {
        state.phase = "play";
        save();
        render();
      }
    }
  ], false, "taller");
  document.getElementById("mission").textContent = "Entrá en la época de hoy.";
  say("Tictac", "No elijas el siglo. Dejalo que lo elija la fecha.");
}

function renderEra() {
  const era = todayEra();
  if (!era) {
    renderScene("Eco del taller", "Las cien épocas ya tuvieron su día", "El reloj sigue. No queda una época nueva.", "img/taller.jpg", [], false, "taller");
    document.getElementById("mission").textContent = "Esperar otra fecha no alcanza: el mapa ya está recorrido.";
    return;
  }
  const done = !!state.flags[era.flag];
  const spots = [{ label: era.npc, onClick: () => talk(era) }];
  if (era.puzzle === "combine") {
    spots.push({ label: era.a, onClick: () => pocket(era.a) });
    spots.push({ label: era.b, onClick: () => pocket(era.b) });
  } else if (era.puzzle === "sequence") {
    era.seq.forEach((label, index) => spots.push({ label, onClick: () => tapSequence(era, index) }));
  } else if (era.puzzle === "slow") {
    spots.push({
      label: amberOn() ? era.hidden : "Algo que no se queda quieto",
      onClick: () => searchHidden(era)
    });
  }
  const look = lookFor(era);
  renderScene(era.title, era.y + (done ? " · hecho" : ""), era.place, null, spots, amberOn(), look);
  let mission = era.mission + (done ? " Ya quedó en la bitácora." : "");
  if (!done && state.machine.hint && era.puzzle === "combine") mission += " Piezas: " + era.a + " y " + era.b + ".";
  if (!done && state.machine.hint && era.puzzle === "sequence") mission += " Orden: " + era.seq.join(", ") + ".";
  document.getElementById("mission").textContent = mission;
  if (!done) say(era.npc, era.line);
}

function talk(era) {
  if (!spendHour()) return;
  say(era.npc, era.line);
  if (era.puzzle !== "dialogue" || state.flags[era.flag]) return;
  const box = document.getElementById("choices");
  era.choices.forEach((text, index) => {
    const button = document.createElement("button");
    button.type = "button";
    button.className = "choice";
    button.textContent = text;
    button.addEventListener("click", () => {
      if (!spendHour()) return;
      if (index === era.answer) complete(era.flag, "La frase queda. El futuro la va a leer.");
      else toast("Esa frase no cambia la calle de mañana.");
    });
    box.appendChild(button);
  });
}

function pocket(item) {
  if (!spendHour()) return;
  if (has(item)) {
    toast("Ya lo tenés.");
    return;
  }
  give(item);
  toast("Guardás " + item + ".");
  save();
  renderInventory();
}

function tapSequence(era, index) {
  if (state.flags[era.flag]) return;
  if (!spendHour()) return;
  if (index === seqAt) {
    seqAt += 1;
    toast(era.seq[index] + ".");
    if (seqAt >= era.seq.length) {
      seqAt = 0;
      complete(era.flag, "El orden cierra. Algo del futuro se mueve.");
    }
  } else {
    seqAt = 0;
    toast("El orden se desarma. Hay que empezar de nuevo.");
  }
}

function searchHidden(era) {
  if (state.flags[era.flag]) return;
  if (!amberOn()) {
    say(era.npc, "Se mueve. Con el mundo a tiempo normal no llegás a tomarlo.");
    return;
  }
  if (!spendHour()) return;
  give(era.hidden);
  complete(era.flag, "En el día lento encontrás " + era.hidden + ".");
}

function tryCombine() {
  if (state.phase === "workshop" || state.phase === "workshop-return") {
    if (has("Engranaje") && has("Lente") && has("Aro de latón")) {
      take("Engranaje");
      take("Lente");
      take("Aro de latón");
      give("Núcleo");
      toast("El núcleo queda armado.");
      save();
      renderInventory();
      say("Tictac", "Ahora sí. Ponelo en la máquina.");
    } else toast("En el taller hacen falta las tres piezas.");
    return;
  }
  const era = todayEra();
  if (!era || era.puzzle !== "combine" || state.flags[era.flag]) {
    toast("Ahora no hay nada que combinar.");
    return;
  }
  if (has(era.a) && has(era.b)) {
    take(era.a);
    take(era.b);
    give(era.result);
    complete(era.flag, "Combinás " + era.result + ".");
  } else toast("Te falta una de las dos piezas de esta época.");
}

function activateAmber() {
  if (!state.ambar) return;
  if (state.amberUsedOn === todayKey()) {
    toast("El ámbar de hoy ya se gastó.");
    return;
  }
  if (amberOn()) return;
  state.amber = { date: todayKey(), hour: 0 };
  save();
  toast("El mundo pasa a 1/24. Tenés dos días de ellos, y cada mirada gasta una hora.");
  render();
}

function renderInventory() {
  const list = document.getElementById("inventory");
  list.replaceChildren();
  if (!state.inv.length) {
    const empty = document.createElement("li");
    empty.textContent = "Las manos vacías.";
    list.appendChild(empty);
    return;
  }
  state.inv.forEach((item) => {
    const li = document.createElement("li");
    li.textContent = item;
    list.appendChild(li);
  });
}

function renderGadgets() {
  const list = document.getElementById("gadgets");
  list.replaceChildren();
  const ambar = document.createElement("li");
  const amberBtn = document.createElement("button");
  amberBtn.type = "button";
  amberBtn.className = "spot";
  amberBtn.textContent = state.ambar ? "Ámbar de los lentos" : "Ámbar (en la máquina rota)";
  amberBtn.disabled = !state.ambar;
  amberBtn.addEventListener("click", activateAmber);
  ambar.appendChild(amberBtn);
  list.appendChild(ambar);
  const compass = document.createElement("li");
  compass.textContent = state.brujula ? "Brújula de fechas: abre el mapa y no deja repetir un día." : "Brújula (cuando el vidrio se raje)";
  list.appendChild(compass);
  const coat = document.createElement("li");
  coat.textContent = state.flags.abrigo ? "Abrigo de polvo puesto." : "Abrigo de polvo: está en una de las cien épocas.";
  list.appendChild(coat);
}

function renderStats() {
  ensureCharacter();
  const el = document.getElementById("stats");
  if (!el) return;
  el.textContent = "Inteligencia " + state.inteligencia + " · Suerte " + state.suerte + ". " + state.machine.name + ". " + state.machine.note;
}

function renderJournal() {
  const flags = Object.keys(state.flags);
  document.getElementById("journal").textContent = flags.length
    ? flags.length + " elecciones guardadas. La calle del futuro lee estas fichas."
    : "Todavía no hay fichas. Cada misión deja una.";
  document.getElementById("portrait").classList.toggle("coat", !!state.flags.abrigo);
  document.querySelector(".portrait").classList.toggle("coat", !!state.flags.abrigo);
}

function paintClock() {
  document.getElementById("clock-time").textContent = clockText();
  document.getElementById("day-left").textContent = remainingText();
  document.getElementById("day-bar").style.width = (dayFraction() * 100) + "%";
  document.getElementById("inner-clock").textContent = innerText();
}

function renderAtlas() {
  const grid = document.getElementById("atlas-grid");
  const today = todayEra();
  grid.replaceChildren();
  document.getElementById("atlas-note").textContent = state.brujula
    ? "Hoy se puede entrar en una. Las otras son memoria o días que todavía no llegaron."
    : "La brújula aparece cuando la máquina se rompe.";
  ERAS.forEach((era) => {
    const cell = document.createElement("button");
    cell.type = "button";
    cell.className = "era-cell";
    if (today && era.id === today.id && state.phase === "play") cell.classList.add("today");
    if (state.flags[era.flag]) cell.classList.add("done");
    cell.style.background = "linear-gradient(160deg," + era.colors[0] + "," + era.colors[1] + ")";
    const title = document.createElement("strong");
    title.textContent = era.title;
    const meta = document.createElement("small");
    meta.textContent = era.y + " · " + era.npc;
    cell.append(title, meta);
    cell.addEventListener("click", () => {
      say(era.npc, era.line + " Misión: " + era.mission);
      if (state.phase === "play" && today && era.id === today.id) {
        document.getElementById("atlas").hidden = true;
        renderEra();
      }
    });
    grid.appendChild(cell);
  });
}

function render() {
  ensureCharacter();
  if (state.phase === "workshop") renderWorkshop();
  else if (state.phase === "future") renderFuture();
  else if (state.phase === "workshop-return") renderReturn();
  else if (state.phase === "break") renderBreak();
  else renderEra();
  renderInventory();
  renderGadgets();
  renderJournal();
  renderStats();
  paintClock();
  const retry = document.getElementById("retry-future");
  retry.hidden = state.phase !== "play";
}

function bootIntro() {
  const timer = setInterval(() => {
    lineAt = (lineAt + 1) % LINES.length;
    introLine.textContent = LINES[lineAt];
  }, 3200);
  enterBtn.addEventListener("click", () => {
    clearInterval(timer);
    intro.hidden = true;
    shell.hidden = false;
    render();
  });
}

document.getElementById("combine").addEventListener("click", tryCombine);
document.getElementById("atlas-open").addEventListener("click", () => {
  if (!state.brujula) {
    toast("La brújula sigue dentro de la máquina.");
    return;
  }
  renderAtlas();
  document.getElementById("atlas").hidden = false;
});
document.getElementById("atlas-close").addEventListener("click", () => {
  document.getElementById("atlas").hidden = true;
});
document.getElementById("wipe").addEventListener("click", () => {
  localStorage.removeItem(SAVE_KEY);
  state = fresh();
  document.getElementById("portrait").src = "img/inventor.jpg";
  document.getElementById("hero-name").value = "";
  render();
});
document.getElementById("retry-future").addEventListener("click", () => {
  state.phase = "future";
  save();
  render();
});
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
    const image = new Image();
    image.onload = () => {
      const canvas = document.createElement("canvas");
      canvas.width = 240;
      canvas.height = 300;
      const ctx = canvas.getContext("2d");
      const scale = Math.max(canvas.width / image.width, canvas.height / image.height);
      const w = image.width * scale;
      const h = image.height * scale;
      ctx.drawImage(image, (canvas.width - w) / 2, (canvas.height - h) / 2, w, h);
      state.photo = canvas.toDataURL("image/jpeg", 0.72);
      document.getElementById("portrait").src = state.photo;
      save();
    };
    image.src = reader.result;
  };
  reader.readAsDataURL(file);
});
if (state.photo) document.getElementById("portrait").src = state.photo;

setInterval(paintClock, 1000);
bootIntro();
