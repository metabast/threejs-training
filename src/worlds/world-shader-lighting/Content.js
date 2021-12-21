import * as THREE from 'three';



// SHADERS
import vertexShader from './shaders/default-vertex.glsl';
import fragmentShader from './shaders/default-fragment.glsl';

const matShader = new THREE.ShaderMaterial({
    uniforms:{
        uTime: {value: 1.0}
    },
    vertexShader: vertexShader,
    fragmentShader: fragmentShader,
    // transparent: true,
    side: THREE.DoubleSide,
})

// const geometry = new THREE.PlaneGeometry(1, 1);
const geometry = new THREE.SphereGeometry( 1, 32, 16 );
const mesh = new THREE.Mesh(geometry, matShader);


const geometryRaw = new THREE.PlaneGeometry(1, 1);

function Content(scene, suzanneMesh){

    suzanneMesh.material = matShader;
	scene.add(suzanneMesh);

	return {
		update(clock){
            matShader.uniforms.uTime.value = clock.getElapsedTime();
		}
	}
}

export default Content;