#define M_PI 3.1415926535897932384626433832795

uniform float uTime;

varying vec2 vUv;
varying vec3 vPos;

void main()
{
    vUv = uv;
    vPos = position;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}