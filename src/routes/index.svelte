<style>
	h1 {
		text-align: center;
		margin: 0 auto;
	}

	h1 {
		font-size: 2.8em;
		text-transform: uppercase;
		font-weight: 700;
		margin: 0 0 0.5em 0;
	}

	@media (min-width: 480px) {
		h1 {
			font-size: 4em;
		}
	}
</style>

<script>
import { _ } from 'svelte-i18n'
import { achievement } from '../stores'
import ListAchievements from '../components/list-achievement.svelte'
let goal = ''
const achievementAdd = (event) => {
	achievement.push({ goal })
	goal = ''
}
</script>

<svelte:head>
	<title>Sapper project template</title>
</svelte:head>

<h1>{$_('app_title')}</h1>

<fieldset>
	<legend>What do you want to achieve ?</legend>
	<label>Goal: <input name="goal" bind:value={goal} /></label>
	<button on:click={achievementAdd}><span>Start tracking</span></button>
</fieldset>
<ListAchievements />