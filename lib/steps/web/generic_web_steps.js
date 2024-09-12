const { ButtonLink, CommonUtils, Dropdown, I, Textbox, Assert, TestData, G2Handlers } = inject();
const randomstring = require('randomstring');

/* eslint-disable no-undef */

When(/^Verify text "([^"]*)" available$/, async (locator) => {
  await Assert.verifyText(locator);
});

Then(/^I Verify element "([^"]*)" not available$/, async (locator) => {
  await Assert.verifyTextNotPresent(locator);
});

Then(/^I click on "([^"]*)" with value "([^"]*)"$/, async (locator, customLocator) => {
  await ButtonLink.clickOnElement(locator, customLocator);
});

Then(/^I Switch tab$/, async () => {
  await I.switchToNextTab();
});

Then(/^I close the current tab$/, async () => {
  await I.closeCurrentTab();
});

Then(/^I enter text "([^"]*)" with value "([^"]*)"$/, async (locator, value) => {
  await Textbox.enterValue(locator, value.toString());
});

Then(/^I scroll "([^"]*)" to view using "([^"]*)" parameter$/, async (locator, parameter) => {
  await I.scrollIntoView(CommonUtils.identifyLocator(locator), parameter);
  I.report('Scrolled to ' + locator);
});

Then(/^I scroll page to bottom$/, async () => {
  await I.scrollPageToBottom();
  I.report('Scrolled to bottom of page');
});

Then(/^I scroll page to top$/, async () => {
  await I.scrollPageToTop();
  I.report('Scrolled to top of the page');
});

Then(/^I pause$/, async () => {
  await I.pause();
});

Then(/^I select drop down "([^"]*)" with "([^"]*)"$/, async (locator, optionValue) => {
  await Dropdown.selectItemByName(locator, optionValue);
  I.report('Selected option ' + optionValue + ' for dropdown ' + locator);
});

Then(/^I wait "([^"]*)"$/, async (timeInterval) => {
  await I.wait(timeInterval);
  I.report('I wait for ' + timeInterval + ' seconds');
});

Then(/^I click on "([^"]*)"$/, async (locator) => {
  await ButtonLink.clickOnElement(locator);
});

Then(/^Validate the below values available in "([^"]*)"$/, async (locator, table) => {
  let expectedData = table.parse().rawData[1];
  await CommonUtils.compareFieldValuesWithList(locator, expectedData);
  I.report('Validated that values ' + expectedData + ' is present in list ' + locator);
});

Then(/^I click on check box "([^"]*)" with text "([^"]*)"$/, async (locator, text) => {
  await CheckBox.clickOnElement(locator, text);
});

Given(/^I generate name "([^"]*)" with value "([^"]*)"$/, async (outVar, randNum) => {
  await CommonUtils.generateRandomNumbers(outVar, randNum);
  I.report('Generated random number ' + TestData.getField(outVar) + ' and stored it in ' + outVar);
});

Then(/^I check value of "([^"]*)" is "([^"]*)"$/, async (value1, value2) => {
  value1 = CommonUtils.identifyData(value1);
  value2 = CommonUtils.identifyData(value2);
  await Assert.verifyIfTwoStringsAreEqual(value1, value2);
  I.report('Verified two strings ' + value1 + ' and ' + value2 + ' are equal');
});

Then(/^I record SystemDateTime and store in "([^"]*)"$/, async (strDate) => {
  await CommonUtils.getDateInFormat(strDate);
  I.report('Recorded current date and time ' + strDate);
});

Then(/^I check value of "([^"]*)" is not equal to "([^"]*)"$/, async (value1, value2) => {
  value1 = CommonUtils.identifyData(value1);
  value2 = CommonUtils.identifyData(value2);
  await Assert.compareTwoStringsNotEqual(value1, value2);
  I.report('Verified ' + value1 + ' is not equal to ' + value2);
});

Then(/^I report "([^"]*)"$/, async (message) => {
  await I.report(message);
});

Then(
  /^concatenate strings "([^"]*)" with "([^"]*)" and store in "([^"]*)"$/,
  async (value1, value2, strVariable) => {
    value1 = CommonUtils.identifyData(value1);
    value2 = CommonUtils.identifyData(value2);
    TestData.setField(strVariable, value1 + value2);
  },
);

Then(/^I press key "([^"]*)"$/, async (key) => {
  I.pressKey(key);
  I.wait(2);
});

Given(
  /^I generate random string "([^"]*)" with value "([^"]*)"$/,
  async (stringValue, stringLength) => {
    let len, str, s;
    if (stringLength.includes('_')) {
      len = stringLength.split('_')[1];
      str = stringLength.split('_')[0];
      s = randomstring.generate({ length: len, charset: 'alphabetic' });
      s = str + s;
    } else {
      s = randomstring.generate({ length: stringLength, charset: 'alphabetic' });
    }
    TestData.setField(stringValue, s);
  },
);

Then(/^I check transaction value of "([^"]*)" is "([^"]*)"$/, async (value1, value2) => {
  value1 = CommonUtils.identifyData(value1);
  value1 = value1.replace('-', '');
  value2 = CommonUtils.identifyData(value2);
  await Assert.verifyIfTwoStringsAreEqual(value1, value2);
  I.report('Verified two strings ' + value1 + ' and ' + value2 + ' are equal');
});

Then(/^I select the customer "([^"]*)"$/, async (value) => {
  await ButtonLink.clickOnElement('GenericLocators.InitiatorType');
  await ButtonLink.clickOnElement('GenericLocators.OptionCustomerInDropDown');
  await ButtonLink.clickOnElement('GenericLocators.ThreeDotsInCustomer');
  await G2Handlers.enterValue('GenericLocators.CustomerTextBox', value.toString());
  await ButtonLink.clickOnElement('GenericLocators.SearchButtonInDialogWindow');
  await ButtonLink.clickOnElement('GenericLocators.CustomerEntry');
  await G2Handlers.clickOnElement('Confirm', 'buttonCite');
});

Then(/^I click on a button "([^"]*)"$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'buttonLeftMenu');
});

Then(/^I click on menu "([^"]*)"$/, async (menu) => {
  await G2Handlers.clickOnElement(menu, 'buttonInSpan1');
  I.report('Clicked on menu ' + menu);
});
