const appiumController = require('appium-controller');
const event = require('codeceptjs').event;
const Helper = require('@codeceptjs/helper');

const { globals } = require('../configs/core.js').config;

module.exports = function () {
  event.dispatcher.on(event.test.before, function () {
    if (typeof Helper.prototype.helpers['Appium'] !== 'undefined') {
      appiumController.startAppium({
        logDir: globals.outputDir,
        port: '4723',
        shutdown: false,
      });
    }
    // event.dispatcher.on(event.suite.after, function () {
    //   appiumController.stopAppium();
    // });
  });
};
