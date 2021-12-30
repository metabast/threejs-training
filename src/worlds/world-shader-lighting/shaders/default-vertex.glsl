#define M_PI 3.1415926535897932384626433832795

uniform float uTime;
uniform float lightDirectionX;
uniform float lightDirectionY;
uniform float lightDirectionZ;

varying vec3 vPosition;
varying vec4 vColor;
varying vec3 vNormal;
varying vec3 vLight;

varying vec3 vN;
varying vec3 vV;
varying vec3 vL;

void main()
{


    vPosition = vec3(modelViewMatrix * vec4(position, 1.0));
    vNormal = normalize(normal * normalMatrix);
    vLight = vec3(lightDirectionX,lightDirectionY,lightDirectionZ) - (modelViewMatrix * vec4( position, 1.0 )).xyz;

    vN = normal * normalMatrix;
    vV = - vec3( modelViewMatrix * vec4(position, 1.0) );
    vL = vec3(lightDirectionX,lightDirectionY,lightDirectionZ) + vV;
    
    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}