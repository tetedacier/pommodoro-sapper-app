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
		if (dailies) {
			if (dailies[dateStamp]) {
				console.log('already fetched')
			} else {
				fetch(`http://localhost:3010/dailies?date=${dateStamp}`)
					.then(r => r.json(), err => console.error(err))
					.then(([dayly]) => {
						console.log(dayly)
						if(dayly) {
							dailies[dateStamp] = dayly;
							topics = dayly.activities
						}
						else {
							console.error(`no daily available for ${dateStamp}`)
						}
					}, err => console.error(err))
			}
		} else {
			console.log('dailies in retrieval')
		}
	}
	function uploadTopics() {
		const date = new Date()
		const dateStamp = `${date.getFullYear()}-${(date.getMonth()+1).toString().padStart(2,'0')}-${date.getDate().toString().padStart(2,'0')}`
		if (dailies) {
			if (dailies[dateStamp]) {
				window.fetch(`http://localhost:3010/dailies/${dailies[dateStamp].id}`, {
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
	}
	const saveTopics = (event) => {
		uploadTopics()
	}
	onDestroy(() => {
		uploadTopics()
	})
	onMount(() => {
		fetchTopics()
	})
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
