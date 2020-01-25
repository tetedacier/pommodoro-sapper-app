<script>
import { achievement } from '../stores'
const pommodoroSpan = 20 * 60 * 1000
let activeTask
const startTimer = (task) => (event) => {
    activeTask = task
    task.startTimeObserver()
}
const stopTimer = (task) => (event) => {
    task.stopTimeObserver()
    activeTask = undefined
}
</script>

{#if $achievement.length > 0}
    <ul>
        {#each $achievement as task}
            <li id={task.id}>
                {task.goal}
                <button
                    disabled={activeTask !== undefined}
                    on:click={startTimer(task)}
                >
                    <span>start</span>
                </button>
                <button
                    disabled={activeTask === undefined || activeTask.id !== task.id}
                    on:click={stopTimer(task)}
                >
                    <span>stop</span>
                </button>
                <p>consumed time: {Math.round(task.timeEllapsed/1000) || 0} s</p>
            </li>
        {/each}
    </ul>
{:else}
    <p>No achievement to show</p>
{/if}