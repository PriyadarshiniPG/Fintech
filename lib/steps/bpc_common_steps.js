let { HomePage, PluginsPage } = inject();

/* eslint-disable no-undef */
Given(/^I navigate to "([^"]*)" page using below details$/, async (page, table) => {
  let tObj = table.parse().hashes()[0];
  for (var key in tObj) {
    switch (key) {
      case 'Login_Url':
        await HomePage.navigateUrl(tObj['Login_Url']);
        await PluginsPage.loginServicePortal(tObj['Login_Url'], tObj['User'], tObj['MarketName']);
        break;

      case 'OTPPortal':
        await PluginsPage.checkMessage(tObj['OTPPortal'], tObj['Sendername'], tObj['Device']);
        await HomePage.enterOTPLogin('Service_Portal_OTP');
        break;

      default:
        break;
    }
  }
});
