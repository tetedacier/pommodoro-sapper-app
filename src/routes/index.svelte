<svelte:head>
	<title>Sapper project template</title>
</svelte:head>

<script>
	import { _ } from 'svelte-i18n'
	import TransitionWrapper from '../components/TransitionWrapper.svelte'
	import Topic from '../components/topic.svelte'
	import Selector from '../components/selector.svelte'
	import {toSeconds} from '../lib/time.js'

	let topics = []

</script>
<TransitionWrapper>
	<Selector bind:topics={topics} />

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
</TransitionWrapper>
