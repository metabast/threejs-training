#define M_PI 3.1415926535897932384626433832795

uniform float time;
uniform vec2 uvScale;


varying vec2 vUv;
varying vec4 vColor;

void main()
{
    float vTime = time * 0.3;
    vec3 col = 0.5 + 0.5*cos(vTime+uv.xyx+vec3(0,2,4));
    vColor = vec4(col, 1.0);
    vUv = uvScale * uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}