<script context="module">
import { waitLocale } from 'svelte-i18n'
// import 'i18n'
  export async function preload() {
    // awaits for the loading of the 'en-US' and 'en' dictionaries
    return waitLocale()
  }
</script>
<script>
	import Nav from '../components/Nav.svelte';
	export let segment;
</script>

<style>
	main {
		position: relative;
		max-width: 56em;
		background: linear-gradient(silver 0 , white 2em , lightgrey 2em);
		padding: 2em;
		margin: 0 auto;
		box-sizing: border-box;
	}
</style>

<Nav {segment}/>

<main>
	<slot></slot>
</main>