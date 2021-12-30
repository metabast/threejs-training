import * as THREE from 'three';
import {Pane} from 'tweakpane';
import {OrbitControls} from 'three/examples/jsm/controls/OrbitControls.js'
import Content from './Content.js';
import Resize from '../../commons/Resize.js'

import { OBJLoader } from 'three/examples/jsm/loaders/OBJLoader.js';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';


	
export default function World(){

		const twp = new Pane();

		const canvas = document.querySelector('canvas.webgl');
		const scene = new THREE.Scene();
		const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
		
		const renderer = new THREE.WebGLRenderer({
			canvas: canvas,
			antialias: true,
		});
		renderer.setSize( window.innerWidth, window.innerHeight );

		const control = new OrbitControls(camera, renderer.domElement)
		control.enableDamping = true;
		camera.position.set( 0,1,0 );

		const clock = new THREE.Clock();

		const axesHelper = new THREE.AxesHelper( 1 );
		scene.add( axesHelper );

		// const directionalLight = new THREE.DirectionalLight( 0xffffff, 0.5 );
		// scene.add( directionalLight );

		// 
		let content;

		Resize.getInstance()
			.updateCanvas(canvas)
			.updateCamera(camera)
			.updateRenderer(renderer);	


		function animate(){
			control.update();
			content.update(clock);
			renderer.render(scene, camera);
			requestAnimationFrame(animate);
		}

		const manager = new THREE.LoadingManager();
		const loader = new OBJLoader(manager);
		const loader2 = new GLTFLoader(manager);

		let suzanneMesh, volume_edge;
		// loader.load('assets/suzanne.obj', function(object){
		//    suzanneMesh = object.children[0];
		// });

		// loader.load('assets/volume-edge.obj', function(object){
		//    volume_edge = object.children[0];
		// });

		loader2.load('assets/volume-edge.gltf', function(gltf){
			volume_edge = gltf.scene.children[0];
			// volume_edge.rotateX( -90/(180/Math.PI) );
			// volume_edge.updateMatrix();
		});

		manager.onLoad = function(){
			content = new Content(scene, volume_edge, twp);
			animate();
		}

}
