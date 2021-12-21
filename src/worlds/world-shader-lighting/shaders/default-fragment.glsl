precision mediump float;

uniform float uTime;

varying vec4 vColor;
varying vec3 vNormal;
varying vec3 vLight;


void main()
{
    vec3 norm = normalize(vNormal);
    float r = max(0., dot( norm, normalize(vLight))*0.9);
    gl_FragColor = vec4(vColor.rgb+r, 1.);
    // gl_FragColor = vColor;
    // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);;
}