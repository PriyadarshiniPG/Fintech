const { ButtonLink, Login, USSD } = inject();

/* eslint-disable no-undef */
Given(/^I login to "([^"]*)" as "([^"]*)"$/, async (url, username) => {
  await Login.navigateUrl(url);
  await Login.loginServicePortal(url, username);
});

Then(/^enter "([^"]*)" and Login$/, async (OTP) => {
  await Login.enterOTPLogin(OTP);
});

Then(/^enter subscriber value "([^"]*)"$/, async (msisdn) => {
  await ServicePortalPage.enterSubscriber(msisdn);
});

Then(/^I click on checkbox "([^"]*)" with text "([^"]*)"$/, async (locator, text) => {
  await ButtonLink.clickOnElement(locator, text);
});

Then(/^verify column "([^"]*)" have filter "([^"]*)"$/, async (locator, optionValue) => {
  await Filter.clickOnElement(locator, optionValue);
});

Given(/^I navigate to "([^"]*)" page using below details$/, async (page, table) => {
  let tObj = table.parse().hashes()[0];
  for (var key in tObj) {
    switch (key) {
      case 'Login_Url':
        await Login.navigateUrl(tObj['Login_Url']);
        await Login.loginServicePortal(tObj['Login_Url'], tObj['User'], tObj['MarketName']);
        break;

      case 'OTPPortal':
        await USSD.checkMessage(tObj['OTPPortal'], tObj['Sendername'], tObj['Device']);
        await Login.enterOTPLogin('Service_Portal_OTP');
        break;

      default:
        break;
    }
  }
});
