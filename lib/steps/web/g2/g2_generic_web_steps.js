/* eslint-disable no-undef */

let {
  I,
  CommonUtils,
  G2Handlers,
  TestData,
  IFrame,
  GenericMethods,
  Assert,
  AdminPage,
  LoginPage,
  SearchPage,
  LoggerFactory,
  CreateTopOrgPage,
} = inject();
const logger = LoggerFactory.init();

Then(/^I enter text for "([^"]*)" with value "([^"]*)"$/, async (locator, value) => {
  await G2Handlers.enterValue(locator, value.toString());
  I.report('Entered text ' + value + ' for ' + locator);
});

Then(/^I click on a "([^"]*)"$/, async (locator) => {
  if (typeof TestData.getLocator(locator) !== 'undefined') {
    await G2Handlers.clickOnElement(locator);
  } else {
    await G2Handlers.clickOnElement(locator, 'buttonInDiv');
  }
  I.report('Clicked on ' + locator);
});

Then(/^I get value of "([^"]*)" and store in "([^"]*)"$/, async (locator, outVar) => {
  if (typeof TestData.getLocator(locator) !== 'undefined') {
    locator = CommonUtils.identifyLocator(locator);
  }
  let value = await I.grabTextFrom(locator);
  TestData.setField(outVar, value);
  I.report('Stored value ' + value + ' of ' + locator + 'in ' + outVar);
});

Then(/^I enter text in "([^"]*)" with value "([^"]*)"$/, async (locator, value) => {
  await G2Handlers.enterValue(locator, value.toString(), 'textboxUsingLabel');
  I.report('Entered text for ' + locator + ' with value ' + value);
});

Then(/^I enter text area "([^"]*)" with value "([^"]*)"$/, async (locator, value) => {
  await G2Handlers.enterTextAreaValue(locator, value.toString(), 'customTextAreaLocator');
  I.report('Entered text area ' + locator + ' with value ' + value);
});

Then(/^I select drop down "([^"]*)" with option "([^"]*)"$/, async (dropdown, value) => {
  await G2Handlers.selectOption(dropdown, value, 'customDropdownLocator');
  I.report('Selected dropdown ' + dropdown + ' with value ' + value);
});

Then(/^I click on Edit for "([^"]*)"$/, async (locator) => {
  await IFrame.switchToLastFrame();
  await G2Handlers.clickOnElement(locator);
  await IFrame.switchToPopUpWindow();
  I.report('Clicked on Edit for ' + locator);
});

Then(/^I switch to next frame$/, async () => {
  await G2Handlers.waitForPageLoad();
  I.wait(4);
  await IFrame.switchToLastFrame();
  await IFrame.switchToNextFrame();
  I.report('Switched to next frame');
});

Then(/^I use screen name "([^"]*)" to click on "([^"]*)"$/, async (screenName, button) => {
  const locator = CommonUtils.identifyData(screenName + '.' + button);
  await G2Handlers.clickOnElement(locator);
  I.report('Clicked on ' + button + ' in screen ' + screenName);
});

Then(
  /^I use screen name "([^"]*)" to select drop down "([^"]*)" with option "([^"]*)"$/,
  async (screenName, dropdown, option) => {
    const locator = TestData.getLocator(screenName + '.' + dropdown);
    await G2Handlers.selectOption(locator, option);
    I.report(
      'Selected dropdown ' + dropdown + ' with value ' + option + ' in ' + screenName + ' page',
    );
  },
);

Then(/^I switch to parent window$/, async () => {
  await IFrame.switchToMainPage();
  await IFrame.switchToCurrentWindowHandle();
  I.report('Switched to parent window');
});

When(
  /^MakerChecker is on "([^"]*)" task from group task for "([^"]*)"$/,
  async (approveOrReject, tableData) => {
    if (typeof CommonUtils.identifyData(tableData) !== 'undefined') {
      tableData = CommonUtils.identifyData(tableData);
    }
    await GenericMethods.approveOrRejectGroupTask(approveOrReject, tableData);
    I.report(approveOrReject + 'd task ' + tableData + ' from group task');
  },
);

Then(/^I get the value of user "([^"]*)" store in "([^"]*)"$/, async (locator, variable) => {
  let value = await CommonUtils.identifyData(locator);
  await TestData.setField(variable, value);
  I.report('Stored value of user ' + locator + ' in variable');
});

When(/^I search for "([^"]*)" with below details$/, async (menuItem, table) => {
  let tObj = table.parse().hashes()[0];
  TestData.setField('menuItem', menuItem);
  await GenericMethods.navigateToInfoPageAfterSearch(menuItem, tObj);
  I.report(
    'Successfully navigated to ' + menuItem + ' page after search with following details ' + tObj,
  );
});

When(/^I close "([^"]*)" with below details$/, async (menuItem, table) => {
  let tObj = table.parse().hashes()[0];
  TestData.setField('menuItem', menuItem);
  await GenericMethods.closeTheOrg(menuItem, tObj);
  I.report(
    'Successfully navigated to ' + menuItem + ' page after search with following details ' + tObj,
  );
});

Then(/^I edit Identity Status in "([^"]*)" with value "([^"]*)"$/, async (detail, status) => {
  await GenericMethods.editIdentityStatus(detail, status);
  I.report('Edited Identity Status in ' + detail + ' with value ' + status);
});

Then(/^I edit Identity Status of customer with value "([^"]*)"$/, async (status) => {
  await GenericMethods.editcusIdentityStatus(status);
  I.report('Edited Identity Status with value ' + status);
});

Then(
  /^I change the Account status to "([^"]*)" of the Account "([^"]*)"$/,
  async (status, account) => {
    await GenericMethods.changeAccountstatusTable(status, account);
  },
);

Then(/^I edit Device MSISDN with value "([^"]*)"$/, async (msisdn) => {
  await GenericMethods.editMsisdnStatus(msisdn);
  I.report('Edited Device MSISDN with value ' + msisdn);
});

Then(/^I edit Identity Status of Till in Org Portal with value "([^"]*)"$/, async (status) => {
  await GenericMethods.orgeditIdentityStatus(status);
  I.report('Edited Identity Status with value ' + status);
});

Then(/^I initiate transaction with below details$/, async (table) => {
  let tObj = table.parse().hashes()[0];
  await GenericMethods.initiateTransaction(tObj);
});

Then(/^I click on "([^"]*)" button in popup window$/, async (button) => {
  await IFrame.switchToCurrentWindowHandle();
  await G2Handlers.verifyText(button);
  await G2Handlers.clickOnElement(button, 'buttonInPopup');
  await IFrame.switchToMainPage();
  await IFrame.switchToLastFrame();
  await IFrame.switchToNextFrame();
  I.report('Clicked on ' + button + ' button in pop-up window');
});

Then(/^I switch to previousTab$/, async () => {
  await I.switchToPreviousTab();
});

Then(/^I switch to current window$/, async () => {
  await IFrame.switchToCurrentWindowHandle();
  await IFrame.switchToMainPage();
  await IFrame.switchToLastFrame();
  await IFrame.switchToNextFrame();
  I.report('Switched to current window (next frame)');
});

Then(/^I switch to next window$/, async () => {
  await handlers.waitForPageLoad();
  const window = await I.grabCurrentWindowHandle();
  await I.switchToWindow(window);
});

Then(/^I switch to left hand menu$/, async () => {
  await IFrame.switchToMainPage();
  await IFrame.switchToCurrentWindowHandle();
  await IFrame.switchToLastFrame();
  I.report('Switched to left hand menu (last frame)');
});

Then(/^I click on Generic "([^"]*)"$/, async (btnName) => {
  await GenericMethods.clickOnAllButton(btnName);
  I.report('Clicked on all buttons for ' + btnName);
});

When(/^I verify customer from Take a Call$/, async (table) => {
  let tObj = table.parse().hashes()[0];
  TestData.setField('menuItem', 'Customer');
  await GenericMethods.verifyTakeACall(tObj);
  I.report('Verified customer from take a call with details ' + tObj);
});

Then(
  /^I check both values "([^"]*)" is "([^"]*)" the value of "([^"]*)"$/,
  async (value1, symbol, value2) => {
    await G2Handlers.checkLessThan(value1, symbol, value2);
    I.report('Verified ' + value1 + ' is ' + symbol + ' ' + value2);
  },
);

Then(/^I switch to pop up window$/, async () => {
  await IFrame.switchToPopUpWindow();
  I.report('Switched to pop up window');
});

Then(/^I get value from label "([^"]*)" and store it in "([^"]*)"$/, async (label, outVar) => {
  await G2Handlers.getValueFromLabel(label, outVar);
  I.report('Stored value of ' + label + ' in ' + outVar);
});

Then(/^I get value from label in "([^"]*)" and store it in "([^"]*)"$/, async (label, outVar) => {
  await G2Handlers.getValueFromLabelIn(label, outVar);
  I.report('Stored value of ' + label + ' in ' + outVar);
});

Then(/^I edit KYC Info with below details$/, async (table) => {
  let tObj = table.parse().hashes()[0];
  await GenericMethods.editKYCInfo(tObj);
  I.report('Edited KYC Info with following details ' + tObj);
});

Then(/^I edit org KYC Info with below details$/, async (table) => {
  let tObj = table.parse().hashes()[0];
  await GenericMethods.editorgKYCInfo(tObj);
  I.report('Edited KYC Info with following details ' + tObj);
});

Then(/^I click on "([^"]*)" tab$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'buttonInLabel');
  I.report('Clicked on ' + locator + ' tab');
});

Then(/^I click on button "([^"]*)"$/, async (locator) => {
  await G2Handlers.clickOnElement(locator);
  I.report('Clicked on ' + locator + 'button');
});

Then(/^I click on "([^"]*)" link$/, async (locator) => {
  locator = await CommonUtils.identifyData(locator);
  await G2Handlers.clickOnElement(locator, 'buttonInLink');
  I.report('Clicked on ' + locator + ' link');
});

Then(
  /^I get modified time of event time "([^"]*)" add "([^"]*)" by "([^"]*)" in "([^"]*)"$/,
  async (strDate, modificationType, value, strModifiedDate) => {
    await CommonUtils.getModifiedDate(strDate, modificationType, value, strModifiedDate);
    I.report(
      'Added ' +
        value +
        ' ' +
        modificationType +
        ' to ' +
        strDate +
        ' and stored in ' +
        strModifiedDate,
    );
  },
);

Then(/^I verify if records exist in the table "([^"]*)"$/, async (tableId) => {
  let count = await GenericMethods.getTotalRecords(tableId);
  if (count > 0) {
    I.report('Verified record exists in table ' + tableId);
  } else {
    I.fail('Record not found!');
  }
});

Then(/^I check value of "([^"]*)" is not "([^"]*)"$/, async (value1, value2) => {
  value1 = TestData.getField(value1);
  await Assert.verifyIfTwoStringsAreNotEqual(value1, value2);
  I.report('Verified ' + value1 + ' is not equal to ' + value2);
});

Then(/^I click on "([^"]*)" radio$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'buttonRadio');
  I.report('Clicked on ' + locator + ' radio');
});

Then(/^I click on "([^"]*)" button in cite$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'buttonCite');
  I.report('Clicked on ' + locator + ' button');
});

Then(/^I click on "([^"]*)" button in Notification Type Window$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'buttonCiteInNotification');
  I.report('Clicked on ' + locator + ' button');
});

Then(/^I create trustbank$/, async () => {
  await AdminPage.createtrustbank();
});

When(/^I verify organization operator from Take a Call$/, async (table) => {
  const tObj = table.parse().hashes()[0];
  TestData.setField('menuItem', 'Operator');
  await GenericMethods.verifyTakeACallForOrganization(tObj);
  I.report('Verified organization operator from take a call with details ' + tObj);
});

When(/^static text "([^"]*)" is visible$/, async (locator) => {
  await G2Handlers.verifyText(locator);
  I.report('Verified static text ' + locator + ' is visible');
});

When(/^static text "([^"]*)" is not visible$/, async (locator) => {
  await G2Handlers.verifyTextNotPresent(locator);
  I.report('Verified static text ' + locator + ' is not visible');
});

Then(
  /^I check After Transaction value "([^"]*)" is Credited from Before Transaction value "([^"]*)" with an amount "([^"]*)"$/,
  async (value1, value2, strAmount) => {
    await G2Handlers.checkValueisGreaterThan(value1, value2, strAmount);
  },
);

Then(
  /^I check After Transaction value "([^"]*)" is Debited from Before Transaction value "([^"]*)" with an amount "([^"]*)"$/,
  async (value1, value2, strAmount) => {
    await G2Handlers.checkValueisLessThan(value1, value2, strAmount);
  },
);

Then(
  /^I check search results displayed is "([^"]*)" on table "([^"]*)"$/,
  async (text, tableId) => {
    let count = await GenericMethods.getTotalRecords(tableId);
    if (text === 'NO' && count === 0) {
      I.report('No records Found');
    } else if (text === 'YES' && count > 0) {
      I.report('Records Found');
    } else {
      I.fail('validation failed : ' + count);
    }
  },
);

Then(/^I check file is downloaded in "([^"]*)" format$/, async (format) => {
  await GenericMethods.downloadFile(format);
});

Then(
  /^I join two values "([^"]*)" and "([^"]*)" with separator "([^"]*)" store in "([^"]*)"$/,
  async (value1, value2, separator, variable) => {
    value1 = CommonUtils.identifyData(value1);
    value2 = CommonUtils.identifyData(value2);
    let value = await GenericMethods.formStringAndStoreInAVariable(value1, value2, separator);
    await TestData.setField(variable, value);
    logger.debug('The string formed is ' + value);
  },
);

Then(/^I switch to browser context$/, async () => {
  await I.switchHelper('WebDriver');
});

Then(
  /^I get receipt no. from description "([^"]*)" and store it in "([^"]*)"$/,
  async (strdesc, strReceipt) => {
    strdesc = CommonUtils.identifyData(strdesc);
    let receiptNo = strdesc.split("'")[1].toString();
    logger.info('Receipt number from description: ' + receiptNo);
    TestData.setField(strReceipt, receiptNo);
  },
);

Then(/^I verify text if task need to be approved by another operator inside pop-up$/, async () => {
  await IFrame.switchToCurrentWindowHandle();
  await GenericMethods.makerChecker();
  I.report('Group Task Approval is ' + TestData.getField('makerchecker'));
});

Then(/^I verify text if task need to be approved by another operator$/, async () => {
  await IFrame.switchToCurrentWindowHandle();
  await IFrame.switchToMainPage();
  await IFrame.switchToLastFrame();
  await IFrame.switchToNextFrame();
  await GenericMethods.makerChecker();
  I.report('Group Task Approval is ' + TestData.getField('makerchecker'));
});

Then(/^I select the file to upload from "([^"]*)"$/, async (filepath) => {
  await GenericMethods.fileUpload(filepath);
});

Then(
  /^check if locator "([^"]*)" having locator value "([^"]*)" and text "([^"]*)" exists and store value in "([^"]*)"$/,
  async (locator, locatorValue, strText, strVariable) => {
    await GenericMethods.findElementWithTagAndValue(locator, locatorValue, strText, strVariable);
  },
);

Given(
  /^I create "([^"]*)" sp operators from testdata creation data file$/,
  async (operatorName) => {
    await AdminPage.createSpOpsForTestDataCreation(operatorName);
  },
);

Given(/^I navigate to Mpesa "([^"]*)" portal$/, async (url) => {
  await LoginPage.navigateToPortal(url);
});

Then(/^I reset password "([^"]*)" for "([^"]*)"$/, async (password, user) => {
  await AdminPage.resetOperator(user, password);
});

Given(/^I create "([^"]*)" org operators from testdata creation data file$/, async (admin) => {
  await AdminPage.createOrgOpsForTestDataCreation(admin);
});

Given(/^I get data from email with subject "([^"]*)"$/, async (subject) => {
  let { oldPassword, initialPin } = await GenericMethods.getDataFromEmail(subject);
  return { oldPassword, initialPin };
});

Given(
  /^I top up or fund "([^"]*)" receiver type of "([^"]*)" s from testdata creation data file$/,
  async (receiverType, shortCode) => {
    await GenericMethods.topupIdentities(receiverType, shortCode);
  },
);

Given(/^I create "([^"]*)" till from testdata creation data file$/, async (till) => {
  await AdminPage.createTillForTestDataCreation(till);
});

Given(/^I Change the Notification Channel of "([^"]*)"$/, async (operatorName) => {
  await AdminPage.changeNotificationChannel(operatorName);
});

Given(
  /^I Recycle msisdn from testdata creation data file using "([^"]*)" operator$/,
  async (admin) => {
    await AdminPage.recycleMSISDN(admin);
  },
);

Given(/^I Create the "([^"]*)" customer from testdata creation data file$/, async (custRef) => {
  await AdminPage.createCustomersUsingTestdataCreationFile(custRef);
});

When(/^I activate "([^"]*)" customer from "([^"]*)"$/, async (custMSISDN, key) => {
  await SearchPage.searchCustomerAndResetPIN(custMSISDN, key);
});

When(/^I create bulk plan with below details$/, async (table) => {
  const tObj = table.parse().hashes()[0];
  await GenericMethods.createBulkPlan(tObj);
  I.report('Verified bulk plan is created ' + tObj);
});

Then(/^I note the verification counter$/, async () => {
  let initialCounter = await G2Handlers.grabNumberOfVisibleElements(
    'GenericLocators.TakeACallTableValueLocator',
  );
  TestData.setField('counterVal', initialCounter);
});

Then(/^I check that verification counter is raised by one$/, async () => {
  await GenericMethods.verifyTakeACallCounterIncreasesByOne();
});

Then(/^I check error text "([^"]*)" is displayed$/, async (text) => {
  let pageSource = await I.grabSource();
  await Assert.verifyIfStringContains(pageSource, CommonUtils.identifyData(text));
});

Then(/^I enter text "([^"]*)" for "([^"]*)" in table "([^"]*)"$/, async (text, label, tableId) => {
  await CreateTopOrgPage.enterValueOnTable(label, text, tableId);
});

Then(/^verify notification text "([^"]*)" is visible$/, async (text) => {
  text = text.replace(/ /g, '&#x20;');
  locator = CommonUtils.identifyLocator('GenericLocators.NotificationText').replace(
    'REPLACE_TEXT',
    text,
  );
  await I.seeElement(locator);
  I.report('Verified notification text with locator ' + locator + ' is visible');
});

Then(/^I create bank account with below details$/, async (table) => {
  const tObj = table.parse().hashes()[0];
  await GenericMethods.createBankAccount(tObj);
  I.report('Bank account is created ' + tObj);
});

Then(/^I edit Account Status for "([^"]*)" with value "([^"]*)"$/, async (tableValues, status) => {
  await GenericMethods.editIdentityStatusOfAccount(tableValues, status);
  I.report('Edited Account Status for ' + tableValues + 'with value ' + status);
});

Then(
  /^I add or subtract the limit "([^"]*)" with an value "([^"]*)" and store it in "([^"]*)"$/,
  async (valueOfLimit, value, newValueOfLimit) => {
    await GenericMethods.manipulatingValues(valueOfLimit, value, newValueOfLimit);
  },
);

Then(
  /^I get the exact balance from "([^"]*)" and store it in "([^"]*)"$/,
  async (storedBalance, value) => {
    await GenericMethods.getTheBalance(storedBalance, value);
  },
);

Then(
  /^I select "([^"]*)" of "([^"]*)" column from table "([^"]*)"$/,
  async (roleOrProduct, columnName, table) => {
    await CreateTopOrgPage.selectProduct(roleOrProduct, columnName, table);
  },
);

Then(/^I enter text area for "([^"]*)" with value "([^"]*)"$/, async (locator, value) => {
  await G2Handlers.enterTextAreaValue(locator, value.toString());
  I.report('Entered text area ' + locator + ' with value ' + value);
});

Then(/^I check page opened or not and verify "([^"]*)" text on new tab$/, async () => {
  await GenericMethods.switchToTab();
});

Then(
  /^I Get Value from table "([^"]*)" with Row Number "([^"]*)" and Column Number "([^"]*)" and store in "([^"]*)"$/,
  async (tableID, rowNum, columnNum, outputVar) => {
    await GenericMethods.getValueFromTableBasedonRowAndColumn(
      tableID,
      rowNum,
      columnNum,
      outputVar,
    );
    I.report('Fetched Value from table based on row and column number');
  },
);

Then(
  /^I verify if values "([^"]*)" and "([^"]*)" are sorted in ascending order$/,
  async (firstVal, secondVal) => {
    await GenericMethods.verifyValuesAreSortedInAscendingOrder(firstVal, secondVal);
    I.report('Values ' + firstVal + ' and ' + secondVal + ' are sorted in ascending order');
  },
);

Then(
  /^I verify if values "([^"]*)" and "([^"]*)" are sorted in descending order$/,
  async (firstVal, secondVal) => {
    await GenericMethods.verifyValuesAreSortedInDescendingOrder(firstVal, secondVal);
    I.report('Values ' + firstVal + ' and ' + secondVal + ' are sorted in descending order');
  },
);

Then(
  /^I click on "([^"]*)" on table "([^"]*)" to sort by "([^"]*)" order$/,
  async (sortBy, tableID, sortOrder) => {
    await GenericMethods.clickOnSortForTable(sortBy, tableID, sortOrder);
    I.report('Sorted ' + sortBy + ' values in table ' + tableID);
  },
);

Then(
  /^I get value of "([^"]*)" from Linked Transaction details and store in "([^"]*)"$/,
  async (label, outVar) => {
    if (label.includes('Receipt No.'))
      locator = CommonUtils.identifyLocator('GenericLocators.LinkedTransactionDetailsReceiptNo');
    else
      locator = CommonUtils.identifyLocator(
        'GenericLocators.LinkedTransactionDetailsWithLabel',
      ).replace('REPLACE_LOCATOR', label);
    let value = await I.grabTextFrom(locator);
    TestData.setField(outVar, value);
    I.report('Stored value ' + value + ' of ' + locator + 'in ' + outVar);
  },
);

Then(/^I Display "([^"]*)" with "([^"]*)"$/, async (text, variableText) => {
  if (typeof TestData.getData(variableText) !== 'undefined')
    variableText = TestData.getData(variableText);
  else variableText = TestData.getField(variableText);
  I.report(text + ' ' + variableText);
});

Then(/^I edit Product Status for "([^"]*)" with value "([^"]*)"$/, async (tableValues, status) => {
  await GenericMethods.editStatusOfProduct('Table.ProductTab', tableValues, status);
  I.report('Edited Product Status for ' + tableValues + 'with value ' + status);
});

Then(
  /^I enter the child "([^"]*)" value in the "([^"]*)" text box and click the result displayed$/,
  async (shortcodeValue, locatorValue) => {
    await GenericMethods.clickOnTheChildOrgFromTheList(shortcodeValue, locatorValue);
    I.report(
      'Entered the child value ' +
        CommonUtils.identifyData(shortcodeValue) +
        ' and clicked the displayed result',
    );
  },
);

When(/^static text "([^"]*)" is visible on the page$/, async (textString) => {
  let result = GenericMethods.verifyTheTextInTheKycPopUp(textString);
  if (result != -1) {
    I.report('Verified static text ' + textString + ' is visible');
  } else {
    I.report('Verified static text ' + textString + ' is not visible');
  }
});

Then(/^I check whether edit identity status option is available or not$/, async () => {
  GenericMethods.checkIfEditIdentityStatusButtonAvailable();
  I.report('Edit Identity Status option is available or not is been checked');
});

Then(/^I switch to error pop up window$/, async () => {
  await IFrame.switchToErrorPopUpWindow();
  I.report('Switched to pop up window');
});

Then(/^I check whether the static text "([^"]*)" is visible on big headings$/, async (text) => {
  GenericMethods.checkingTheGivenTextInBigHeadings(text);
});

Then(
  /^I verify text "([^"]*)" and click on "([^"]*)" button in popup window$/,
  async (text, button) => {
    await IFrame.switchToCurrentWindowHandle();
    await G2Handlers.verifyText(text);
    await G2Handlers.verifyText(button);
    await G2Handlers.clickOnElement(button, 'buttonInPopup');
    await IFrame.switchToMainPage();
    await IFrame.switchToLastFrame();
    await IFrame.switchToNextFrame();
    I.report('Clicked on ' + button + ' button in pop-up window');
  },
);

Then(/^I create "([^"]*)" with below details$/, async (menuItem, table) => {
  let tObj = table.parse().hashes()[0];
  TestData.setField('menuItem', menuItem);
  await GenericMethods.navigateToTillPageForCreation(menuItem, tObj);
  I.report('Successfully create the ' + menuItem + ' with following details ' + tObj);
});

Then(
  /^I enter text in "([^"]*)" with value "([^"]*)" in the popup dialog window$/,
  async (locator, value) => {
    await G2Handlers.enterValue(locator, value.toString(), 'textboxUsingLabelInDialogWindow');
    I.report('Entered text for ' + locator + ' with value ' + value);
  },
);

Then(
  /^I enter text in "([^"]*)" with value "([^"]*)" in the popup dialog window$/,
  async (locator, value) => {
    await G2Handlers.enterValue(locator, value.toString(), 'textboxUsingLabelInDialogWindow');
    I.report('Entered text for ' + locator + ' with value ' + value);
  },
);

Then(
  /^I enter text area "([^"]*)" with value "([^"]*)" in the popup dialog window$/,
  async (locator, value) => {
    await G2Handlers.enterTextAreaValue(
      locator,
      value.toString(),
      'customTextAreaLocatorInDialogWindow',
    );
    I.report('Entered text area ' + locator + ' with value ' + value);
  },
);

Then(/^I click on the "([^"]*)" toggle switch$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'toggleSwitchInDiv');
  I.report('Clicked on ' + locator + ' toggle switch');
});

Then(/^I click on the "([^"]*)" tab$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'tabsInDiv');
  I.report('Clicked on ' + locator + ' tab');
});

Then(
  /^I enter text area "([^"]*)" with value "([^"]*)" in the popup dialog window$/,
  async (locator, value) => {
    await G2Handlers.enterTextAreaValue(
      locator,
      value.toString(),
      'customTextAreaLocatorInDialogWindow',
    );
    I.report('Entered text area ' + locator + ' with value ' + value);
  },
);

Then(
  /^I select the project "([^"]*)" in the "([^"]*)" dropdown button$/,
  async (value, locator) => {
    await G2Handlers.clickOnElement(locator, 'buttonInDropDown');
    I.report('Clicked on ' + locator + 'drop down');
    await G2Handlers.enterValue(locator, value.toString(), 'textInSearchFor');
    await G2Handlers.clickOnElement(value, 'searchBtn');
    await G2Handlers.clickOnElement(value, 'selectdrp');
  },
);

Then(/^I select the "([^"]*)" and click on "([^"]*)"$/, async (locator, value) => {
  await G2Handlers.clickOnElement(locator);
  await G2Handlers.clickOnElement(value, 'optionsForHover');
});

Then(
  /^I enter text in "([^"]*)" with value "([^"]*)" in the message dialog window$/,
  async (locator, value) => {
    await G2Handlers.enterValue(
      locator,
      value.toString(),
      'textboxUsingLabelInMessageDialogWindow',
    );
    I.report('Entered text for ' + locator + ' with value ' + value);
  },
);

Then(/^I click on "([^"]*)" radio in dialog window$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'buttonRadioInDialogWindow');
  I.report('Clicked on ' + locator + ' radio');
});

Then(/^I click on "([^"]*)" checkbox in dialog window$/, async (locator) => {
  locator = CommonUtils.identifyData(locator);
  await G2Handlers.clickOnElement(locator, 'checkboxInDialogWindow');
  I.report('Clicked on ' + locator + ' checkbox');
});

Then(/^I click on "([^"]*)" checkbox$/, async (locator) => {
  locator = CommonUtils.identifyData(locator);
  await G2Handlers.clickOnElement(locator, 'checkBox');
  I.report('Clicked on ' + locator + ' checkbox');
});

Then(/^I click on "([^"]*)" to check$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'buttonToView');
  I.report('Clicked on ' + locator);
});

Then(
  /^I edit Default Operator Id with value "([^"]*)" and Remark as "([^"]*)"$/,
  async (value, remark) => {
    await GenericMethods.defaultOperatorId(value, remark);
    I.report('Edited Default Operator Id with value ' + value);
  },
);
Then(/^I change Language with value "([^"]*)" and Remark as "([^"]*)"$/, async (value, remark) => {
  await GenericMethods.LanguageEdit(value, remark);
  I.report('Edited Language with value ' + value);
});

Then(
  /^I change Language in OrgPortal with value "([^"]*)" and Remark as "([^"]*)"$/,
  async (value, remark) => {
    await GenericMethods.LanguageEditInorg(value, remark);
    I.report('Edited Language with value ' + value);
  },
);

Then(/^I select drop down "([^"]*)" with the "([^"]*)"/, async (locator, value) => {
  await G2Handlers.selectOption1(locator, value);
});

Then(/^I select the "([^"]*)" click on the "([^"]*)"$/, async (locator, value) => {
  await G2Handlers.clickOnElement(locator, 'buttonDropDown');
  await G2Handlers.clickOnElement(value, 'Assettype');
});

Then(/^I select "([^"]*)" in UserService$/, async (locator) => {
  await G2Handlers.clickOnElement('GenericLocators.UserServiceFuncDropdown');
  await G2Handlers.clickOnElement(locator, 'optionUserService');
});

Then(/^I select "([^"]*)" in Operation$/, async (operationsValue) => {
  await GenericMethods.operations(operationsValue);
});

Then(/^I click on "([^"]*)" on button in top menu$/, async (locator) => {
  await G2Handlers.clickOnElement(locator, 'buttonInTopMenu');
  I.report('Clicked on ' + locator + ' button');
});

Then(/^I Add product in the organization as "([^"]*)"$/, async (product) => {
  await G2Handlers.clickOnElement(' Add ', 'buttonCite');
  await G2Handlers.enterValue('Product Name', product.toString(), 'textboxUsingLabel');
  await G2Handlers.clickOnElement('GenericLocators.SearchReceipt');
  await G2Handlers.clickOnElement(product, 'AddProduct');
  await G2Handlers.clickOnElement('GenericLocators.ConfirmProduct');
  I.report('Added product' + product + ' to child org');
});

Then(/^I Add product in till as "([^"]*)"$/, async (product) => {
  await G2Handlers.clickOnElement('Add', 'buttonCite');
  await G2Handlers.clickOnElement(product, 'AddProduct');
  await G2Handlers.clickOnElement('GenericLocators.SubmitChangeStatus');
  I.report('Added product' + product + ' to child org');
});

Then(/^I Add product "([^"]*)" in the organization of Sp portal$/, async (product) => {
  await G2Handlers.clickOnElement('Add Product', 'buttonCite');
  await G2Handlers.clickOnElement(product, 'AddProduct');
  await G2Handlers.clickOnElement('GenericLocators.SubmitChangeStatus');
  I.report('Added product' + product + ' to Top Org');
});

Then(/^I select the debit party as "([^"]*)" with value "([^"]*)"$/, async (debitparty, value) => {
  await G2Handlers.clickOnElement('Debit Party', 'customDropdownLocator');
  await G2Handlers.clickOnElement('GenericLocators.SubmitChangeStatus');
});

Then(/^I create customer the with below details$/, async (table) => {
  let tObj = table.parse().hashes()[0];
  TestData.setField('menuItem', 'Customer');
  await GenericMethods.createCustomerdetails(tObj);
  I.report('I create customer the with below details ' + tObj);
});

When(
  /^MakerChecker is Review Transaction "([^"]*)" for ReceiptNo "([^"]*)" Status "([^"]*)"$/,
  async (tableData, TransReceipt, approveOrReject) => {
    await GenericMethods.navigateToTransactionapproveOrReject(
      tableData,
      TransReceipt,
      approveOrReject,
    );
    I.report('Transaction ReceiptNo' + TransReceipt + 'Transaction Status' + approveOrReject);
  },
);

Then(/^I check the Transaction ReceiptNo "([^"]*)"$/, async (TransReceipt) => {
  await GenericMethods.navigateToTransactionReceiptNo(TransReceipt);
  I.report('Transaction ReceiptNo' + TransReceipt);
});

Then(/^I recycle the MSISDN "([^"]*)"$/, async (msisdn) => {
  await AdminPage.recycleMSISDN(msisdn);
});

Then(
  /^I check table "([^"]*)" with values as "([^"]*)" and click on "([^"]*)" for Status "([^"]*)"$/,
  async (tableData, accountName, operation, status) => {
    await GenericMethods.AccountStatusChange(tableData, accountName, operation, status);
    I.report(
      'Verified table ' + tableData + ' has values ' + accountName + ' and clicked on ' + status,
    );
  },
);

Then(/^I create bank account with below details for Sp Portal$/, async (table) => {
  const tObj = table.parse().hashes()[0];
  await GenericMethods.createBankAccountOrgandSp(tObj);
  I.report('Bank account is created ' + tObj);
});

Then(/^I verify Portal Log with below details$/, async (table) => {
  let tObj = table.parse().hashes()[0];
  await GenericMethods.verifyOrgAction(tObj);
  I.report('Edited KYC Info with following details ' + tObj);
});

Then(/^I edit Group name as "([^"]*)" and remark as "([^"]*)"$/, async (value, remark) => {
  await GenericMethods.GroupNameEdit(value, remark);
  I.report('Edited GroupName with value ' + value);
});
