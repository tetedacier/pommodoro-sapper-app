<svelte:head>
	<title>Sapper project template</title>
</svelte:head>

<script>
import { _ } from 'svelte-i18n'
	import Topic from '../components/topic.svelte'
	import {toSeconds} from '../lib/time.js'

	let topics = [];
	const addTopic = (event) => {
		const topicNameElement = event.target.parentNode.querySelector('input')
		if (topicNameElement.value !== '') {		
			topics = topics.concat([{
				name: topicNameElement.value,
				ellapsedTime:0,
				history: []
			}])
			topicNameElement.value = ""
		} else {
			throw new Error('')
		}
	}
</script>
<fieldset>
	<input value="" />
	<button type="button" on:click={addTopic}>
		Add topic
	</button>
</fieldset>

<h1>{$_('app_title')}</h1>
{#if ( topics.length > 0 )}
	total Time: {toSeconds(topics.reduce((acc, topic) => acc + topic.ellapsedTime, 0))} s
	<ul>	
		{#each topics as topic}
			<Topic bind:value={topic} />
		{/each}
	</ul>
{:else}
	<p>
		No topics available yet.
	</p>
{/if}
