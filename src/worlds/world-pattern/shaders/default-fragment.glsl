#define PI 3.141592653589793
uniform float uTime;

varying vec2 vUv;


float strength = .5;

float rand(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

vec2 rotate(vec2 uv, float rotation, vec2 mid)
{
    return vec2(
      cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
      cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}

#include perlin;
#include patterns;

void main()
{
    // Colored
    vec3 blackColor = vec3(0.);
    vec3 uvColor = vec3(vUv, 1.0);
    vec3 mixedColor = mix(blackColor, uvColor, pattern49());

    // Grey
    vec3 color = vec3(pattern49());

    gl_FragColor = vec4(mixedColor, 1.0);;
}

