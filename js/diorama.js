import * as THREE from "three";

function makeTexture(paint, w = 128, h = 128) {
  const canvas = document.createElement("canvas");
  canvas.width = w;
  canvas.height = h;
  paint(canvas.getContext("2d"), w, h);
  const tex = new THREE.CanvasTexture(canvas);
  tex.colorSpace = THREE.SRGBColorSpace;
  tex.wrapS = THREE.RepeatWrapping;
  tex.wrapT = THREE.RepeatWrapping;
  tex.anisotropy = 8;
  return tex;
}

function shade(hex, amount) {
  const n = parseInt(hex.slice(1), 16);
  const f = (c) => Math.max(0, Math.min(255, c + amount));
  const r = f((n >> 16) & 255);
  const g = f((n >> 8) & 255);
  const b = f(n & 255);
  return "#" + [r, g, b].map((v) => v.toString(16).padStart(2, "0")).join("");
}

function wallTexture(kind, color) {
  return makeTexture((g, w, h) => {
    g.fillStyle = color;
    g.fillRect(0, 0, w, h);
    if (kind === "rock") {
      for (let i = 0; i < 18; i += 1) {
        g.fillStyle = shade(color, i % 2 ? 28 : -24);
        g.beginPath();
        g.ellipse(20 + (i * 37) % 100, 16 + (i * 23) % 90, 18, 12, i, 0, 7);
        g.fill();
      }
    } else if (kind === "adobe" || kind === "plaster") {
      for (let y = 0; y < h; y += 16) {
        g.fillStyle = shade(color, y % 32 ? 12 : -10);
        g.fillRect(0, y, w, 14);
      }
    } else if (kind === "stone" || kind === "brick" || kind === "concrete") {
      const bh = kind === "brick" ? 14 : 22;
      for (let y = 0; y < h; y += bh + 3) {
        const off = (y / (bh + 3)) % 2 ? 20 : 0;
        for (let x = -20; x < w; x += 40) {
          g.fillStyle = shade(color, ((x + y) % 50) - 18);
          g.fillRect(x + off, y, 36, bh);
        }
      }
    } else if (kind === "plank" || kind === "siding" || kind === "timber") {
      for (let x = 0; x < w; x += 16) {
        g.fillStyle = shade(color, x % 32 ? 16 : -18);
        g.fillRect(x, 0, 14, h);
      }
      if (kind === "timber") {
        g.fillStyle = "#3a2414";
        g.fillRect(0, 0, w, 8);
        g.fillRect(0, h / 2, w, 8);
        g.fillRect(0, 0, 8, h);
        g.fillRect(w - 8, 0, 8, h);
      }
    } else {
      g.strokeStyle = shade(color, -30);
      g.lineWidth = 3;
      g.strokeRect(8, 8, w - 16, h - 16);
    }
  });
}

const STYLE = {
  cueva: { roof: "dome", roofKind: "rock", wall: "rock", floor: "dirt", h: 1.6, w: 3.4, d: 2.8 },
  rio: { roof: "flat", roofKind: "adobe", wall: "adobe", floor: "clay", h: 2.3, w: 3.6, d: 2.6 },
  polvo: { roof: "tile", roofKind: "adobe", wall: "plaster", floor: "dust", h: 2.5, w: 2.8, d: 3.3 },
  burgo: { roof: "steep", roofKind: "stone", wall: "stone", floor: "cobble", h: 3.3, w: 2.6, d: 3.5 },
  marea: { roof: "thatch", roofKind: "plank", wall: "plank", floor: "sand", h: 1.8, w: 3.8, d: 2.2, stilts: true },
  imprenta: { roof: "gable", roofKind: "timber", wall: "timber", floor: "board", h: 2.8, w: 3.1, d: 3.1 },
  vapor: { roof: "shed", roofKind: "brick", wall: "brick", floor: "ash", h: 3.5, w: 4.4, d: 2.4 },
  ondas: { roof: "flat", roofKind: "siding", wall: "siding", floor: "board", h: 2.2, w: 2.5, d: 2.4, antenna: true },
  partida: { roof: "broken", roofKind: "concrete", wall: "concrete", floor: "rubble", h: 2.7, w: 3.3, d: 2.9 },
  despues: { roof: "glass", roofKind: "panel", wall: "panel", floor: "tile", h: 3.1, w: 2.9, d: 2.9 },
  taller: { roof: "gable", roofKind: "brick", wall: "brick", floor: "board", h: 2.7, w: 3.8, d: 3.1 }
};

function floorTexture(kind, color) {
  return makeTexture((g, w, h) => {
    g.fillStyle = color;
    g.fillRect(0, 0, w, h);
    for (let i = 0; i < w; i += 8) {
      g.fillStyle = shade(color, (i % 16) ? 10 : -14);
      if (kind === "board") g.fillRect(i, 0, 6, h);
      else g.fillRect(0, i, w, 6);
    }
  });
}

function matte(color, map) {
  const material = new THREE.MeshLambertMaterial({ color, map });
  return material;
}

function makePerson(coat) {
  const group = new THREE.Group();
  const cloth = matte(coat);
  const skin = matte("#e6c4a0");
  const body = new THREE.Mesh(new THREE.BoxGeometry(0.46, 0.62, 0.28), cloth);
  body.position.y = 0.78;
  const head = new THREE.Mesh(new THREE.BoxGeometry(0.34, 0.34, 0.32), skin);
  head.position.y = 1.28;
  head.name = "head";
  const legL = new THREE.Mesh(new THREE.BoxGeometry(0.12, 0.36, 0.12), matte("#2a241c"));
  const legR = legL.clone();
  legL.position.set(-0.1, 0.28, 0);
  legR.position.set(0.1, 0.28, 0);
  group.add(body, head, legL, legR);
  group.userData.legs = [legL, legR];
  group.userData.head = head;
  return group;
}

export class Diorama {
  constructor(parent) {
    this.parent = parent;
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(32, 1, 0.1, 180);
    this.renderer = new THREE.WebGLRenderer({ antialias: true });
    this.renderer.setClearColor(0x120e0b);
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, 2));
    parent.appendChild(this.renderer.domElement);
    this.scene.add(new THREE.HemisphereLight(0xffe2b0, 0x3a2a22, 0.85));
    this.sun = new THREE.DirectionalLight(0xffc98a, 1.35);
    this.sun.position.set(8, 14, 6);
    this.scene.add(this.sun);
    this.place = new THREE.Group();
    this.scene.add(this.place);
    this.player = makePerson("#8c5a32");
    this.player.position.set(0, 0, 5);
    this.scene.add(this.player);
    this.remotes = new Map();
    this.props = [];
    this.slow = false;
    this.zoom = 1;
    this.birds = [];
    this.animal = null;
    this.bob = 0;
    this._onResize = () => this.resize();
    window.addEventListener("resize", this._onResize);
    this.resize();
    parent.addEventListener("wheel", (event) => {
      event.preventDefault();
      this.zoomBy(event.deltaY > 0 ? 1.08 : 0.92);
    }, { passive: false });
  }

  zoomBy(factor) {
    this.zoom = Math.max(0.4, Math.min(2.5, (this.zoom || 1) * factor));
  }

  resize() {
    const w = this.parent.clientWidth || window.innerWidth;
    const h = this.parent.clientHeight || window.innerHeight;
    this.camera.aspect = w / h;
    this.camera.updateProjectionMatrix();
    this.renderer.setSize(w, h, false);
    this.renderer.domElement.style.width = w + "px";
    this.renderer.domElement.style.height = h + "px";
  }

  setSlow(on) {
    this.slow = on;
  }

  setFace(dataUrl) {
    const image = new Image();
    image.onload = () => {
      const tex = makeTexture((g, w, h) => {
        g.drawImage(image, 0, 0, w, h);
      }, 64, 64);
      this.player.userData.head.material = matte("#ffffff", tex);
    };
    image.src = dataUrl;
  }

  clearPlace() {
    for (const child of [...this.place.children]) {
      child.traverse((obj) => {
        if (obj.geometry) obj.geometry.dispose();
        if (obj.material && obj.material.map) obj.material.map.dispose();
        if (obj.material) obj.material.dispose();
      });
      this.place.remove(child);
    }
    this.props = [];
  }

  build(spec) {
    this.clearPlace();
    this.npc = null;
    this.hands = null;
    this.birds = [];
    this.animal = null;
    this.inside = spec.inside;
    this.limit = spec.inside == null ? 20 : 3.3;
    const style = STYLE[spec.look] || STYLE.taller;
    const [ground, roof, wall] = spec.colors;
    this.scene.background = new THREE.Color(spec.inside == null ? "#7eb0c8" : ground);
    this.scene.fog = new THREE.Fog(spec.inside == null ? "#9ec4d4" : ground, spec.inside == null ? 28 : 9, spec.inside == null ? 78 : 14);
    if (spec.inside == null) this._street(spec, style, ground, roof, wall);
    else this._room(spec, style, ground, roof, wall);
    this.player.position.set(0, 0, spec.inside == null ? 6 : 2.4);
  }

  _street(spec, style, ground, roof, wall) {
    const sea = new THREE.Mesh(new THREE.CircleGeometry(70, 48), matte("#3e7f96"));
    sea.rotation.x = -Math.PI / 2;
    sea.position.y = -0.35;
    const beach = new THREE.Mesh(new THREE.CircleGeometry(24, 40), matte("#e4d2a8"));
    beach.rotation.x = -Math.PI / 2;
    beach.position.y = -0.08;
    const grass = floorTexture(style.floor, ground);
    grass.repeat.set(10, 10);
    const island = new THREE.Mesh(new THREE.CircleGeometry(20, 40), matte("#ffffff", grass));
    island.rotation.x = -Math.PI / 2;
    island.position.y = 0;
    this.place.add(sea, beach, island);
    this._mountain(spec.look, roof);
    const spots = [[-6.2, -4.2], [5.4, -5.1], [-1.2, 5.2]];
    spots.forEach(([x, z], index) => {
      const house = this._house(style, wall, roof, index);
      house.position.set(x, 0, z);
      this.place.add(house);
      const door = new THREE.Mesh(new THREE.BoxGeometry(0.7, 1.3, 0.12), matte("#4a3428"));
      door.position.set(x, 0.7, z + style.d / 2 + 0.08);
      door.userData.propId = "door" + index;
      door.userData.label = "Entrar a " + (spec.houses[index] || "la casa");
      this.place.add(door);
      this.props.push(door);
    });
    this._clockTower(spec.look);
    this._outdoorsLife(style, ground, roof);
    this._age(spec.look, roof, wall);
  }

  _house(style, wall, roof, index) {
    const group = new THREE.Group();
    const w = style.w * (index === 1 ? 1.25 : index === 2 ? 0.82 : 1);
    const h = style.h * (index === 2 ? 1.35 : 1);
    const d = style.d;
    const y0 = style.stilts ? 0.7 : 0;
    if (style.stilts) {
      for (const [sx, sz] of [[-0.8, -0.6], [0.8, -0.6], [-0.8, 0.6], [0.8, 0.6]]) {
        const post = new THREE.Mesh(new THREE.CylinderGeometry(0.08, 0.1, 0.7, 6), matte("#6b4a2a"));
        post.position.set(sx, 0.35, sz);
        group.add(post);
      }
    }
    const walls = new THREE.Mesh(
      new THREE.BoxGeometry(w, h, d),
      matte("#ffffff", wallTexture(style.wall, wall))
    );
    walls.position.y = y0 + h / 2;
    group.add(walls);
    const roofMat = matte("#ffffff", wallTexture(style.roofKind, roof));
    let top;
    if (style.roof === "dome") top = new THREE.Mesh(new THREE.SphereGeometry(w * 0.42, 16, 10, 0, Math.PI * 2, 0, Math.PI / 2), roofMat);
    else if (style.roof === "flat" || style.roof === "glass") top = new THREE.Mesh(new THREE.BoxGeometry(w + 0.3, 0.18, d + 0.3), roofMat);
    else if (style.roof === "thatch") top = new THREE.Mesh(new THREE.ConeGeometry(w * 0.62, 1.3, 8), roofMat);
    else if (style.roof === "shed") top = new THREE.Mesh(new THREE.BoxGeometry(w + 0.2, 0.25, d), roofMat);
    else top = new THREE.Mesh(new THREE.ConeGeometry(w * 0.72, style.roof === "steep" ? 2.1 : 1.15, 4), roofMat);
    top.position.y = y0 + h + 0.45;
    if (style.roof === "gable" || style.roof === "steep" || style.roof === "tile") top.rotation.y = Math.PI / 4;
    if (style.roof === "shed") top.rotation.z = 0.18;
    if (style.roof === "broken") top.position.x = 0.35;
    group.add(top);
    if (style.antenna) {
      const pole = new THREE.Mesh(new THREE.CylinderGeometry(0.03, 0.03, 1.4, 6), matte("#d7b56d"));
      pole.position.y = y0 + h + 1.2;
      group.add(pole);
    }
    return group;
  }

  _room(spec, style, ground, roof, wall) {
    const floor = new THREE.Mesh(new THREE.PlaneGeometry(8, 8), matte("#ffffff", floorTexture(style.floor, shade(ground, 20))));
    floor.rotation.x = -Math.PI / 2;
    this.place.add(floor);
    const wallMat = matte("#ffffff", wallTexture(style.wall, wall));
    const h = 3;
    const parts = [
      [8, h, 0.18, 0, h / 2, -4],
      [0.18, h, 8, -4, h / 2, 0],
      [0.18, h, 8, 4, h / 2, 0],
      [3.2, h, 0.18, -2.3, h / 2, 4],
      [3.2, h, 0.18, 2.3, h / 2, 4]
    ];
    parts.forEach(([bw, bh, bd, x, y, z]) => {
      const mesh = new THREE.Mesh(new THREE.BoxGeometry(bw, bh, bd), wallMat);
      mesh.position.set(x, y, z);
      this.place.add(mesh);
    });
    const ceil = new THREE.Mesh(new THREE.PlaneGeometry(8, 8), matte(shade(roof, -20)));
    ceil.rotation.x = Math.PI / 2;
    ceil.position.y = h;
    this.place.add(ceil);
    this._furniture(style, roof);
    this._indoorsLife(roof);
    const exit = new THREE.Mesh(new THREE.BoxGeometry(0.9, 1.6, 0.1), matte("#4a3428"));
    exit.position.set(0, 0.8, 3.7);
    exit.userData.propId = "salir";
    exit.userData.label = "Salir a la calle";
    this.place.add(exit);
    this.props.push(exit);
    if (spec.inside === 0) {
      const npc = makePerson("#c4552a");
      npc.position.set(0, 0, -1.6);
      npc.userData.propId = "npc";
      npc.userData.label = spec.npc;
      this.place.add(npc);
      this.npc = npc;
      spec.props.forEach((prop, index) => {
        const mesh = new THREE.Mesh(new THREE.BoxGeometry(0.38, 0.28, 0.38), matte(prop.color || roof));
        mesh.position.set(-1.2 + index * 0.8, 0.72, -0.2);
        mesh.userData.propId = prop.id;
        mesh.userData.label = prop.label;
        this.place.add(mesh);
        this.props.push(mesh);
      });
    }
  }

  _furniture(style, roof) {
    const wood = matte("#6b4a2a");
    const top = new THREE.Mesh(new THREE.BoxGeometry(1.4, 0.08, 0.7), matte(roof));
    top.position.set(-1.6, 0.72, -2.4);
    const leg = new THREE.Mesh(new THREE.BoxGeometry(0.08, 0.64, 0.08), wood);
    leg.position.set(-2.1, 0.32, -2.6);
    this.place.add(top, leg);
    if (style.wall === "rock") {
      const hearth = new THREE.Mesh(new THREE.BoxGeometry(1.1, 0.5, 0.6), matte("#3a2418"));
      hearth.position.set(2, 0.25, -2.6);
      this.place.add(hearth);
    } else if (style.stilts || style.wall === "plank") {
      const bed = new THREE.Mesh(new THREE.BoxGeometry(1.6, 0.28, 0.8), matte("#e6d3c4"));
      bed.position.set(2, 0.3, -2.2);
      this.place.add(bed);
    } else {
      const shelf = new THREE.Mesh(new THREE.BoxGeometry(0.3, 1.4, 1.2), wood);
      shelf.position.set(3.2, 0.8, -1);
      this.place.add(shelf);
    }
    const rug = new THREE.Mesh(new THREE.PlaneGeometry(2.2, 1.4), matte(roof));
    rug.rotation.x = -Math.PI / 2;
    rug.position.set(0, 0.02, 0.2);
    this.place.add(rug);
  }

  _outdoorsLife(style, ground, roof) {
    const leaf = style.wall === "rock" ? "#6b7c55" : style.wall === "concrete" ? "#8a8175" : "#3f7d45";
    for (let i = 0; i < 6; i += 1) {
      const tree = new THREE.Group();
      const trunk = new THREE.Mesh(new THREE.CylinderGeometry(0.12, 0.16, 1.3, 6), matte("#6b4a2a"));
      trunk.position.y = 0.65;
      const crown = new THREE.Mesh(new THREE.SphereGeometry(0.7, 8, 6), matte(leaf));
      crown.position.y = 1.5;
      tree.add(trunk, crown);
      const angle = i / 6 * Math.PI * 2;
      tree.position.set(Math.cos(angle) * 13.5, 0, Math.sin(angle) * 13.5);
      this.place.add(tree);
    }
    for (let i = 0; i < 28; i += 1) {
      const tuft = new THREE.Mesh(new THREE.ConeGeometry(0.12, 0.35, 5), matte(i % 3 ? "#4f8f4a" : "#d7c15a"));
      const angle = i * 0.7;
      const radius = 2.2 + (i % 5) * 1.1;
      tuft.position.set(Math.cos(angle) * radius, 0.15, Math.sin(angle) * radius);
      this.place.add(tuft);
    }
    for (let i = 0; i < 3; i += 1) {
      const bird = new THREE.Group();
      const body = new THREE.Mesh(new THREE.SphereGeometry(0.08, 6, 5), matte(i === 2 ? "#e6d3a3" : "#2a241c"));
      const wing = new THREE.Mesh(new THREE.BoxGeometry(0.28, 0.02, 0.08), matte("#1a120c"));
      wing.position.y = 0.02;
      bird.add(body, wing);
      this.place.add(bird);
      this.birds.push(bird);
    }
    const beast = new THREE.Group();
    const fur = style.wall === "rock" ? "#6b5344" : style.stilts ? "#d8c49a" : "#8c5a32";
    const body = new THREE.Mesh(new THREE.BoxGeometry(0.55, 0.28, 0.28), matte(fur));
    body.position.y = 0.28;
    const head = new THREE.Mesh(new THREE.BoxGeometry(0.22, 0.2, 0.22), matte(fur));
    head.position.set(0.32, 0.38, 0);
    beast.add(body, head);
    beast.position.set(2.2, 0, 1.4);
    beast.userData.ox = 2.2;
    beast.userData.oz = 1.4;
    this.place.add(beast);
    this.animal = beast;
  }

  _indoorsLife(roof) {
    const pot = new THREE.Mesh(new THREE.CylinderGeometry(0.12, 0.1, 0.22, 8), matte("#8c4a32"));
    pot.position.set(-3.1, 0.12, 1.2);
    const plant = new THREE.Mesh(new THREE.SphereGeometry(0.18, 7, 6), matte("#3f7d45"));
    plant.position.set(-3.1, 0.36, 1.2);
    const cat = new THREE.Group();
    const body = new THREE.Mesh(new THREE.BoxGeometry(0.36, 0.16, 0.16), matte("#c4a574"));
    body.position.y = 0.12;
    const head = new THREE.Mesh(new THREE.BoxGeometry(0.14, 0.12, 0.12), matte("#c4a574"));
    head.position.set(0.2, 0.18, 0);
    cat.add(body, head);
    cat.position.set(1.5, 0, 1.6);
    const bowl = new THREE.Mesh(new THREE.CylinderGeometry(0.1, 0.08, 0.08, 8), matte(roof));
    bowl.position.set(2.4, 0.06, 1.5);
    this.place.add(pot, plant, cat, bowl);
    this.animal = cat;
    this.animal.userData.ox = 1.5;
    this.animal.userData.oz = 1.6;
  }

  _clockTower(look) {
    const future = look === "despues" || look === "ondas";
    const early = look === "cueva" || look === "rio";
    const height = future ? 6.2 : early ? 1.6 : 3.2;
    const color = early ? "#8a8175" : future ? "#d7e7ea" : "#d7b56d";
    const tower = new THREE.Mesh(new THREE.CylinderGeometry(future ? 0.35 : 0.55, 0.8, height, 8), matte(color));
    tower.position.set(-5.5, height / 2, 2);
    const handH = new THREE.Mesh(new THREE.BoxGeometry(0.06, future ? 0.7 : 0.45, 0.04), matte("#f4efe4"));
    const handM = new THREE.Mesh(new THREE.BoxGeometry(0.04, future ? 0.95 : 0.7, 0.04), matte("#1a120c"));
    handH.position.y = height / 2 + 0.05;
    handM.position.y = height / 2 + 0.08;
    handH.geometry.translate(0, 0.2, 0);
    handM.geometry.translate(0, 0.3, 0);
    tower.add(handH, handM);
    this.place.add(tower);
    this.hands = [handH, handM];
  }

  _mountain(look) {
    const group = new THREE.Group();
    const rock = look === "despues" ? "#8aa0b2" : look === "partida" ? "#6b6560" : "#7d7368";
    const base = new THREE.Mesh(new THREE.ConeGeometry(7.5, 9, 7), matte(rock));
    base.position.y = 4.2;
    const capColor = look === "cueva" || look === "rio" ? "#f4f7f8" : look === "despues" ? "#d7b56d" : "#cfc6ba";
    const cap = new THREE.Mesh(new THREE.ConeGeometry(2.4, 2.2, 6), matte(capColor));
    cap.position.y = 8.6;
    group.add(base, cap);
    if (look === "vapor" || look === "partida") {
      const cut = new THREE.Mesh(new THREE.BoxGeometry(2.2, 1.4, 1.2), matte("#4a4038"));
      cut.position.set(1.4, 3.2, 2);
      group.add(cut);
    }
    group.position.set(-14, 0, -12);
    this.place.add(group);
  }

  _age(look, roof, wall) {
    if (look === "marea" || look === "rio") {
      const boat = new THREE.Mesh(new THREE.BoxGeometry(1.6, 0.35, 0.7), matte("#6b4a2a"));
      boat.position.set(16, -0.05, 4);
      boat.rotation.y = 0.4;
      this.place.add(boat);
    }
    if (look === "vapor" || look === "imprenta") {
      const chimney = new THREE.Mesh(new THREE.CylinderGeometry(0.28, 0.34, 2.4, 8), matte("#3a2418"));
      chimney.position.set(7.2, 2.4, -6.2);
      this.place.add(chimney);
    }
    if (look === "ondas" || look === "despues") {
      const spire = new THREE.Mesh(new THREE.BoxGeometry(0.8, 5.5, 0.8), matte(look === "despues" ? "#d9e6ea" : wall));
      spire.position.set(8, 2.8, 6);
      this.place.add(spire);
    }
    if (look === "partida") {
      const ruin = new THREE.Mesh(new THREE.BoxGeometry(2.4, 0.4, 1.2), matte("#5c564e"));
      ruin.position.set(3, 0.3, 8);
      ruin.rotation.z = 0.4;
      this.place.add(ruin);
    }
    if (look === "burgo" || look === "polvo") {
      for (let i = 0; i < 8; i += 1) {
        const stone = new THREE.Mesh(new THREE.BoxGeometry(0.8, 0.7, 0.4), matte("#b7aa98"));
        const a = i / 8 * Math.PI * 2;
        stone.position.set(Math.cos(a) * 8.5, 0.35, Math.sin(a) * 8.5);
        stone.lookAt(0, 0.35, 0);
        this.place.add(stone);
      }
    }
  }

  propById(id) {
    if (id === "npc") return this.npc;
    return this.props.find((mesh) => mesh.userData.propId === id) || null;
  }

  showProp(id, visible) {
    const mesh = this.propById(id);
    if (mesh) mesh.visible = visible;
  }

  nearest(maxDist) {
    const px = this.player.position.x;
    const pz = this.player.position.z;
    let best = null;
    let bestD = maxDist;
    const list = [this.npc, ...this.props];
    for (const mesh of list) {
      if (!mesh || !mesh.visible) continue;
      const d = Math.hypot(mesh.position.x - px, mesh.position.z - pz);
      if (d < bestD) {
        bestD = d;
        best = mesh;
      }
    }
    return best;
  }

  pick(clientX, clientY) {
    const rect = this.renderer.domElement.getBoundingClientRect();
    const ndc = new THREE.Vector2(
      ((clientX - rect.left) / rect.width) * 2 - 1,
      -((clientY - rect.top) / rect.height) * 2 + 1
    );
    const ray = new THREE.Raycaster();
    ray.setFromCamera(ndc, this.camera);
    const hits = ray.intersectObjects([this.npc, ...this.props], true);
    for (const hit of hits) {
      let obj = hit.object;
      while (obj && !obj.userData.propId) obj = obj.parent;
      if (obj && obj.userData.propId) return obj;
    }
    return null;
  }

  move(dt, keys) {
    const speed = (keys.run ? 4.2 : 2.3) * (this.slow ? 1 : 1);
    let x = 0;
    let z = 0;
    if (keys.up) z -= 1;
    if (keys.down) z += 1;
    if (keys.left) x -= 1;
    if (keys.right) x += 1;
    if (x || z) {
      const len = Math.hypot(x, z);
      const yaw = Math.PI / 4;
      const wx = (x / len) * Math.cos(yaw) - (z / len) * Math.sin(yaw);
      const wz = (x / len) * Math.sin(yaw) + (z / len) * Math.cos(yaw);
      const limit = this.limit || 8;
      this.player.position.x = Math.max(-limit, Math.min(limit, this.player.position.x + wx * speed * dt));
      this.player.position.z = Math.max(-limit, Math.min(limit, this.player.position.z + wz * speed * dt));
      this.player.rotation.y = Math.atan2(wx, wz);
      this.bob += dt * (this.slow ? 2 : 10);
      const swing = Math.sin(this.bob) * 0.5;
      this.player.userData.legs[0].rotation.x = swing;
      this.player.userData.legs[1].rotation.x = -swing;
    }
  }

  setRemotes(list) {
    const seen = new Set();
    for (const person of list) {
      seen.add(person.id);
      let mesh = this.remotes.get(person.id);
      if (!mesh) {
        mesh = makePerson("#3e6f9a");
        this.scene.add(mesh);
        this.remotes.set(person.id, mesh);
      }
      mesh.position.x += (person.x - mesh.position.x) * 0.35;
      mesh.position.z += (person.z - mesh.position.z) * 0.35;
      mesh.rotation.y = person.ry || 0;
      mesh.visible = true;
    }
    for (const [id, mesh] of this.remotes) {
      if (!seen.has(id)) mesh.visible = false;
    }
  }

  frame(dt) {
    const now = new Date();
    if (this.hands) {
      const hour = (now.getHours() % 12) + now.getMinutes() / 60;
      this.hands[0].rotation.z = -hour / 12 * Math.PI * 2;
      this.hands[1].rotation.z = -(now.getMinutes() + now.getSeconds() / 60) / 60 * Math.PI * 2;
    }
    if (this.npc) {
      const wave = Math.sin(performance.now() / (this.slow ? 2400 : 400));
      this.npc.position.y = wave * (this.slow ? 0.02 : 0.06);
    }
    if (this.birds) {
      const rate = this.slow ? 0.05 : 1;
      const t = performance.now() / 1000 * rate;
      this.birds.forEach((bird, index) => {
        const angle = t * 0.55 + index * 2.1;
        const radius = 5.5 + index * 1.3;
        bird.position.set(Math.cos(angle) * radius, 4.4 + Math.sin(t * 2 + index) * 0.35, Math.sin(angle) * radius);
        bird.rotation.y = -angle + Math.PI / 2;
      });
    }
    if (this.animal && this.animal.userData.ox != null) {
      const rate = this.slow ? 0.08 : 1;
      const angle = performance.now() / 1000 * 0.4 * rate;
      this.animal.position.x = this.animal.userData.ox + Math.cos(angle) * (this.inside == null ? 1.5 : 0.45);
      this.animal.position.z = this.animal.userData.oz + Math.sin(angle) * (this.inside == null ? 1.5 : 0.45);
      this.animal.rotation.y = -angle;
    }
    const p = this.player.position;
    const zoom = this.zoom || 1;
    const back = (this.inside == null ? 7.5 : 4.2) * zoom;
    const up = (this.inside == null ? 8.2 : 3.4) * zoom;
    this.camera.position.set(p.x + back, up, p.z + back);
    this.camera.lookAt(p.x, 1.2, p.z);
    this.renderer.render(this.scene, this.camera);
    return dt;
  }
}
