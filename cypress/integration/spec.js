import {app_title} from '../../src/i18n/en.json'
describe('Pommodoro sapper app', () => {
	beforeEach(() => {
		cy.visit('/')
	});

	it('has a correct welcome page', () => {
		cy.contains('h1', app_title)
	});
});