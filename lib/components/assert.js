const { CommonUtils, I } = inject();

const { Handlers } = require('./handlers.js');
var { assert } = require('chai');
class Assert extends Handlers {
  /**
   * to enter value in textbox
   *
   * @param {object} locator
   */
  async verifyText(locator) {
    await I.see(CommonUtils.identifyLocator(locator));
  }

  async verifyTextNotPresent(locator) {
    await I.dontSee(CommonUtils.identifyLocator(locator));
  }

  async verifyIfTwoStringsAreEqual(value1, value2) {
    await assert.equal(value1, value2);
    await I.report('Verified that ' + value1 + ' and ' + value2 + ' are equal');
  }

  async compareTwoStringsNotEqual(value1, value2) {
    await assert.notEqual(value1, value2);
    await I.report('Verified text ' + value1 + ' and ' + value2 + ' are not equal');
  }

  async verifyIfTwoStringsAreNotEqual(value1, value2) {
    await assert.notContainIgnoreCase(value1, value2);
    await I.report('Verified ' + value1 + ' does not contain ' + value2);
  }

  async verifyIfStringContains(value1, value2) {
    await assert.containIgnoreCase(value1, value2);
    await I.report('Verified ' + value1 + ' does contain ' + value2);
  }

  async fail(text) {
    await assert.fail(text);
  }
}

module.exports = new Assert();
module.exports.Assert = Assert;
