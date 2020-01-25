import { writable } from 'svelte/store';

function task (achievement) {
    let timeoutInterval;
    this.timeEllapsed = 0;
    Object.keys(achievement).forEach((key) => {
        this[key] = achievement[key]
    })

    this.startTimeObserver = () => {
        const startTime = Date.now()
        timeoutInterval = setInterval(()=>{
            this.timeEllapsed += Date.now() - startTime;
        }, 400);
    };
    this.stopTimeObserver = () => {
        clearInterval(timeoutInterval)
    };
}
const createAchievements = () => {
    const { subscribe, set, update } = writable([])

	return {
		subscribe,
		push: (achievement) => update(achievements => achievements.concat([new task({
            ...achievement,
            id: achievements.length
        })])),
		reset: () => set([])
	};
}

export default createAchievements();