/**
 * Configuration module for the core framework, using dotenv and convict
 * for defining the schema and loading/validating the configuration
 */
const _ = require('lodash');
const convict = require('convict');
const { resolve, sep } = require('path');

const corePackageName = '@slr-dynamics/gaf-core';
const defaultChromeOptionsArgs = [
  '--disable-gpu',
  '--no-sandbox',
  '--disable-web-security',
  '--disable-site-isolation-trials',
  '--ignore-certificate-errors',
];

// The loaded dotenv file can be changed with the GAF_DOTENV_PATH environment
// variable, defaults to the '.env' file in the current working directory
let dotenvPath = resolve(process.env.GAF_DOTENV_PATH || `${process.cwd()}/.env`);

// Try loading the defined dotenv file, if there is a problem log
// a warning in the CLI process but not in the CodeceptJS process
let loadResult = require('dotenv').config(
  process.env.GAF_DOTENV_PATH === undefined ? {} : { path: dotenvPath },
);
if (!_.endsWith(require.main.filename, 'codecept.js')) {
  if (loadResult.error !== undefined) {
    //   console.warn(`The .env configuration file could not be loaded from: ${loadResult.error.path}`);
  } else {
    {
      //    console.log(`Environment variables loaded from: ${dotenvPath}`);
    }
  }
}

// The workspace directory is needed to render the default value of other configuration properties,
// and since the convict package does not provide a clear option yet to define dynamic defaults, the
// values below need to be defined outside of the convict configuration schema as well. The following
// helps define where the default workspace, output and test data directory is most likely located.
let coreDir = `${__dirname}/../..`;
let workspacePrefix;
try {
  // If this framework is used as a dependency, then the dependant package should contain the core
  // package, assuming the 'node_modules/@slr-dynamics/gaf-core/lib/configs/' path
  let packageInfo = require(`${coreDir}/../../../package.json`);
  if (_.includes(Object.keys(packageInfo.dependencies), corePackageName)) {
    workspacePrefix = '../../..';
  } else {
    // Otherwise, the workspace is likely intended to be in the root folder of the core framework
    workspacePrefix = '';
  }
} catch {
  workspacePrefix = '';
}
let workspaceDir = resolve(process.env.GAF_WORKSPACE_DIR || `${coreDir}/${workspacePrefix}`);

// Add custom 'resolvable' format to convict, where properties will be coerced into absolute file paths
convict.addFormat({
  name: 'resolvable',
  validate: () => {},
  coerce: (val) => {
    return resolve(val);
  },
});

// Add the 'url' validation format to convict
convict.addFormat(require('convict-format-with-validator').url);

const configSchema = {
  // The global configuration properties
  globals: {
    coreDir: {
      doc: 'The path to the root folder of the core framework',
      format: 'resolvable',
      default: `${__dirname}/../../`,
    },
    dotenvPath: {
      doc: 'The path to the loaded dot env file',
      format: 'resolvable',
      default: dotenvPath,
    },
    featuresGlob: {
      doc: 'The glob pattern to the feature files',
      format: String,
      default: `${workspaceDir}/features/**/*.feature`.replace(/\//g, sep),
      env: 'GAF_FEATURES_GLOB',
    },
    outputDir: {
      doc: 'The path to the output folder, where logs and test evidences are generated to',
      format: 'resolvable',
      default: `${workspaceDir}/output`,
      env: 'GAF_OUTPUT_DIR',
    },
    testMarket: {
      doc: 'Selects test data from different markets, uses ISO 3166-1 three letter country codes',
      format: ['temp', 'drc', 'gha', 'lso', 'moz', 'tza'],
      default: 'temp',
      env: 'GAF_TEST_MARKET',
    },
    testEnvironment: {
      doc: 'Selects test data from different testing environments',
      format: ['temp', 'uat', 'oat', 'uat2', 'oat2', 'dryrun', 'uat3', 'oat3'],
      default: 'temp',
      env: 'GAF_TEST_ENVIRONMENT',
    },
    testDataDir: {
      doc: 'The directory containing the test data for different markets and sites',
      format: 'resolvable',
      default: `${workspaceDir}/environments`,
      env: 'GAF_TEST_DATA_DIR',
    },
    workspaceDir: {
      doc: 'The main workspace directory',
      format: 'resolvable',
      default: workspaceDir,
      env: 'GAF_WORKSPACE_DIR',
    },
  },
  // CodeceptJS helpers configuration options
  helpers: {
    // Appium mobile automation related configuration options
    appium: {
      enabled: {
        doc: 'Indicates if Appium helper should be used for mobile automation',
        format: Boolean,
        default: false,
        env: 'GAF_APPIUM',
      },
      config: {
        platform: {
          doc: 'Which mobile OS to use',
          format: ['Android', 'iOS'],
          default: 'Android',
          env: 'GAF_APPIUM_PLATFORM',
        },
        host: {
          doc: 'Appium Server IP',
          default: '0.0.0.0',
          env: 'GAF_APPIUM_SERVER_IP',
        },
        port: {
          doc: 'Appium Server Port',
          default: 4723,
          env: 'GAF_APPIUM_PORT',
        },
        desiredCapabilities: {
          platformVersion: {
            doc: 'Which mobile OS version to use',
            format: String,
            default: '6',
            env: 'GAF_APPIUM_PLATFORM_VERSION',
          },
          udid: {
            doc: 'Which mobile to use',
            format: String,
            default: '',
            env: 'GAF_APPIUM_UDID',
          },
          newCommandTimeout: {
            doc:
              'How long (in seconds) Appium will wait for a new command from the client before ending the session',
            format: String,
            default: '500',
            env: 'GAF_APPIUM_NEW_COMMAND_TIMEOUT',
          },
        },
      },
    },
    // WebDriver UI automation related configuration options
    wd: {
      enabled: {
        doc: 'Indicates if WebDriver helper should be used',
        format: Boolean,
        default: true,
        env: 'GAF_WD',
      },
      headless: {
        doc: 'Run in headless mode, i.e. without a UI or display server dependencies',
        format: Boolean,
        default: false,
        env: 'GAF_WD_HEADLESS',
      },
      config: {
        // The possible list of browser configs could be expanded later,
        // for now it's only Google Chrome and it's related capabilities
        url: {
          doc: 'Base URL of website to be tested',
          format: 'url',
          default: 'http://localhost',
          env: 'GAF_WD_URL',
        },
        browser: {
          doc: 'Browser in which to perform the testing',
          format: ['chrome'],
          default: 'chrome',
          env: 'GAF_WD_BROWSER',
        },
        host: {
          doc: 'WebDriver host to connect',
          format: String,
          default: 'localhost',
          env: 'GAF_WD_HOST',
        },
        port: {
          doc: 'Webdriver port to connect',
          format: 'port',
          default: 4444,
          env: 'GAF_WD_PORT',
        },
        waitForTimeout: {
          doc: 'Sets default wait time in milliseconds for all wait* functions',
          format: 'nat',
          default: 90000,
          env: 'GAF_WD_WAIT_FOR_TIMEOUT',
        },
        restart: {
          doc: 'Restart browser between tests',
          format: Boolean,
          default: true,
          env: 'GAF_WD_RESTART',
        },
        windowSize: {
          doc: "Default window size, set to 'maximize' or a dimension in the format 640x480",
          format: String,
          default: 'maximize',
          env: 'GAF_WD_WINDOW_SIZE',
        },
        uniqueScreenshotNames: {
          doc:
            'Option to prevent screenshot override if you have scenarios with the same name in different suites',
          format: Boolean,
          default: true,
          env: 'GAF_WD_UNIQUE_SCREENSHOT_NAMES',
        },
        // WebDriver's desired capabilities | Note: this might need to be
        // reworked, along with the headless execution option if browsers
        // other than Google Chrome will be used in the future
        desiredCapabilities: {
          // See the possible customisation and configuration options for ChromeDriver below:
          // https://sites.google.com/a/chromium.org/chromedriver/capabilities
          chromeOptions: {
            args: {
              doc: `Command-line arguments to use when starting Chrome,
see the list of available options below for more details:
https://peter.sh/experiments/chromium-command-line-switches/`,
              format: Array,
              default: defaultChromeOptionsArgs,
              env: 'GAF_WD_ARGS',
            },
            // See Chromium source code for possible preferences below:
            // https://chromium.googlesource.com/chromium/src/+/master/chrome/common/pref_names.cc
            prefs: {
              download: {
                default_directory: {
                  doc: 'Specify where to download files by default',
                  format: 'resolvable',
                  default: `${workspaceDir}/output/downloads`,
                  env: 'GAF_WD_DOWNLOAD_DEFAULT_DIR',
                },
              },
            },
          },
        },
      },
    },
  },
  // Logging configuration options
  logging: {
    category: {
      doc: `Avaible log category options, based on the log4js configuration:
default: Print logs to file with custom layout
console: Print logs to console with basic layout
all: Print logs to file (custom layout) and console (basic layout)`,
      format: ['default', 'console', 'all'],
      default: 'default',
      env: 'GAF_LOG_CATEGORY',
    },
    file: {
      doc: 'File name of the log file',
      format: 'resolvable',
      default: `${workspaceDir}/output/gaf.log`,
      env: 'GAF_LOG_FILE',
    },
    level: {
      doc: `Available log level options in descending verbosity order:
TRACE, DEBUG, INFO, WARN, ERROR, FATAL`,
      format: ['TRACE', 'DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL'],
      default: 'INFO',
      env: 'GAF_LOG_LEVEL',
    },
  },
  plugins: {
    // Configuration options for Allure reports
    allure: {
      enabled: {
        doc: 'Indicates if Allure report should be generated for the test execution',
        format: Boolean,
        default: true,
        env: 'GAF_ALLURE',
      },
      append: {
        doc: 'Indicates if Allure report should be appended to previous report',
        format: Boolean,
        default: false,
        env: 'GAF_ALLURE_APPEND',
      },
      reportDir: {
        doc: 'Directory for Allure report, where the HTML report is generated',
        format: 'resolvable',
        default: `${workspaceDir}/output/allure/report`,
        env: 'GAF_ALLURE_REPORT_DIR',
      },
      resultsDir: {
        doc: 'Directory for Allure results, where the XML results are generated',
        format: 'resolvable',
        default: `${workspaceDir}/output/allure/results`,
        env: 'GAF_ALLURE_RESULTS_DIR',
      },
      archiveDir: {
        doc: 'Directory where the historical Allure results are archived',
        format: 'resolvable',
        default: `${workspaceDir}/output/allure/archive`,
        env: 'GAF_ALLURE_ARCHIVE_DIR',
      },
    },
    autoDelay: {
      enabled: {
        doc: 'Indicates if auto delay is applied',
        format: Boolean,
        default: false,
        env: 'GAF_AUTO_DELAY',
      },
    },
    listener: {
      enabled: {
        doc: 'Indicates if the test execution context listener plugin is enabled',
        format: Boolean,
        default: true,
        env: 'GAF_LISTENER',
      },
    },
    loader: {
      enabled: {
        doc: 'Indicates if the test data loader plugin is enabled',
        format: Boolean,
        default: true,
        env: 'GAF_LOADER',
      },
    },
    pauseOnFail: {
      enabled: {
        doc: 'Indicates if interactive pause should automatically launched when a test fails',
        format: Boolean,
        default: false,
        env: 'GAF_PAUSE_ON_FAIL',
      },
    },
    retryFailedStep: {
      enabled: {
        doc: 'Indicates if each failed step in a test should be retried',
        format: Boolean,
        default: true,
        env: 'GAF_RETRY_FAILED_STEP',
      },
    },
    screenshotOnFail: {
      enabled: {
        doc: 'Indicates if screenshot should be created on test failure',
        format: Boolean,
        default: true,
        env: 'GAF_SCREENSHOT_ON_FAIL',
      },
    },
  },
  // Other utility configurations
  utils: {
    email: {
      enabled: {
        doc: 'Indicates if the email utility is enabled for the execution',
        format: Boolean,
        default: false,
        env: 'GAF_UTILS_EMAIL',
      },
      host: {
        doc: 'The email provider (IMAP) host name',
        format: String,
        default: 'imap.gmail.com',
        env: 'GAF_UTILS_EMAIL_HOST',
      },
      password: {
        doc: 'The email account password',
        format: String,
        default: '',
        env: 'GAF_UTILS_EMAIL_PASSWORD',
      },
      port: {
        doc: 'The email provider (IMAP) port',
        format: 'port',
        default: 993,
        env: 'GAF_UTILS_EMAIL_PORT',
      },
      user: {
        doc: 'The email account username',
        format: String,
        default: '',
        env: 'GAF_UTILS_EMAIL_USER',
      },
    },
  },
  // Transport Layer Security related configuration options, e.g. for REST module client side authentication
  rest: {
    recordTransactions: {
      enabled: {
        doc: 'Indicates if REST transaction details should be recorded to a CSV file',
        format: Boolean,
        default: false,
        env: 'GAF_REST_RECORD_TRANSACTIONS',
      },
    },
    tls: {
      clientCertPub: {
        doc: 'File path to the public client certificate',
        format: 'resolvable',
        default: `${coreDir}/tls/openapi.slrtechnology.com.cer`,
        env: 'GAF_REST_TLS_CLIENT_CERT_PUB',
      },
      clientCertPriv: {
        doc: 'File path to the private key of the client certificate',
        format: 'resolvable',
        default: `${workspaceDir}/tls/openapi.slrtechnology.com.pem`,
        env: 'GAF_REST_TLS_CLIENT_CERT_PRIV',
      },
      maEnabled: {
        doc: 'Indicates if mutual authentication should be used',
        format: Boolean,
        default: false,
        env: 'GAF_REST_TLS_MA',
      },
    },
  },
};

// Parse config based on the schema above
let config = convict(configSchema);

// If enabled, add headless flag to the existing Chrome options
let headless = config.getProperties().helpers.wd.headless;
let chromeOptions = config.getProperties().helpers.wd.config.desiredCapabilities.chromeOptions;
if (headless && !_.includes(chromeOptions.args, '--headless')) {
  config.set('helpers.wd.config.desiredCapabilities.chromeOptions.args', [
    '--headless',
    ...chromeOptions.args,
  ]);
}

// Any properties specified in config files that are not declared in the schema will throw errors
config.validate({ allowed: 'strict' });

module.exports = {
  args: config.getArgs(),
  config: config.getProperties(),
  schema: config.getSchema(),
};
