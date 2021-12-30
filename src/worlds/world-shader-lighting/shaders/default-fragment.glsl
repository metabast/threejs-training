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

varying vec3 vN;
varying vec3 vV;
varying vec3 vL;


vec3 phong1()
{
    vec3 lightIntensity = vec3(1.0,1.0,1.0);

    vec3 n = normalize(vNormal);
    vec3 s = normalize(vec3(vLight));
    vec3 v = normalize(vec3(vPosition));
    vec3 r = reflect(s, n);

    vec3 Ka = vec3(0.9, 0.5, 0.3);
    vec3 Kd = vec3(0.9, 0.5, 0.3);
    vec3 Ks = vec3(0.8, 0.8, 0.8);

    vec3 ambient = Ka;
    vec3 diffuse = Kd * max(dot(s, n), 0.0);
    vec3 specular = Ks * pow(max(dot(r, v), 0.0), 20.);
    if( dot(s, n) < 0.0 )
        specular = vec3(0.0);

    return lightIntensity * (ambient + diffuse + specular);
}

vec3 phong2()
{
    vec3 lightIntensity = vec3(1.0,1.0,1.0);

    vec3 ambientProduct = vec3(0.9, 0.5, 0.3);
    vec3 diffuseProduct = vec3(0.9, 0.5, 0.3);
    vec3 specularProduct = vec3(0.8, 0.8, 0.8);
    float shininess = 200.0;

    vec3 N = normalize(vN);
    vec3 V = normalize(vV);
    vec3 L = normalize(vL);
    vec3 R = reflect( L, N );

    vec3 H = normalize( L + V );

    vec3 ambient = ambientProduct;

    float Kd = max( dot(L, N), 0.0 );
    vec3 diffuse = Kd * diffuseProduct;

    float Ks = pow( max( dot(N, H), 0.0),  shininess);
    vec3 specular = Ks * specularProduct;

    if( dot(L, N) < 0.0 )
        specular = vec3(0.0);

    return lightIntensity * ( ambient + diffuse + specular );
}

void main()
{
    


    gl_FragColor = vec4( phong2(), 1.);
    // gl_FragColor = vec4(uColor.rgb, 1.);
    // gl_FragColor = vColor;
    // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);;
}