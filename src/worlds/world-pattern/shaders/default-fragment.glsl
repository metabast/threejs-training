#define PI 3.141592653589793
uniform float uTime;

varying vec2 vUv;
varying vec3 vPos;

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

float pattern50(){
    return 0.5;
}

vec3 color0(){
    return vec3(vUv, .0);
}

vec3 color1(){
    vec3 c1 = vec3(.5,.5,.8);
    vec3 c2 = vec3(.8,.5,.5);

    vec3 mixedColor = mix( c1, c2, vUv.x);

    return mixedColor;
}

vec3 color2(){
    // return vec3(vPos.xy, 0.);
    // ==
    return vec3(clamp(vPos.x, .0, 1.), clamp(vPos.y, .0, 1.), 0.);
}

vec3 color3(){
    vec3 color = vec3(.0);

    color.r = step( 0.0, vPos.x);
    color.g = step( 0.0, vPos.y);

    return color;
}

vec3 color4(){
    vec3 color = vec3(.0);

    color.r = step( 0.5, vUv.x);
    color.g = step( 0.5, vUv.y);

    return color;
}

vec3 color5(){
    vec3 color = vec3(.0);

    color.r = smoothstep( -0.2, 0.2, vPos.x);
    color.g = smoothstep( -0.2, 0.2, vPos.y);

    return color;
}

vec3 circle1(){
    vec3 color = color0();
    float circle = step( 0.25, length(vPos.xy) );

    // color.r = step( 0.25, length(vPos.xy) );

    return color * circle;
}

vec3 circle2(){
    vec3 color = color1();

    float circle = smoothstep( 0.24, 0.26, length(vPos.xy) );

    return color * circle;
}

vec3 circle3(){
    vec3 color = color1();

    color.r = smoothstep( 0.249, 0.255, length(vPos.xy) );

    return color;
}

vec3 circle4(){
    vec3 color = color1();

    color.r = smoothstep( 0.248, 0.256, length(vPos.xy) ) - smoothstep( 0.253, 0.295, length(vPos.xy) );

    return color;
}

float circle5(){
    return smoothstep( 0.248, 0.256, length(vPos.xy) ) - smoothstep( 0.253, 0.295, length(vPos.xy) );
}

// Return 1.0 when point, pt is inside a recatangle defined by size and center
float rect(vec3 pt, float size, vec2 center){
    float halfSize = size * .5;
    float squareH = step( -halfSize, pt.x - center.x ) - step( halfSize, pt.x - center.x );
    float squareV = step( -halfSize, pt.y - center.y ) - step( halfSize, pt.y - center.y );
    return squareH * squareV;
}

vec3 square1(){
    vec3 c1 = vec3(.0);
    c1.r = c1.g = rect( vPos, .25, vec2(0.,0.) );

    return c1;
}

vec3 square2(){
    vec3 c1 = vec3(.0);
    c1.r = c1.g = rect( vPos, .25, vec2(-0.375,.375) );

    vec3 c2 = vec3(.0);
    c2.g = rect( vPos, .25, vec2(0.375,.375) );
    // or
    c2 = vec3(.0, 1., .0);
    c2 *= rect( vPos, .25, vec2(0.375,.375) );

    return c1+c2;
}

vec3 moveSquare(){
    vec3 c1 = vec3(.0);
    float radius = 0.2;
    float speed = 2.;
    c1.r = c1.g = rect( vPos, .1, vec2( cos(uTime*speed)*radius, sin(uTime*speed)*radius) );

    return c1;
}

void main()
{
    // Colored
    vec3 blackColor = vec3(0.);
    vec3 uvColor = vec3(vUv, 1.0);
    float pattern = circle5();
    vec3 mixedColor = mix(blackColor, uvColor, pattern);

    // Grey
    vec3 color = vec3( moveSquare() );

    gl_FragColor = vec4(color, 1.0);
}

