import * as THREE from 'three';
import { VertexNormalsHelper } from 'three/examples/jsm/helpers/VertexNormalsHelper.js';


// SHADERS
import vertexShader from './shaders/default-vertex.glsl';
import fragmentShader from './shaders/default-fragment.glsl';


const shaderColors = {
    uColor: '#674003',
    uSpecularColor: '#88aa0b',
}

const matShader = new THREE.ShaderMaterial({
    uniforms:{
        uTime: {value: 1.0},
        lightDirectionX: {value: 0.},
        lightDirectionY: {value: 0.},
        lightDirectionZ: {value: 10.},
        specularAmount: {value: 10},
        specularShininess: {value: 42},
        uColor: {value: new THREE.Color(shaderColors.uColor)},
        uSpecularColor: {value: new THREE.Color(shaderColors.uSpecularColor)},
    },
    vertexShader: vertexShader,
    fragmentShader: fragmentShader,
    // transparent: true,
    side: THREE.DoubleSide,
    // lights: true,
})

const geometry = new THREE.PlaneGeometry(1, 1);
// const geometry = new THREE.TorusGeometry( .3, .1, 16, 100 );
// const geometry = new THREE.OctahedronGeometry( 1, 5 );
const meshBase = new THREE.Mesh(geometry, matShader);
// meshBase.rotateX(-90/(180/Math.PI))
// mesh.material.flatShading = true;
// geometry.computeVertexNormals();

function Content(scene, mesh, twp){

    // mesh = meshBase;
    twp.addInput(matShader.uniforms.lightDirectionX, 'value', {min: -10, max: 10, step: .1, label:'lightX'});
    twp.addInput(matShader.uniforms.lightDirectionY, 'value', {min: -10, max: 10, step: .1, label:'lightY'});
    twp.addInput(matShader.uniforms.lightDirectionZ, 'value', {min: -10, max: 10, step: .1, label:'lightZ'});
    twp.addInput(matShader.uniforms.specularAmount, 'value', {min: 0, max: 10, step: .1, label:'specularAmount'});
    twp.addInput(matShader.uniforms.specularShininess, 'value', {min: 0.01, max: 1000, step: .01, label:'specularShininess'});
    twp.addInput(shaderColors, 'uColor').on('change', ()=>{
        matShader.uniforms.uColor.value.set(shaderColors.uColor)
    });
    twp.addInput(shaderColors, 'uSpecularColor').on('change', ()=>{
        matShader.uniforms.uSpecularColor.value.set(shaderColors.uSpecularColor)
    });

    // mesh = new THREE.Mesh(geometry, matShader);

    mesh.material = matShader;
    // mesh.rotateX( -90/(180/Math.PI) );
    // mesh.material.flatShading = true;
    mesh.geometry.computeVertexNormals();
    console.log(mesh);
    console.log(meshBase);
	scene.add(mesh);
    const helper = new VertexNormalsHelper( mesh, .05, 0x00ff00, 1 );
    scene.add(helper);

	return {
		update(clock){
            matShader.uniforms.uTime.value = clock.getElapsedTime();
            // mesh.rotateX(-.01);
            // mesh.updateMatrix();
            helper.update();
		}
	}
}

export default Content;