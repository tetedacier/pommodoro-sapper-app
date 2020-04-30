<script>
    import Overlay from '../components/overlay.svelte'
    // $: internalOverlay = false;
    export let topics = [];
    export let forceOverlay = false;
    $: internalOverlay = forceOverlay;
    $: createNewTaskAfterSubmission = false;
</script>
<style>
    .trigger-overlay {
        width: 2.5rem;
        height: 2.5rem;
        border-radius: 1.25em;
        border: .25rem solid white;
        color: white;
        font-weight: bold;
        display: flex;
        justify-content: center;
        font-size: 1.2rem;
        background: linear-gradient(-180deg, blue, navajowhite);
    }
</style>
<button
    class="trigger-overlay"
    type="button"
    on:click={(e)=> {
        internalOverlay = true
    }}
    aria-labelledby="Add topic">+</button>


{#if internalOverlay}
    <Overlay>
        <h2 slot="title">Lorem ipsum</h2>
        <button slot="action" on:click={() => {internalOverlay = false}}>close</button>
        <fieldset slot="content">
            <label>
                <input type="checkbox" bind:checked={createNewTaskAfterSubmission} />
                create a new task after submission
            </label>
            <!--
                autofocus below is not really accessible at first,
                but a way needs to be found to make it so
            -->
            <input name="task_name" value="" autofocus on:keypress={(e) => {
                if (e.key === 'Enter') {
                    if (e.target.value !== '') {
                        topics = topics.concat([{
                            name: e.target.value,
                            ellapsedTime:0,
                            history: [],
                            subtasks: []
                        }])
                        if(! createNewTaskAfterSubmission) {
                            internalOverlay = false;
                        }
                        e.target.value = ""
                    } else {
                        throw new Error('task name can\'t be empty')
                    }
                    return e.preventDefault()
                }
                console.log(e)
            }} />
        </fieldset>
    </Overlay>
{/if}
