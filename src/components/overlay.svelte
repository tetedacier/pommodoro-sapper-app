<script>
    import {onMount} from 'svelte'
    import {fly} from 'svelte/transition'
    $: remainingLifeTime = 5;
    const closeOverlay = (event) => {
        event.preventDefault()
    }

    let show = false

    onMount(()=>{
        show = true
    })
    const inject = (node, argument = "body") => {
        var targetNode;

        if (typeof argument !== "string") {
            targetNode = argument;
        } else {
            targetNode = document.querySelector(argument);
        }

        targetNode.appendChild(node);

        return {
            destroy() {
                node.remove();
            }
        }
    }

</script>

<style>
.overlay {
	background-color: #0000007F;
	position: fixed;
	display: flex;
    align-items: center;
    justify-content: center;
	top:0;
	bottom:0;
	left:0;
	right: 0;
}
.wrapper {
	background-color: #FFFFFF;
	margin: 1em;
	padding: 2em;
	display: flex;
	flex-direction: column;
	position: relative;
	max-height: calc(100% - 6em);
}
header {
	background-color: #FFFFFF;
}
.content {
	max-height: calc(100% - 6em);
	overflow-y: scroll;
}
</style>
<section use:inject class="overlay">
    {#if show}
        <div class="wrapper" in:fly="{{y:-800, duration:600}}">
            <header>
                <slot name="title" />
                <slot name="action">
                    <button on:click={closeOverlay}>close</button>
                </slot>
            </header>
            <div class="content">
                <slot name="content">
                    no content provided ?
                    this will be closed automatically in {remainingLifeTime} seconds
                </slot>
            </div>
        </div>
    {/if}
</section>

