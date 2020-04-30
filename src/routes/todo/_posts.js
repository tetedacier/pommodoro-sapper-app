// Ordinarily, you'd generate this data from markdown files in your
// repo, or fetch them from a database of some kind. But in order to
// avoid unnecessary dependencies in the starter template, and in the
// service of obviousness, we're just going to leave it here.

// This file is called `_posts.js` rather than `posts.js`, because
// we don't want to create an `/blog/posts` route — the leading
// underscore tells Sapper not to do that.

const posts = [
	{
		title: 'Fix issues when rehydrating topics upon navigation',
		slug: 'rehydration-issues',
		type: `issue`,
		html: `
			<p>When users lands on topic edition, the component is working gracefuly</p>
			<p>But if he navigate and goes back on topic edit previously created topic stops working</p>
		`
	},

	{
		title: 'Newly created style does\'nt apply gracefuly',
		slug: 'background-styles',
		type: `issue`,
		html: `
			<ul>
				<li>gradient below the nav does'nt fully extends on desktop</li>
				<li>background of main content should be white</li>
			</ul>
		`
	},
	{
		title: 'Dailies creation',
		slug: 'dailies-creation',
		type: `feature`,
		html: `
			<p>Add possibility to create non existant dailies in the past with according ellapsed times</p>
		`
	},
	{
		title: 'Current date dailies creation',
		slug: 'automatic-dailies-creation',
		type: `feature`,
		html: `
			<p>Add automatic dailies creation for the current date</p>
		`
	},
	{
		title: 'Move dailies management into a dedicated section',
		slug: 'dailies-creation-placeholder',
		type: `feature`,
		html: `
			<p>This feature involves the creation of the app introduction page and create of a specific folder route for dailies management</p>
		`
	},
];

posts.forEach(post => {
	post.html = post.html.replace(/^\t{3}/gm, '');
});

export default posts;
