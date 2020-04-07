<script>
	import { timeObserver, initialValue } from '../stores/activity.js'
	import Selector from './selector.svelte'
	import { toSeconds } from '../lib/time.js'
	export let value = { name: '', ellapsedTime:0, history:[], subtasks: [] }
	let {
		ellapsedTime
	} = value

	$: currentRun = initialValue(0)
	$: value.ellapsedTime = ellapsedTime + $currentRun.ellapsed + value.subtasks.reduce((acc, topic) => acc + topic.ellapsedTime, 0)
	const recordActivity = (event) => {
		currentRun = timeObserver(
			() => stopActivity()
		)
	}
	const stopActivity = (event) => {
		ellapsedTime = value.ellapsedTime
		const {
			ellapsed,
			start
		} = $currentRun
		value.history.push({
			ellapsed,
			start
		})
		currentRun = initialValue(0)
	}
</script>
<style>
	h2 {
		display: inline
	}
</style>
<li>
	<h2>
		{value.name}
	</h2>:
	<span>{toSeconds(value.ellapsedTime)}</span> s
	<span>{toSeconds($currentRun.ellapsed)}</span> s
	<button type="button" on:click={recordActivity}>
		record time
	</button>
	
	<button type="button" on:click={stopActivity}>
		stop activity
	</button>

	<Selector bind:topics={value.subtasks} />
	{#if ( value.subtasks.length > 0 )}
		total Time: {toSeconds(value.subtasks.reduce((acc, topic) => acc + topic.ellapsedTime, 0))} s
		<ul>	
			{#each value.subtasks as topic}
				<svelte:self bind:value={topic} />
			{/each}
		</ul>
	{:else}
		<p>
			No subtasks available yet.
		</p>
	{/if}
</li>