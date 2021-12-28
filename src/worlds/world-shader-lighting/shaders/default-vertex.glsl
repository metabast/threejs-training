#define M_PI 3.1415926535897932384626433832795

uniform float uTime;
uniform float lightDirectionX;
uniform float lightDirectionY;
uniform float lightDirectionZ;

varying vec3 vPosition;
varying vec4 vColor;
varying vec3 vNormal;
varying vec3 vLight;

void main()
{
    // vec3 col = 0.5 + 0.5*cos(uTime+uv.xyx+vec3(0,2,4));
    vec3 col = vec3(.0,.5,.0);
    vColor = vec4(col, 1.0);
    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

    // vPosition = vec3(gl_Position);
    // vNormal = normalize(normal * normalMatrix);
    vPosition = position;
    vNormal = normalize(normal);
    vLight = vec3(lightDirectionX,lightDirectionY,lightDirectionZ);
}