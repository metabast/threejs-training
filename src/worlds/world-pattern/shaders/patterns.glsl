
float pattern1(){
    return strength;
}

float pattern2(){
    return strength;
}

float pattern3(){
    return vUv.x;
}

float pattern4(){
    return vUv.y;
}

float pattern5(){
    return 1.0-vUv.y;
}


float pattern6(){
    return vUv.y*6.3;
}

float pattern7(){
    return mod(vUv.y*10.0, 1.0);
}

float pattern8(){
    strength = mod(vUv.y*10.0, 1.0);
    return step(0.5, strength);
}

float pattern9(){
    strength = mod(vUv.y*10.0, 1.0);
    return step(1.0, strength + 0.3);
}

float pattern10(){
    strength = mod(vUv.x*10.0, 1.0);
    return step(1.0, strength+.1);
}

float pattern11(){
    strength = step(1.0, mod(vUv.x*10.0, 1.0) +.1);
    strength += step(1.0, mod(vUv.y*10.0, 1.0) +.1);
    return strength;
}

float pattern12(){
    strength = step(0.3, mod(vUv.x*10.0, 1.0) +.1);
    strength *= step(0.9, mod(vUv.y*10.0, 1.0) +.1);
    return strength;
}

float pattern13(){
    float barX = step(0.4, mod(vUv.x*10.0, 1.0));
    barX *= step(0.8, mod(vUv.y*10.0, 1.0));

    float barY = step(0.4, mod(vUv.y*10.0, 1.0));
    barY *= step(0.8, mod(vUv.x*10.0, 1.0));

    strength = barX + barY;
    return strength;
}

float pattern14(){
    float barX = step(0.4, mod(vUv.x*10.0, 1.0));
    barX *= step(0.8, mod(vUv.y*10.0, 1.0));

    float barY = step(0.4, mod(vUv.y*10.0, 1.0));
    barY *= step(0.8, mod(vUv.x*10.0, 1.0));

    strength = barX + barY;
    return strength;
}

float pattern15(){
    float barX = step(0.4, mod(vUv.x*10.0, 1.0));
    barX *= step(0.8, mod(vUv.y*10.0+.2, 1.0));

    float barY = step(0.4, mod(vUv.y*10.0, 1.0));
    barY *= step(0.8, mod(vUv.x*10.0+.2, 1.0));

    strength = barX + barY;
    return strength;
}

float pattern16(){
    strength = abs(vUv.x - .5);
    return strength;
}

float pattern17(){
    strength = min( abs(vUv.x - .5), abs(vUv.y - .5) );
    return strength;
}

float pattern18(){
    strength = max( abs(vUv.x - .5), abs(vUv.y - .5) );
    return strength;
}

float pattern19(){
    strength = step( 0.2, max( abs(vUv.x - .5), abs(vUv.y - .5) ) );
    return strength;
}

float pattern20(){
    strength = step( 0.2, max( abs(vUv.x - .5), abs(vUv.y - .5) ) );
    return strength;
}

float pattern21(){
    strength = floor(vUv.x*10.)*.1;

    // strength = floor(vUv.x*10.)*0.1;
    // strength *= floor(vUv.y*10.)*0.1;

    // strength = floor(vUv.x*10.)*0.04;
    // strength += floor(vUv.y*10.)*0.05;

    return strength;
}

float pattern22(){
    strength = rand(vUv);
    return strength;
}

float pattern23(){
    vec2 gridUv = vec2(floor(vUv.x*10.)*0.1, floor(vUv.y*10.)*0.1);
    return strength;
}

float pattern24(){
    vec2 gridUv = vec2(
        floor(vUv.x*10.),
        floor((vUv.y+vUv.x)*10.)
    );
    strength = rand(gridUv);
    return strength;
}

float pattern25(){
    strength = length(vUv);
    return strength;
}

float pattern26(){
    strength = distance(vUv, vec2(.2, .8));
    return strength;
}

float pattern27(){
    strength = 1.-distance(vUv, vec2(.5, .5));
    return strength;
}

float pattern28(){
    strength = .01 / distance(vUv, vec2(.5, .5));
    strength += .01 / distance(vUv, vec2(0.9, .5));
    strength += .01 / distance(vUv, vec2(0.75, 0.75));
    return strength;
}

float pattern29(){
    vec2 lightUvX = vec2(vUv.x *0.1 + 0.45, vUv.y *.5 + .25 );
    float lightX = 0.015 / distance(lightUvX, vec2(0.5));

    vec2 lightUvY = vec2(vUv.y *0.1 + 0.45, vUv.x *.5 + .25 );
    float lightY = 0.015 / distance(lightUvY, vec2(0.5));

    strength = lightX * lightY;
    return strength;
}

float pattern30(){
    vec2 lightUvX = vec2(vUv.x *0.1 + 0.45, vUv.y *.5 + .25 );
    float lightX = 0.015 / distance(lightUvX, vec2(0.5));

    vec2 lightUvY = vec2(vUv.y *0.1 + 0.45, vUv.x *.5 + .25 );
    float lightY = 0.015 / distance(lightUvY, vec2(0.5));

    strength = lightX * lightY;
    return strength;
}

float pattern31(){
    vec2 rotatedUv = rotate(vUv, PI*2.*.125, vec2(.5));

    vec2 lightUvX = vec2(rotatedUv.x *0.1 + 0.45, rotatedUv.y *.5 + .25 );
    float lightX = 0.015 / distance(lightUvX, vec2(0.5));

    vec2 lightUvY = vec2(rotatedUv.y *0.1 + 0.45, rotatedUv.x *.5 + .25 );
    float lightY = 0.015 / distance(lightUvY, vec2(0.5));

    strength = lightX * lightY;
    return strength;
}

float pattern32(){
    strength = distance(vUv, vec2(.5));
    strength = step(0.34, strength);
    return strength;
}

float pattern33(){
    strength = distance(vUv, vec2(.5));
    strength = abs(strength-0.41);
    return strength;
}

float pattern34(){
    strength = distance(vUv, vec2(.5));
    strength = abs(strength-0.35);
    strength = step(0.01, strength);
    return strength;
}

float pattern35(){
    strength = distance(vUv, vec2(.5));
    strength = 1.-abs(strength-0.37);
    strength = step(0.98, strength);
    return strength;
}

float pattern36(){
    vec2 wavedUv = vec2(
        vUv.x,
        vUv.y + sin(vUv.x*30.) * 0.2
    );
    strength = distance(wavedUv, vec2(.5));
    strength = 1.-abs(strength-0.26);
    strength = step(0.99, strength);
    return strength;
}

float pattern37(){
    vec2 wavedUv = vec2(
        vUv.x + sin(vUv.y*30.) * 0.1,
        vUv.y + sin(vUv.x*30.) * 0.1
    );
    strength = distance(wavedUv, vec2(.5));
    strength = 1.-abs(strength-0.26);
    strength = step(0.99, strength);
    return strength;
}

float pattern38(){
    vec2 wavedUv = vec2(
        vUv.x + sin(vUv.y*64.) * 0.1,
        vUv.y + sin(vUv.x*64.) * 0.1
    );
    strength = distance(wavedUv, vec2(.5));
    strength = 1.-abs(strength-0.26);
    strength = step(0.99, strength);
    return strength;
}

float pattern39(){
    float angle = atan(vUv.x, vUv.y);
    strength = angle;
    return strength;
}

float pattern40(){
    float angle = atan(vUv.x-.5, vUv.y-.5);
    strength = angle;
    return strength;
}

float pattern41(){
    float angle = atan(vUv.x-.5, vUv.y-.5);
    angle /= PI * 2.;
    angle += 0.7;
    strength = angle;
    return strength;
}

float pattern42(){
    float angle = atan(vUv.x-0.5, vUv.y-.5);
    strength = sin(angle*28.);
    return strength;
}

float pattern43(){
    float angle = atan(vUv.x-.5, vUv.y-0.5);
    float sinusoid = sin(angle * 15.);

    float radius = 0.28 + sinusoid * 0.015;
    strength = distance(vUv, vec2(0.5));
    strength = 1.-abs(strength-radius);
    strength = step(0.99, strength);

    return strength;
}

float pattern44(){
    strength = cnoise(vUv*10.);
    return strength;
}

float pattern45(){
    strength = cnoise(vUv*10.);
    strength = step(.1, strength);
    return strength;
}

float pattern46(){
    strength = cnoise(vUv*11.);
    strength = 1.-abs(strength);
    return strength;
}

float pattern47(){
    strength = cnoise(vUv*11.);
    strength = 1.-abs(mod(strength, 0.2));
    return strength;
}

float pattern48(){
    strength = cnoise(vUv*11.+uTime)+uTime*0.3;
    strength = sin(strength*18.);
    return strength;
}

float pattern49(){
    strength = cnoise(vUv*11.+uTime)+uTime*0.3;
    strength = step(0.98, sin(strength*18.));
    return strength;
}

float pattern50(){
    return strength;
}

