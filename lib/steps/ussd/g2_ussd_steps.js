const { USSD, TestData, CommonUtils, I, G2Ussd, LoggerFactory } = inject();
const logger = LoggerFactory.init();

/* eslint-disable no-undef */
When(/^I select "([^"]*)" Service for "([^"]*)"$/, async (service, customer) => {
  service = CommonUtils.identifyData(service);
  await G2Ussd.selectService(service, customer);
  await I.switchHelper('WebDriver');
});

Then(/^I validate message "([^"]*)" on "([^"]*)"/, async (message, customer) => {
  message = CommonUtils.identifyData(message);
  await G2Ussd.checkMessage(message, customer);
});

Then(/^I verify text "([^"]*)"/, async (message) => {
  //message1 = CommonUtils.identifyData(message);
  await G2Ussd.verifyingtext(message);
});

Then(
  /^I validate message "([^"]*)" from "([^"]*)" on "([^"]*)"/,
  async (message, sms, customer) => {
    message = CommonUtils.identifyData(message);
    await G2Ussd.checkMessage(message, customer, sms);
  },
);

Then(
  /^I get the receipt number from "([^"]*)" and store in "([^"]*)"$/,
  async (sms, strReceipt) => {
    if (typeof TestData.getField(sms) !== 'undefined') {
      let arr = TestData.getField(sms).split(' ');
      TestData.setField(strReceipt, arr[0]);
    } else {
      I.fail('Please check SMS is empty.');
    }
  },
);

Then(
  /^I get Voucher Code from "([^"]*)" on "([^"]*)" and store it in "([^"]*)"/,
  async (sms, customer, voucherCode) => {
    let strVoucherCode = await G2Ussd.getVoucherCode(sms, customer);
    TestData.setField(voucherCode, strVoucherCode);
    logger.info('Voucher Number is ' + strVoucherCode);
  },
);

Then(
  /^I get Receipt Number from "([^"]*)" on "([^"]*)" and store it in "([^"]*)"/,
  async (sms, customer, receiptNumber) => {
    let strReceiptNumber = await G2Ussd.getReceiptNumber(sms, customer);
    TestData.setField(receiptNumber, strReceiptNumber);
    logger.info('Receipt Number is ' + strReceiptNumber);
  },
);

Then(
  /^I get the value of initial pin from "([^"]*)" for sms "([^"]*)" and store in "([^"]*)"$/,
  async (device, sms, strPIN) => {
    sms = CommonUtils.identifyData(sms);
    let strInitialPin = await G2Ussd.getPIN(sms, device);
    TestData.setField(strPIN, strInitialPin);
    logger.info('Initial PIN is ' + strInitialPin);
  },
);

When(
  /^I perform "([^"]*)" Service "([^"]*)" times for "([^"]*)" and verify message "([^"]*)"$/,
  async (service, numberOfTimesToExecute, customer, message) => {
    service = CommonUtils.identifyData(service);
    numberOfTimesToExecute = CommonUtils.identifyData(numberOfTimesToExecute);
    message = CommonUtils.identifyData(message);
    for (let i = 0; i < numberOfTimesToExecute; i++) {
      await USSD.dialUSSD(CommonUtils.identifyData('USSD.Code'), customer);
      await G2Ussd.selectService(service, customer);
    }
    await G2Ussd.checkMessage(message, customer, CommonUtils.identifyData('USSD.Sender'));
  },
);

When(/^I perform "([^"]*)" operation for "([^"]*)"$/, async (service, device) => {
  await G2Ussd.selectServiceOnSTK(service, device);
});

When(
  /^I perform "([^"]*)" operation "([^"]*)" times for "([^"]*)" and verify "([^"]*)" message$/,
  async (service, numberOfTimesToExecute, device, message) => {
    service = CommonUtils.identifyData(service);
    numberOfTimesToExecute = CommonUtils.identifyData(numberOfTimesToExecute);
    message = CommonUtils.identifyData(message);
    for (let i = 0; i < numberOfTimesToExecute; i++) {
      await G2Ussd.selectServiceOnSTK(service, device);
    }
    await G2Ussd.checkMessage(message, CommonUtils.identifyData('USSD.Sender'), device);
    await I.switchHelper('WebDriver');
  },
);

Then(/^I close the app$/, async () => {
  await G2Ussd.closeRecentApps();
});

Then(
  /^I get Voucher Number with "([^"]*)" digits from "([^"]*)" on "([^"]*)" and store it in "([^"]*)"/,
  async (numOfDigits, sms, customer, voucherCode) => {
    let strVoucherCode = await G2Ussd.getVoucherNumber(sms, customer, numOfDigits);
    TestData.setField(voucherCode, strVoucherCode);
    logger.info('Voucher Number is ' + strVoucherCode);
  },
);

Then(/^I check whether the "([^"]*)" menu is not available in the handset$/, async (menuname) => {
  await G2Ussd.checkMenuNotAvailable(menuname);
  logger.info('The ' + menuname + ' menu is not available');
});

Then(
  /^I replace the "([^"]*)" key value with "([^"]*)" in the "([^"]*)" json file$/,
  async (key, value, jsonFile) => {
    await G2Ussd.addOrUpdateJsonFile(key, value, jsonFile);
  },
);

Then(
  /^I replace the "([^"]*)" value with "([^"]*)" in the "([^"]*)" json in folder "([^"]*)"$/,
  async (key, value, jsonFile, FolderLocation) => {
    await G2Ussd.appendAFileLocation(key, value, jsonFile, FolderLocation);
  },
);

Then(
  /^I get the balance from "([^"]*)" for sms "([^"]*)" and store in "([^"]*)"$/,
  async (device, sms, strBal) => {
    sms = CommonUtils.identifyData(sms);
    let strBalance = await G2Ussd.getPIN(sms, device);
    TestData.setField(strBal, strBalance);
    logger.info('Balance is ' + strBalance);
  },
);
