import * as THREE from "three";

function pixelTexture(paint, w = 32, h = 32) {
  const canvas = document.createElement("canvas");
  canvas.width = w;
  canvas.height = h;
  paint(canvas.getContext("2d"), w, h);
  const tex = new THREE.CanvasTexture(canvas);
  tex.magFilter = THREE.NearestFilter;
  tex.minFilter = THREE.NearestFilter;
  tex.colorSpace = THREE.SRGBColorSpace;
  return tex;
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
    this.camera = new THREE.PerspectiveCamera(32, 1, 0.1, 80);
    this.renderer = new THREE.WebGLRenderer({ antialias: false });
    this.renderer.setClearColor(0x120e0b);
    this.renderer.domElement.style.imageRendering = "pixelated";
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
    this.bob = 0;
    this._onResize = () => this.resize();
    window.addEventListener("resize", this._onResize);
    this.resize();
  }

  resize() {
    const w = this.parent.clientWidth || window.innerWidth;
    const h = this.parent.clientHeight || window.innerHeight;
    this.camera.aspect = w / h;
    this.camera.updateProjectionMatrix();
    this.renderer.setSize(Math.max(160, w / 2), Math.max(100, h / 2), false);
    this.renderer.domElement.style.width = w + "px";
    this.renderer.domElement.style.height = h + "px";
  }

  setSlow(on) {
    this.slow = on;
  }

  setFace(dataUrl) {
    const image = new Image();
    image.onload = () => {
      const tex = pixelTexture((g, w, h) => {
        g.drawImage(image, 0, 0, w, h);
      }, 32, 32);
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
    const [ground, roof, wall] = spec.colors;
    this.scene.background = new THREE.Color(ground);
    this.scene.fog = new THREE.Fog(ground, 12, 28);
    const grass = pixelTexture((g, w, h) => {
      g.fillStyle = ground;
      g.fillRect(0, 0, w, h);
      for (let i = 0; i < 80; i += 1) {
        g.fillStyle = i % 2 ? roof : wall;
        g.fillRect((i * 7) % w, (i * 13) % h, 2, 2);
      }
    }, 64, 64);
    grass.wrapS = grass.wrapT = THREE.RepeatWrapping;
    grass.repeat.set(8, 8);
    const floor = new THREE.Mesh(new THREE.PlaneGeometry(22, 22), matte("#ffffff", grass));
    floor.rotation.x = -Math.PI / 2;
    this.place.add(floor);
    const spots = [[-7, -6], [7, -6], [-7, 4], [7, 4], [0, -8]];
    spots.forEach(([x, z], index) => {
      const house = new THREE.Group();
      const body = new THREE.Mesh(new THREE.BoxGeometry(2.4, 1.8, 2.2), matte(wall));
      body.position.y = 0.9;
      const top = new THREE.Mesh(new THREE.ConeGeometry(1.8, 1.1, 4), matte(roof));
      top.position.y = 2.2;
      top.rotation.y = Math.PI / 4;
      house.add(body, top);
      house.position.set(x, 0, z);
      house.scale.setScalar(index === 4 ? 1.15 : 1);
      this.place.add(house);
    });
    this._clockTower();
    const npc = makePerson("#c4552a");
    npc.position.set(0, 0, -1.5);
    npc.userData.propId = "npc";
    npc.userData.label = spec.npc;
    this.place.add(npc);
    this.npc = npc;
    spec.props.forEach((prop) => {
      const mesh = new THREE.Mesh(new THREE.BoxGeometry(0.45, 0.45, 0.45), matte(prop.color || roof));
      mesh.position.set(prop.x, 0.28, prop.z);
      mesh.userData.propId = prop.id;
      mesh.userData.label = prop.label;
      this.place.add(mesh);
      this.props.push(mesh);
    });
  }

  _clockTower() {
    const tower = new THREE.Mesh(new THREE.CylinderGeometry(0.55, 0.7, 2.4, 8), matte("#d7b56d"));
    tower.position.set(-5.5, 1.2, 2);
    const handH = new THREE.Mesh(new THREE.BoxGeometry(0.06, 0.45, 0.04), matte("#f4efe4"));
    const handM = new THREE.Mesh(new THREE.BoxGeometry(0.04, 0.7, 0.04), matte("#1a120c"));
    handH.position.y = 2.15;
    handM.position.y = 2.18;
    handH.geometry.translate(0, 0.2, 0);
    handM.geometry.translate(0, 0.3, 0);
    tower.add(handH, handM);
    this.place.add(tower);
    this.hands = [handH, handM];
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
      this.player.position.x = Math.max(-8, Math.min(8, this.player.position.x + wx * speed * dt));
      this.player.position.z = Math.max(-8, Math.min(8, this.player.position.z + wz * speed * dt));
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
    const p = this.player.position;
    this.camera.position.set(p.x + 7.5, 8.2, p.z + 7.5);
    this.camera.lookAt(p.x, 1.1, p.z);
    this.renderer.render(this.scene, this.camera);
    return dt;
  }
}
