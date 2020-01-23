import { register, init } from 'svelte-i18n'

register('en', () => import('./i18n/en.json'))
register('en-US', () => import('./i18n/en.json'))
init({
    fallbackLocale: 'en',
    initialLocale: {
      navigator: true, // i.e 'en-US'
    },
})
