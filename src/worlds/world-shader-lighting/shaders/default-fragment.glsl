precision mediump float;

uniform float uTime;
uniform vec3 uColor;
uniform vec3 uSpecularColor;
uniform float lightDirectionX;
uniform float specularAmount;
uniform float specularShininess;

varying vec3 vN;
varying vec3 vV;
varying vec3 vL;


vec3 phong()
{
    vec3 lightIntensity = vec3(1.0,1.0,1.0);

    vec3 ambientProduct = vec3(0.6, 0.1, 0.1);
    vec3 diffuseProduct = vec3(0.9, 0.2, 0.2);
    vec3 specularProduct = vec3(0.7, 0.4, 0.6);
    float shininess = 200.0;

    vec3 N = normalize(vN);
    vec3 V = normalize(vV);
    vec3 L = normalize(vL);

    vec3 H = normalize( L + V );
    vec3 R = reflect(-L, N);

    vec3 ambient = ambientProduct;

    float Kd = max( dot(L, N), 0.0 );
    vec3 diffuse = Kd * diffuseProduct;

    float Ks = pow( max( dot(N, H), 0.0),  shininess);
    // float Ks = pow( max( dot(V, R), 0.0),  shininess); // Blinn
    vec3 specular = Ks * specularProduct;

    if( dot(L, N) < 0.0 )
        specular = vec3(0.0);

    return lightIntensity * ( ambient + diffuse + specular );
}

void main()
{
    gl_FragColor = vec4( phong(), 1.);
}