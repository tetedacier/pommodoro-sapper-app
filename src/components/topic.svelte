<script>
	import { timeObserver, initialValue } from '../stores/activity.js'
	import { toSeconds } from '../lib/time.js'
    export let value = {ellapsedTime:0, history:[]}
    let {
        ellapsedTime
    } = value

	$: currentRun = initialValue(0)
    $: value.ellapsedTime = ellapsedTime + $currentRun.ellapsed

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
	<button on:click={recordActivity}>
		record time
	</button>
	
	<button on:click={stopActivity}>
		stop activity
	</button>
</li>