<script>
	export let topics = [];
	const addTopic = (event) => {
		const topicNameElement = event.target.parentNode.querySelector('input')
		if (topicNameElement.value !== '') {
			topics = topics.concat([{
				name: topicNameElement.value,
				ellapsedTime:0,
                history: [],
                subtasks: []
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