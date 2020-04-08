<script>
    import Overlay from '../components/overlay.svelte'
    // $: internalOverlay = false;
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
            // $internalOverlay = true;
			throw new Error('task name can\'t be empty')
		}
    }
</script>
<style>
    button {
        width: 2rem;
        height: 2rem;
        border-radius: 50%;
        color: white;
        font-weight: bold;
        display: flex;
        justify-content: center;
        font-size: 1.2rem;
        background: linear-gradient(45deg, blue, red);
    }
</style>
<fieldset>
	<input value="" />
	<button
        type="button"
        on:click={addTopic}
        aria-labelledby="Add topic">+</button>
</fieldset>
<!--
{#if $internalOverlay}
    <Overlay>
        <h2 slot="title">Lorem ipsum</h2>
        <article slot="content">Lorem ipsum dolor sit amet</article>
    </Overlay>
{/if} -->