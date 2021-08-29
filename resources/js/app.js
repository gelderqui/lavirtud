/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.$ = window.jQuery = require('jquery'); 

window.Vue = require('vue').default;
// Codigo para importar vue-select
// import Vue from "vue";
// import vSelect from "vue-select";
// Vue.component("v-select", vSelect);
// import 'vue-select/dist/vue-select.css';
// import "vue-select/src/scss/vue-select.scss";
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))
import CategoriaComponent from './components/Categoria.vue';
Vue.component('categoria', CategoriaComponent);
import ArticuloComponent from './components/Articulo.vue';
Vue.component('articulo', ArticuloComponent);
import ClienteComponent from './components/Cliente.vue';
Vue.component('cliente', ClienteComponent);
import ProveedorComponent from './components/Proveedor.vue';
Vue.component('proveedor', ProveedorComponent);
import RolComponent from './components/Rol.vue';
Vue.component('rol', RolComponent);
import UserComponent from './components/User.vue';
Vue.component('user', UserComponent);
import IngresoComponent from './components/Ingreso.vue';
Vue.component('ingreso', IngresoComponent);
import VentaComponent from './components/Venta.vue';
Vue.component('venta', VentaComponent);
import DashboardComponent from './components/Dashboard.vue';
Vue.component('dashboard', DashboardComponent);
import ConsultaingresoComponent from './components/Consultaingreso.vue';
Vue.component('consultaingreso', ConsultaingresoComponent);
import ConsultaventaComponent from './components/Consultaventa.vue';
Vue.component('consultaventa', ConsultaventaComponent);

// Tambien se puede llamar de la otra forma mejor rendimiento
// Vue.component("articulo", () => import("./components/Articulo.vue"));


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    data :{
        menu : 0,
        ruta: 'http://localhost:80/arch/ludvin/public'
        //ruta: 'http://localhost:80/proyecto/sistemaventas/sistema/public'
        //ruta: 'http://sistema.mayahonh.com/public'
    }
});
