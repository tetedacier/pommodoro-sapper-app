# pommodoro-sapper-app

Simple time tracking project. This app has been generated using the [default sapper roolup template](https://github.com/sveltejs/sapper#rollup).


## Getting started


### Running the project

Once the code the has been feched locally, you can install dependencies and run the project in development mode with:

```bash
cd my-app
npm i
npm run dev
```

Open up [localhost:3000](http://localhost:3000) and begin your activity.

### Running test

You will need to install cypress globally to avoid shipping of non essential and heavy dependency onto staging/production :

```bash
npm i -g cypress
```

Then you can run test using the following npm scripts:

```bash
npm run cy:run # run test in headless mode
npm run cy:open # run test with cypress tooling opened
```
## Principle

This app allow you to track what your achievement. You first define your goal and run each of them through the tracker.


## Structure, bundler, mode and sapper instruction

As a sapper app, all instruction provided by the [original sapper rollup documention](https://github.com/sveltejs/sapper-template/tree/rollup) apply on this project.

## Bugs and feedback

All issues related to this project should be reported in [pommodoro-sapper-app](https://github.com/tetedacier/pommodoro-sapper-app/issues) issue tracker. Those related to sapper should be reported in [Sapper issue tracker](https://github.com/sveltejs/sapper/issues).
