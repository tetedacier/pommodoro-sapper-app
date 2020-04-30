<svelte:head>
	<title>Sapper project template</title>
</svelte:head>

<script>
	import {
		onMount,
		onDestroy
	} from 'svelte'
	import { _ } from 'svelte-i18n'
	import TransitionWrapper from '../components/TransitionWrapper.svelte'
	import Topic from '../components/topic.svelte'
	import Selector from '../components/selector.svelte'
	import {toSeconds} from '../lib/time.js'
	let dailies = {}
	let topics = []
	function fetchTopics() {
		const date = new Date()
		const dateStamp = `${date.getFullYear()}-${(date.getMonth()+1).toString().padStart(2,'0')}-${date.getDate().toString().padStart(2,'0')}`
		fetch(`http://localhost:3010/dailies?date=${dateStamp}`)
			.then(r => r.json(), err => console.error(err))
			.then(dayly => {
				console.log(dayly)
				dailies[dateStamp] = dayly[0].id;
				topics = dayly[0].activities
			}, err => console.error(err))
	}
	function uploadTopics() {
		const date = new Date()
		const dateStamp = `${date.getFullYear()}-${(date.getMonth()+1).toString().padStart(2,'0')}-${date.getDate().toString().padStart(2,'0')}`
		console.warn(topics)
		console.warn(JSON.stringify(topics))
		if (dailies[dateStamp]) {
			window.fetch(`http://localhost:3010/dailies/${dailies[dateStamp]}`, {
				method: 'PUT',
				headers:{
					'Content-Type': 'application/json; charset=utf-8'
				},
				body: JSON.stringify({
					date: dateStamp,
					activities: topics
				})
			})
				.then(r => r.json(), err => console.error(err))
		}
	}
	const saveTopics = (event) => {
		uploadTopics()
	}
	onDestroy(uploadTopics)
	onMount(fetchTopics)
</script>
<TransitionWrapper>

	<h1>{$_('app_title')}</h1>
	<button type="button" on:click={saveTopics}>save</button>
	<Selector bind:topics={topics} />
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
