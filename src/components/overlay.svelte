<script>
	$: remainingLifeTime = 5;
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

<section class="overlay">
	<div class="wrapper">
		<header>
			<slot action="title" />
			<slot action="action">
				<button on:click={closeOverlay}>close</button>
			</slot>
		</header>
		<div class="content">
			<slot action="content">
				no content provided ?
				this will be closed automatically in {$remainingLifeTime} seconds
			</slot>
		</div>
	</section>
</section>