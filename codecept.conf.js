const { globals, helpers, plugins } = require('./lib/configs/core.js').config;
const downloadDir = 'temp';
const currentDir = __dirname;
const process = require('child_process');
// See https://codecept.io/configuration/ for more details
exports.config = {
  tempDownloadDir: downloadDir,
  currentDir: currentDir,
  name: 'Global Automation Framework',
  // Output folder for downloads, logs, reports, screenshots
  output: globals.outputDir,
  helpers: {
    // Only add certain helpers to the configuration if they are enabled
    ...(helpers.wd.enabled && { WebDriver: helpers.wd.config }),
    ...(helpers.appium.enabled && { Appium: helpers.appium.config }),
    ChaiWrapper: {
      require: 'codeceptjs-chai',
    },
    Reporter: {
      require: './lib/helpers/reporter.js',
    },
    FileSystem: {},
  },
  teardown: function () {
    process.exec('killchromedriver.bat');
  },
  // Actors and page objects to be registered in dependency injection container and included in tests
  include: {
    I: './steps_file.js',
    TestData: './lib/configs/global_test_data.js',
    ...require('./lib/configs/pages.js'),
    ...require('./lib/configs/components.js'),
    ...require('./lib/configs/utils.js'),
  },

  // BDD feature files and step definitions
  gherkin: {
    features: globals.featuresGlob,
    steps: [
      './lib/steps/bpc_common_steps.js',
      './lib/steps/lmp/lmp_api_steps.js',
      './lib/steps/rest/open_api_steps.js',
      './lib/steps/ussd/g2_ussd_steps.js',
      './lib/steps/ussd/generic_ussd_steps.js',
      './lib/steps/web/generic_web_steps.js',
      './lib/steps/web/lmp_portal_steps.js',
      './lib/steps/web/g2/adminpage_steps.js',
      './lib/steps/web/g2/createtoporgpage_steps.js',
      './lib/steps/web/g2/homepage_steps.js',
      './lib/steps/web/g2/leftmenupage_steps.js',
      './lib/steps/web/g2/loginpage_steps.js',
      './lib/steps/web/g2/orgpage_steps.js',
      './lib/steps/web/g2/g2_generic_web_steps.js',
    ],
  },
  // See https://codecept.io/plugins/ for more details
  plugins: {
    // Used for reporting
    allure: {
      outputDir: plugins.allure.resultsDir,
      enabled: plugins.allure.enabled,
    },
    // Starts and stops Appium in the background programmatically
    appiumServer: {
      require: './lib/plugins/appium_server.js',
      enabled: helpers.appium.enabled,
    },
    // Execution listener, populates test execution context details
    listener: {
      require: './lib/plugins/listener.js',
      enabled: plugins.listener.enabled,
    },
    // Test data loader
    loader: {
      require: './lib/plugins/loader.js',
      enabled: plugins.loader.enabled,
    },
    // Automatically launches interactive pause when a test fails
    pauseOnFail: { enabled: plugins.pauseOnFail.enabled },
    // Retries each failed step in a test
    retryFailedStep: { enabled: plugins.retryFailedStep.enabled },
    // Creates screenshot on failure, saved into output directory
    screenshotOnFail: { enabled: plugins.screenshotOnFail.enabled },
    // WebDriver IO services runner
    wdio: {
      enabled: helpers.wd.enabled,
      services: ['selenium-standalone'],
    },
    autoDelay: {
      enabled: plugins.autoDelay.enabled,
      delayBefore: '200',
      methods: [
        'waitForInvisible',
        'switchToFrame',
        'fillField',
        'click',
        'checkOption',
        'waitForElement',
        'switchToWindow',
        'switchTo',
        'waitForText',
        'see',
        'tap',
        'grabAllWindowHandles',
        'grabTextFrom',
        'grabTextFromAll',
        'dontSee',
      ],
      delayAfter: '200',
    },
  },
};
