<script>
// Force reload
if (import.meta.hot) {
    import.meta.hot.dispose( (data) => {
        import.meta.hot.invalidate();
    } )
}
import {onMounted} from 'vue';
import World from '../worlds/world-pattern/World.js' 
// import World from '../worlds/world-shader-lighting/World.js' 
export default {
  setup(){
    onMounted( mounted );
  }
}

function mounted(){
  new World();
}



</script>

<template>
  <canvas class="webgl"></canvas>
</template>

<style scoped>
.webgl{
  outline: none;
  background-color: black;
}
</style>