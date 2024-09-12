/**
 * Collection of utility classes to be registered in the
 * CodeceptJS dependency injection container and included
 * in tests via the codecept.conf.js configuration file
 */
module.exports = {
  CommonUtils: './lib/utils/common.js',
  Csv: './lib/utils/csv.js',
  Email: './lib/utils/email.js',
  LoggerFactory: './lib/utils/logging.js',
};
