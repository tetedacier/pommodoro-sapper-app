import { readable, derived, writable } from 'svelte/store';

let runningActivity = null;
export const timeObserver = (stopCallback) => {
	if(runningActivity) {
		runningActivity()
	}
	runningActivity = stopCallback;
	const time = readable(new Date(), function start(set) {
		const interval = setInterval(() => {
			set(new Date());
		}, 1000);

		return function stop() {
			clearInterval(interval);
		};
	});

	const start = new Date();

	return derived(
		time,
		$time => ({
			start: start.getTime(),
			ellapsed: $time - start
		})
	);
}
export const initialValue = (value) => readable({ellapsed: value})
