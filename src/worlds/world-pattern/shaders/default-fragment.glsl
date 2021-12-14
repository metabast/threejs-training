#define PI 3.141592653589793
uniform float uTime;

varying vec2 vUv;

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

void main()
{
    float strength = 0.;
    // Pattern 3
    // strength = vUv.x;

    // Pattern 4
    // strength = vUv.y;

    // Pattern 5
    // strength = 1.0-vUv.y;

    // Pattern 6
    // strength = vUv.y*6.3;

    // Pattern 7
    // strength = mod(vUv.y*10.0, 1.0);

    // Pattern 8
    // strength = mod(vUv.y*10.0, 1.0);
    // strength = step(0.5, strength);

    // Pattern 9
    // strength = mod(vUv.y*10.0, 1.0);
    // strength = step(1.0, strength+.1);

    // Pattern 10
    // strength = mod(vUv.x*10.0, 1.0);
    // strength = step(1.0, strength+.1);

    // Pattern 11
    // strength = step(1.0, mod(vUv.x*10.0, 1.0) +.1);
    // strength += step(1.0, mod(vUv.y*10.0, 1.0) +.1);

    // Pattern 12
    // strength = step(1.0, mod(vUv.x*10.0, 1.0) +.1);
    // strength *= step(1.0, mod(vUv.y*10.0, 1.0) +.1);

    // Pattern 13
    // strength = step(0.3, mod(vUv.x*10.0, 1.0) +.1);
    // strength *= step(0.9, mod(vUv.y*10.0, 1.0) +.1);

    // Pattern 14
    // float barX = step(0.4, mod(vUv.x*10.0, 1.0));
    // barX *= step(0.8, mod(vUv.y*10.0, 1.0));

    // float barY = step(0.4, mod(vUv.y*10.0, 1.0));
    // barY *= step(0.8, mod(vUv.x*10.0, 1.0));

    // strength = barX + barY;

    // Pattern 15
    // float barX = step(0.4, mod(vUv.x*10.0, 1.0));
    // barX *= step(0.8, mod(vUv.y*10.0+.2, 1.0));

    // float barY = step(0.4, mod(vUv.y*10.0, 1.0));
    // barY *= step(0.8, mod(vUv.x*10.0+.2, 1.0));

    // strength = barX + barY;

    // Pattern 17
    // strength = abs(vUv.x - .5);
    // Pattern 17
    // strength = min( abs(vUv.x - .5), abs(vUv.y - .5) );
    // Pattern 18
    // strength = max( abs(vUv.x - .5), abs(vUv.y - .5) );
    // Pattern 19
    // strength = step( 0.2, max( abs(vUv.x - .5), abs(vUv.y - .5) ) );
    // Pattern 20
    // strength = step( 0.2, max( abs(vUv.x - .5), abs(vUv.y - .5) ) );
    // strength *= 1.-step( 0.25, max( abs(vUv.x - .5), abs(vUv.y - .5) ) );

    // Pattern 21
    // strength = floor(vUv.x*10.)*.1;

    // Pattern 21
    // strength = floor(vUv.x*10.)*0.1;
    // strength *= floor(vUv.y*10.)*0.1;

    // Pattern 21 b
    // strength = floor(vUv.x*10.)*0.04;
    // strength += floor(vUv.y*10.)*0.05;

    // Pattern 22
    // strength = rand(vUv);

    // Pattern 23
    // vec2 gridUv = vec2(floor(vUv.x*10.)*0.1, floor(vUv.y*10.)*0.1);
    // strength = rand(gridUv);

    // Pattern 24
    // vec2 gridUv = vec2(
    //     floor(vUv.x*10.),
    //     floor((vUv.y+vUv.x)*10.)
    // );
    // strength = rand(gridUv);

    // Pattern 25
    // strength = length(vUv);

    // Pattern 26
    // strength = distance(vUv, vec2(.2, .8));

    // Pattern 27
    // strength = 1.-distance(vUv, vec2(.5, .5));

    // Pattern 28
    // strength = .01 / distance(vUv, vec2(.5, .5));
    // strength += .01 / distance(vUv, vec2(0.9, .5));
    // strength += .01 / distance(vUv, vec2(0.75, 0.75));

    // Pattern 29
    // vec2 lightUvX = vec2(vUv.x *0.1 + 0.45, vUv.y *.5 + .25 );
    // float lightX = 0.015 / distance(lightUvX, vec2(0.5));

    // vec2 lightUvY = vec2(vUv.y *0.1 + 0.45, vUv.x *.5 + .25 );
    // float lightY = 0.015 / distance(lightUvY, vec2(0.5));

    // strength = lightX * lightY;

    // Pattern 30
    // vec2 lightUvX = vec2(vUv.x *0.1 + 0.45, vUv.y *.5 + .25 );
    // float lightX = 0.015 / distance(lightUvX, vec2(0.5));

    // vec2 lightUvY = vec2(vUv.y *0.1 + 0.45, vUv.x *.5 + .25 );
    // float lightY = 0.015 / distance(lightUvY, vec2(0.5));

    // strength = lightX * lightY;

    // Pattern 31
    // vec2 rotatedUv = rotate(vUv, PI*2.*.125, vec2(.5));

    // vec2 lightUvX = vec2(rotatedUv.x *0.1 + 0.45, rotatedUv.y *.5 + .25 );
    // float lightX = 0.015 / distance(lightUvX, vec2(0.5));

    // vec2 lightUvY = vec2(rotatedUv.y *0.1 + 0.45, rotatedUv.x *.5 + .25 );
    // float lightY = 0.015 / distance(lightUvY, vec2(0.5));

    // strength = lightX * lightY;

    // Pattern 32
    // strength = distance(vUv, vec2(.5));
    // strength = step(0.34, strength);

    // Pattern 33
    // strength = distance(vUv, vec2(.5));
    // strength = abs(strength-0.41);

    // Pattern 34
    // strength = distance(vUv, vec2(.5));
    // strength = abs(strength-0.35);
    // strength = step(0.01, strength);

    // Pattern 35
    // strength = distance(vUv, vec2(.5));
    // strength = 1.-abs(strength-0.37);
    // strength = step(0.98, strength);

    // Pattern 36
    // vec2 wavedUv = vec2(
    //     vUv.x,
    //     vUv.y + sin(vUv.x*30.) * 0.2
    // );
    // strength = distance(wavedUv, vec2(.5));
    // strength = 1.-abs(strength-0.26);
    // strength = step(0.99, strength);

    // Pattern 37
    // vec2 wavedUv = vec2(
    //     vUv.x + sin(vUv.y*30.) * 0.1,
    //     vUv.y + sin(vUv.x*30.) * 0.1
    // );
    // strength = distance(wavedUv, vec2(.5));
    // strength = 1.-abs(strength-0.26);
    // strength = step(0.99, strength);

    // Pattern 38
    // vec2 wavedUv = vec2(
    //     vUv.x + sin(vUv.y*64.) * 0.1,
    //     vUv.y + sin(vUv.x*64.) * 0.1
    // );
    // strength = distance(wavedUv, vec2(.5));
    // strength = 1.-abs(strength-0.26);
    // strength = step(0.99, strength);

    // Pattern 39
    // float angle = atan(vUv.x, vUv.y);
    // strength = angle;

    // Pattern 40
    // float angle = atan(vUv.x-.5, vUv.y-.5);
    // strength = angle;

    // Pattern 41
    // float angle = atan(vUv.x-.5, vUv.y-.5);
    // angle /= PI * 2.;
    // angle += 0.7;
    // strength = angle;

    // Pattern 42
    // float angle = atan(vUv.x-0.5, vUv.y-.5);
    // strength = sin(angle*28.);

    // Pattern 43
    // float angle = atan(vUv.x-.5, vUv.y-0.5);
    // float sinusoid = sin(angle * 15.);

    // float radius = 0.28 + sinusoid * 0.015;
    // strength = distance(vUv, vec2(0.5));
    // strength = 1.-abs(strength-radius);
    // strength = step(0.99, strength);

    // Pattern 44
    // strength = cnoise(vUv*10.);

    // Pattern 45
    // strength = cnoise(vUv*10.);
    // strength = step(.1, strength);

    // Pattern 46
    // strength = cnoise(vUv*11.);
    // strength = 1.-abs(strength);

    // Pattern 47
    // strength = cnoise(vUv*11.);
    // strength = 1.-abs(mod(strength, 0.2));

    // Pattern 48
    // strength = cnoise(vUv*11.+uTime)+uTime*0.3;
    // strength = sin(strength*18.);

    // Pattern 49
    strength = cnoise(vUv*11.+uTime)+uTime*0.3;
    strength = step(0.98, sin(strength*18.));

    // Colored
    vec3 blackColor = vec3(0.);
    vec3 uvColor = vec3(vUv, 1.0);
    vec3 mixedColor = mix(blackColor, uvColor, strength);

    gl_FragColor = vec4(mixedColor, 1.0);;
}