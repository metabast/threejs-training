precision mediump float;

uniform float uTime;
uniform vec3 uColor;
uniform vec3 uSpecularColor;
uniform float lightDirectionX;
uniform float specularAmount;
uniform float specularShininess;

varying vec3 vPosition;
varying vec4 vColor;
varying vec3 vNormal;
varying vec3 vLight;


void main()
{
    vec3 directionToCamera = normalize( cameraPosition - vPosition);
    vec3 halfwayVector = normalize( directionToCamera + vLight );
    
    float specularBrightness = (
        specularAmount *

        pow(
            max(0.0, dot(vNormal, halfwayVector)),
            specularShininess
        )
    );

    float lightDot = dot( normalize( vNormal ), vLight );
    float surfaceBrightness = max( 0.0, lightDot );


    gl_FragColor = vec4(uColor.rgb * surfaceBrightness + uSpecularColor.rgb * specularBrightness, 1.);
    // gl_FragColor = vec4(uColor.rgb, 1.);
    // gl_FragColor = vColor;
    // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);;
}