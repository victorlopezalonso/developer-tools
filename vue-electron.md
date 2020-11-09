# Vue electron App

##### Create app
	vue create electron-app-name

##### Features
	❯ Manually select features
	
	? Check the features needed for your project:
	◉ Babel
	◉ Router
	◉ Vuex
	◉ CSS Pre-processors
	◉ Linter / Formatter
	◉ Unit Testing
	
	? Use history mode for router? (Requires proper server setup for index fallback in production) (Y/n) n
	
	? Pick a CSS pre-processor (PostCSS, Autoprefixer and CSS Modules are supported by default):
	❯ Sass/SCSS (with node-sass)

	? Pick a linter / formatter config:
	❯ ESLint + Airbnb config

	? Pick additional lint features: (Press <space> to select, <a> to toggle all, <i> to invert selection)
	❯◉ Lint on save

	? Pick a unit testing solution:
	❯ Jest

	? Where do you prefer placing config for Babel, ESLint, etc.? (Use arrow keys)
	❯ In dedicated config files

##### Use Tailwind CSS

	#add dependency
	yarn add tailwindcss --dev
	
	#create config file (tailwind.config.js)
	npx tailwindcss init
	
	#export postcss processors config
	create a new "postcss.config.js" with this content
		module.exports = {
		  plugins: [
		    /* eslint-disable global-require */
		    require('tailwindcss')('tailwind.config.js'),
		  ],
		};

	#add css dependencies
	create "assets/main.css" this this content
		@tailwind base;
		@tailwind components;
		@tailwind utilities;
	
	#import css on main.js
	import '@/assets/main.css';

	#delete App.vue style section

	#to test if tailwind works add a class to an existing div
	<div class="bg-gray-500 p-5 text-center">

##### Add electron builder [https://nklayman.github.io/vue-cli-plugin-electron-builder/guide/#installation](https://nklayman.github.io/vue-cli-plugin-electron-builder/guide/#installation)
	vue add electron-builder

##### To start a Development Server
	yarn electron:serve

##### To Build Your App
	yarn electron:build

##### Node Integration
	
	#create vue.config.js with this content:
		module.exports = {
		  pluginOptions: {
		    electronBuilder: {
		      nodeIntegration: true
		    }
		  }
		};
	

### Tips

##### .eslintrc.js rules

	rules: {
	    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
	    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
	    'import/no-extraneous-dependencies': ['error', { devDependencies: true }],
	    'max-len': ['error', { code: 140, ignoreComments: true }],
	},

##### Using icpManager

	#background.js (listener)
	ipcMain.handle('read-file', (params) => {});

	#another.js (emitter)
	electron.ipcRenderer.invoke('read-file', params)

