import { mount as mountDevTools } from "@latticexyz/dev-tools";
import { setup } from "./mud/setup";
import { getComponentValue,Has,defineSystem} from "@latticexyz/recs";
import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { DragControls } from 'three/addons/controls/DragControls.js';
import { Sky } from 'three/addons/objects/Sky.js';
import { hexToArray } from "@latticexyz/utils";

const {
  components,
  network: { playerEntity },
  systemCalls: { increment, callGen,partici,ready, startRace,cwv,countDown},
} = await setup();

function jR(et,st){
  this.et=et;
  this.st=st;
}

const plmp = new Map();



let gO=[];
let ljR=[];
let buildT=false;
let trackPlayer= new THREE.Vector3();
trackPlayer.x=7;
trackPlayer.y=1;
trackPlayer.z=0;
function CliP(x,y,z,dx,dy,dz,ax,ay,az) {
  this.x=x; 
  this.dx=dx; 
  this.ax=ax;
  this.y=y; 
  this.dy=dy; 
  this.ay=ay;
  this.z=z; 
  this.dz=dz; 
  this.az=az; 

}
let repeatSendTransac=0;
let player={x:7000,y:1000,z:0,dx:0,dy:0,dz:0,ax:0,ay:0,az:0};
let lisP=[];
lisP.push(new CliP(7000,1000,0,0,0,0,0,0,0));
lisP.push(new CliP(13000,1000,0,0,0,0,0,0,0));
let limdv=10;
let limdx=2;
let ls=false;
let aay=3;
let aax=1;
let repeat=2000;
let numentity=0;
const loader = new GLTFLoader();
let camera, scene, renderer;
let capmesh1,capmesh2, cube1, cube2;
let cm=[];
let cb=[];
let sky, sun;
let nused=0;
let flog=[false,false];
document.addEventListener('keydown', function(event){
  //alert(event.code);
    if(event.code=='KeyW'){
      player.az=-aay;
    }
} );

document.addEventListener('keyup', function(event){
    if(event.code=='KeyW'){
      player.az=0;
    }
} );

document.addEventListener('keydown', function(event){
  //alert(event.code);
    if(event.code=='KeyS'){
      player.az=aay;
    }
} );

document.addEventListener('keyup', function(event){
    if(event.code=='KeyS'){
      player.az=0;
    }
} );

document.addEventListener('keydown', function(event){
  //alert(event.code);
    if(event.code=='KeyA'){
      player.ax=-aax;
    }
} );

document.addEventListener('keyup', function(event){
    if(event.code=='KeyA'){
      player.ax=0;
    }
} );


document.addEventListener('keydown', function(event){
  //alert(event.code);
    if(event.code=='KeyD'){
      player.ax=aax;
    }
} );

document.addEventListener('keyup', function(event){
    if(event.code=='KeyD'){
      player.ax=0;
    }
} );

components.Counter.update$.subscribe((update) => {
  const [nextValue, prevValue] = update.value;

  document.getElementById("counter")!.innerHTML = String(nextValue?.value ?? "unset");
});


components.GridBolid.update$.subscribe((update) => {
  for (const entity of components.GridBolid.entities() ) {
    if(plmp.has(entity) && plmp.get(entity).a==true){console.log( "CONTINUE");continue;}
    console.log( "GRIDBOL ID",entity);
    if(getComponentValue(components.GridBolid,entity).stateFiz){
      plmp.set(entity,{a:true,b:nused});
      scene.add( cm[nused] );
      
      if(entity==playerEntity){
        cb[nused].position.x=lisP[nused].x/1000;
        cb[nused].position.y=lisP[nused].y/1000;
        cb[nused].position.z=lisP[nused].z/1000;
        
        scene.add( cb[nused] );
      
        player.x=lisP[nused].x;
       
      }
      nused++;
    }
  }

});
let gridArray=[];
let widthRace;
let heightRace;
components.GridTrack.update$.subscribe((update) => {
  
  for (const entity of components.GridTrack.entities() ) {
    if(buildT){
      break;
    }
    widthRace=getComponentValue(components.GridTrack,entity).width;
    heightRace=getComponentValue(components.GridTrack,entity).height;
    gridArray=Array.from(hexToArray(getComponentValue(components.GridTrack,entity).grid));  
    buildT=true;
    genGridTrack(gridArray,widthRace,heightRace);
  }
});


components.FizState.update$.subscribe((update) => {
  numentity=0;
  for (const entity of components.FizState.entities() ) {
    numentity++;
    let comp=getComponentValue(components.FizState,entity);
    if(plmp.has(entity) && plmp.get(entity).a==true){
      let i=plmp.get(entity).b;
        
        cm[i].position.x=comp.x/1000;
        cm[i].position.y=comp.y/1000;
        cm[i].position.z=comp.z/1000;
        

        if(entity==playerEntity){

          player.x=comp.x;
          player.z=comp.z;
          player.dx=comp.dx;
          player.dz=comp.dz;
          player.ax=comp.ax;
          player.az=comp.az;
        }
        

    }
    
  }
});



(window as any).increment = async () => {
  console.log("new counter value:", await increment());
};

(window as any).appel = async () => {
  console.log("new counter value:", await callGen());
};

(window as any).part = async () => {
  console.log("new counter value:", await partici());
};

(window as any).placeonrace = async () => {
  console.log("new counter value:", await ready());
};

(window as any).startpos = async () => {
  console.log("new counter value:", await startRace());
};


function update(dt) {
  let adt=dt;
  limit();
  player.x=Math.ceil(player.x+adt*player.dx);
  player.z=Math.ceil(player.z+adt*player.dz);
 
  repeatSendTransac+=dt;

  if(repeatSendTransac>=repeat)
  {

    repeatSendTransac=0;
    if(numentity==2){
      console.log(numentity);
      countDown();
     
    }
    
    cwv(player.x,player.z,player.dx,player.dz,player.ax,player.az);
 
  }

  
  if(plmp.has(playerEntity)){
    let vi=plmp.get(playerEntity).b;
    cb[vi].position.x=player.x/1000;

    cb[vi].position.z=player.z/1000;
    camera.position.x=player.x/1000;
    camera.position.z=player.z/1000+6;
    trackPlayer.x=player.x/1000;
    trackPlayer.z=player.z/1000;
    // cm[vi].position.x=player.x/1000;
    // cm[vi].position.y=player.y/1000;
    // cm[vi].position.z=player.z/1000;
   
  }
}

async function sentransac(){

}

function limit(){

    let lty=limdv-limdx;
    player.dx=player.ax+player.dx;
    player.dz=player.az+player.dz;
    if(player.dx<(-limdx)){
      player.dx=(-limdx);
      if(player.dz<(-lty)){
        player.dz=(-lty);
      }
      else if(player.dz>lty){
        player.dz=lty;
      }
    } 
    else if(player.dx>limdx){
      player.dx=limdx;
      if(player.dz<(-lty)){
        player.dz=(-lty);
      }
      else if(player.dz>lty){
        player.dz=lty;
      }
    }
    else if(player.dz+Math.abs(player.dx)>limdv){
      if(player.dx>0){
        player.dx=player.dx-1+Math.abs(player.ax);
      }
      else if(player.dx<0){
        player.dx=player.dx+1-Math.abs(player.ax);
      }

      player.dz=limdv-Math.abs(player.dx);

    }
    else if(player.dz-Math.abs(player.dx)<-limdv){
      if(player.dx>0){
        player.dx=player.dx-1+Math.abs(player.ax);
      }
      else if(player.dx<0){
        player.dx=player.dx+1-Math.abs(player.ax);
      }
      player.dz=-limdv+Math.abs(player.dx);
    }

    if(Math.abs(player.dx)+Math.abs(player.dz)>=limdv){
      ls=true;
    }
    else{
      ls=false;
    }
  //player.dx=(player.ax*dt+player.dx);
  //player.dy=(player.ay*dt+player.dy);

}

function draw() {
  
}

function loop(timestamp) {
  let progress = timestamp - lastRender;

  update(progress);
  draw();

  lastRender = timestamp;
  window.requestAnimationFrame(loop);
}
let lastRender = 0;
window.requestAnimationFrame(loop);

mountDevTools();


function modelLoader(url) {
  return new Promise((resolve, reject) => {
    loader.load(url, data=> resolve(data), null, reject);
  });
}


async function threejs() {
  camera = new THREE.PerspectiveCamera( 60, window.innerWidth / window.innerHeight, 0.1, 2000000 );
  camera.position.set( 3, 3, 6 );
  //camera.target
  //camera.rotation.set(0,100,100);
  
  scene = new THREE.Scene();
  let ambientLight = new THREE.AmbientLight(new THREE.Color('hsl(0, 0%, 100%)'), 0.75);
  scene.add(ambientLight);
  const helper = new THREE.GridHelper( 100000, 2000, 0x888888, 0x888888 );
  scene.add( helper );

  renderer = new THREE.WebGLRenderer();
  renderer.setPixelRatio( window.devicePixelRatio );
  renderer.setSize( window.innerWidth, window.innerHeight );
  renderer.toneMapping = THREE.ACESFilmicToneMapping;
  renderer.toneMappingExposure = 0.5;
  document.body.appendChild( renderer.domElement );

  const controls = new OrbitControls( camera, renderer.domElement );
  controls.target=trackPlayer;
  controls.update();
  controls.addEventListener( 'change', render );
  controls.enableZoom = true;
  controls.enablePan = false;

  const geometry = new THREE.BoxGeometry( 1, 1, 1 );
  const material = new THREE.MeshPhongMaterial( { color: 0x00ff00 } );
  const mat = new THREE.MeshPhongMaterial( { color: 0x0000ff } );
  cb.push(new THREE.Mesh( geometry, material ));
  cb.push(new THREE.Mesh( geometry, mat ));
  //cube.material.emissive.r=0x44;
  //
  cb[0].position.y=1


  let gltfData = await modelLoader('/assets/untitled.gltf');
  let object;
  
  let model = gltfData.scene;
  model.traverse((node) => {
    if (!node.isMesh) return;
        //onemodel so ok
      node.material.wireframe = true;
      //node.material.emissive = {isColor: true, r: 200, g: 0, b: 0};
      //node.material.set("MeshPhongMaterial");
      capmesh1=node;
      
      return;
  });
  capmesh1.rotation.y=0;
  capmesh2=capmesh1.clone( );
  capmesh2.material=capmesh1.material.clone( );
  capmesh2.material.color.b=0.8;
  cm.push(capmesh1);
  cm.push(capmesh2);
  




  
  window.addEventListener( 'resize', onWindowResize );


      initSky();
			animate();



      function animate() {

        requestAnimationFrame( animate );
        //contOrbit.update();
        
        for (const cube of cb){
          cube.rotation.x += 0.01;
          cube.rotation.y += 0.01;
        }
      
        controls.update();
        render();
        }
}



function initSky() {

  // Add Sky
  sky = new Sky();
  sky.scale.setScalar( 450000 );
  scene.add( sky );

  sun = new THREE.Vector3();

  



    const uniforms = sky.material.uniforms;
    uniforms[ 'turbidity' ].value = 19.8;
    uniforms[ 'rayleigh' ].value = 3.361;
    uniforms[ 'mieCoefficient' ].value =0.1;
    uniforms[ 'mieDirectionalG' ].value = 0.828;

    const phi = THREE.MathUtils.degToRad( 90 - 0 );
    const theta = THREE.MathUtils.degToRad( 180 );

    sun.setFromSphericalCoords( 1, phi, theta );

    uniforms[ 'sunPosition' ].value.copy( sun );

    renderer.toneMappingExposure = 0.9263;
    renderer.render( scene, camera );


  

}



function onWindowResize() {

  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();

  renderer.setSize( window.innerWidth, window.innerHeight );

  render();

}

function render() {

  renderer.render( scene, camera );

}

function genGridTrack(a,w,h){
  let road=[];
  const geometr = new THREE.BoxGeometry( 1, 10, 1 );
  const materia = new THREE.MeshPhongMaterial( { color: 0x445566 } );
  const plane = new THREE.PlaneGeometry( 1, 1 );
  const materi = new THREE.MeshBasicMaterial( {color: 0x334477, side: THREE.DoubleSide} );
  const matb = new THREE.MeshBasicMaterial( {color: 0x0000ff, side: THREE.DoubleSide} );
  const matr = new THREE.MeshBasicMaterial( {color: 0xff0000, side: THREE.DoubleSide} );
  //const plane = 
  
  //cb.push(new THREE.Mesh( geometry, materia ));

  for (let y = 0; y < h; y++) {
    for (let x = 1; x < w; x++) {
      //if(x==)
      let p=(y*w+x);
      if(a[p]==0 || a[p]==1 || a[p]==2) {
        let tmp=new THREE.Mesh( geometr, materia )
        tmp.position.x=x;
        tmp.position.z=-y;
        road.push(tmp);
        scene.add(road.at(-1));
      }
      else if(a[p]==5){
        let tmp=new THREE.Mesh( plane, materi )
        tmp.position.x=x;
        tmp.position.z=-y;
        tmp.rotation.x=Math.PI/2;
        road.push(tmp);
        scene.add(road.at(-1));
      }   
      else if(a[p]==8){
        let tmp=new THREE.Mesh( plane, matr )
        tmp.position.x=x;
        tmp.position.z=-y;
        tmp.rotation.x=Math.PI/2;
        road.push(tmp);
        scene.add(road.at(-1));
      }
      else if(a[p]==9){
        let tmp=new THREE.Mesh( plane, matb )
        tmp.position.x=x;
        tmp.position.z=-y;
        tmp.rotation.x=Math.PI/2;
        road.push(tmp);
        scene.add(road.at(-1));
      }
    }

  }

}




threejs().catch(error => {
  console.error(error);
});