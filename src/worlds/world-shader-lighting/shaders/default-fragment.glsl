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


vec3 phong()
{
    vec3 lightIntensity = vec3(0.5,.5,.5);
    // vec3 directionToCamera = normalize( cameraPosition - vPosition);
    // vec3 halfwayVector = normalize( directionToCamera + vLight );
    
    // float specularBrightness = (
    //     specularAmount *

    //     pow(
    //         max(0.0, dot(vNormal, halfwayVector)),
    //         specularShininess
    //     )
    // );

    // vec3 ambient = vec3( 0.3, 0.3, 0.3);
    // float lightDot = dot( normalize( vNormal ), vLight );
    // float surfaceBrightness = max( 0.0, lightDot );

    // return lightIntensity * (ambient + uColor.rgb * surfaceBrightness + uSpecularColor.rgb * specularBrightness);
    // return lightIntensity * (ambient + vColor.rgb + surfaceBrightness * specularBrightness);

    vec3 n = normalize(vNormal);
    vec3 s = normalize(vec3(vLight) - vPosition);
    vec3 v = normalize(vec3(-vPosition));
    vec3 r = reflect(-s, n);

    vec3 Ka = vec3(0.5, 0.5, 0.3);
    vec3 Kd = vec3(0.9, 0.5, 0.3);
    vec3 Ks = vec3(0.8, 0.8, 0.8);

    vec3 ambient = Ka;
    vec3 diffuse = Kd * max(dot(s, n), 0.0);
    vec3 specular = Ks * pow(max(dot(r, v), 0.0), 20.);

    return lightIntensity * (ambient + diffuse + specular);
}

void main()
{
    


    // gl_FragColor = vec4( phong(), 1.);
    gl_FragColor = vec4(uColor.rgb, 1.);
    // gl_FragColor = vColor;
    // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);;
}