let { USSD, CommonUtils } = inject();

/* eslint-disable no-undef */
Given(/^I dial USSD code "([^"]*)" for "([^"]*)"$/, async (numbers, customer) => {
  numbers = CommonUtils.identifyData(numbers);
  await USSD.dialUSSD(numbers, customer);
});

When(/^I perform "([^"]*)" Service for "([^"]*)"$/, async (service, customer) => {
  service = CommonUtils.identifyData(service);
  await USSD.selectService(service, customer);
});

Then(/^I check message "([^"]*)" from "([^"]*)" on "([^"]*)"/, async (message, sms, customer) => {
  message = CommonUtils.identifyData(message);
  await USSD.checkMessage(message, sms, customer);
});

Then(/^I tap Ok button/, async () => {
  USSD.tap();
});

// eslint-disable-next-line no-undef
Then(/^four digit PIN is entered in "([^"]*)"/, async (customer) => {
  USSD.enterPIN(customer);
});

// eslint-disable-next-line no-undef
Then(/^incorrect PIN is entered in "([^"]*)"/, async (customer) => {
  USSD.enterIncorrectPIN(customer);
});

// eslint-disable-next-line no-undef
Then(/^cancel the push notification/, async () => {
  USSD.cancelPushNotification();
});

// eslint-disable-next-line no-undef
Then(/^app is started in "([^"]*)"/, async (customer) => {
  await USSD.startApp(customer);
});

// eslint-disable-next-line no-undef
When(/^push notification appears in "([^"]*)"/, async (customer) => {
  USSD.waitTillPushNotification(customer);
});
