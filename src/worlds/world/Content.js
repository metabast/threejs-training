import * as THREE from 'three';

// SHADER
import vertexShader from './shaders/vertex.glsl';
import fragmentShader from './shaders/fragment.glsl';

const matShader = new THREE.ShaderMaterial({
    uniforms: {
        "time": {value: 1.0},
        "resolution": { value: new THREE.Vector2()},
        "uvScale": { value: new THREE.Vector2( 1.0, 1.0 ) },
    },
    vertexShader: vertexShader,
    fragmentShader: fragmentShader,
    transparent: true,
    side: THREE.DoubleSide,
})

const geometry = new THREE.PlaneGeometry(1, 1)
const mesh = new THREE.Mesh(geometry, matShader)


function Content(scene){
	scene.add(mesh);
	return {
		update(){

		}
	}
}

export default Content;