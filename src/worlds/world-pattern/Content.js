import * as THREE from 'three';

// SHADERS
import vertexShader from './shaders/default-vertex.glsl';
import fragmentShader from './shaders/default-fragment.glsl';
import patternGlsl from './shaders/patterns.glsl';

const matShader = new THREE.ShaderMaterial({
    uniforms:{
        uTime: {value: 1.0}
    },
    vertexShader: vertexShader,
    fragmentShader: fragmentShader,
    // transparent: true,
    side: THREE.DoubleSide,
})

const geometry = new THREE.PlaneGeometry(1, 1, 32, 32);
const mesh = new THREE.Mesh(geometry, matShader);


function Content(scene){
	scene.add(mesh);

	return {
		update(clock){
            matShader.uniforms.uTime.value = clock.getElapsedTime();
		}
	}
}

export default Content;