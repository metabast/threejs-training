uniform float uTime;
uniform float lightDirectionX;
uniform float lightDirectionY;
uniform float lightDirectionZ;

varying vec3 vN; // normal
varying vec3 vV; // view
varying vec3 vL; // light

void main()
{
    vN = normal * normalMatrix;
    vV = - vec3( modelViewMatrix * vec4(position, 1.0) );
    vL = vec3(lightDirectionX,lightDirectionY,lightDirectionZ) + vV;
    
    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}