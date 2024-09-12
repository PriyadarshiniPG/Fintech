const { I, G2Handlers, CommonUtils, Assert } = inject();
class LoginPage {
  async login(login_details) {
    let userId = CommonUtils.identifyData('Login.' + login_details + '.UserID');
    let password = CommonUtils.identifyData('Login.' + login_details + '.password');
    let verificationCode = CommonUtils.identifyData('Login.VerificationCode');
    await I.clearCookie();
    await I.refreshPage();
    if (login_details.includes('org')) {
      await I.amOnPage(CommonUtils.identifyData('Login.Org-Url'));
      await I.see('Welcome To Organization Portal');
      await G2Handlers.enterValue(
        'Login.ShortCode',
        CommonUtils.identifyData('Login.' + login_details + '.Shortcode'),
      );
      await G2Handlers.clickOnElement('Login Service Agreement', 'buttonInSpan1');
      await I.waitForElement(CommonUtils.identifyLocator('Login.Agreement'));
      await G2Handlers.clickOnElement(' I Have Read And Agreed', 'buttonInSpandialog');
    } else {
      await I.amOnPage(CommonUtils.identifyData('Login.SP-Url'));
      await I.see('Service Provider Portal');
      await G2Handlers.clickOnElement('Login Service Agreement', 'buttonInSpan1');
      await I.waitForElement(CommonUtils.identifyLocator('Login.Agreement'));
      await G2Handlers.clickOnElement(' I have read and agreed', 'buttonInSpandialog');
    }
    await G2Handlers.enterValue('Login.AccountName', userId);
    await G2Handlers.enterValue('Login.Password', password);
    await G2Handlers.enterValue('Login.VerifyCode', verificationCode);
    await G2Handlers.clickOnElement('Login.LoginBtn');
  }

  async loginError(login_details) {
    let userId = CommonUtils.identifyData('Login.' + login_details + '.UserID');
    let password = CommonUtils.identifyData('Login.' + login_details + '.password');
    let verificationCode = CommonUtils.identifyData('Login.VerificationCode');
    await I.clearCookie();
    if (login_details.includes('org')) {
      await I.amOnPage(CommonUtils.identifyData('Login.Org-Url'));
      //await I.see('Organization Portal');
      await G2Handlers.enterValue(
        'Login.ShortCode',
        CommonUtils.identifyData('Login.' + login_details + '.Shortcode'),
      );
    } else {
      await I.amOnPage(CommonUtils.identifyData('Login.SP-Url'));
      //await I.see('Service Provider Portal');
    }
    await G2Handlers.enterValue('Login.UserName', userId);
    await G2Handlers.enterValue('Login.Password', password);
    await G2Handlers.enterValue('Login.VerificationCode', verificationCode);
    if (CommonUtils.identifyData('Login.SP-Url').includes('tz')) {
      await G2Handlers.clickOnElement('Login Service Agreement', 'buttonInLink');
      await G2Handlers.clickOnElement('Continue', 'buttonInDiv');
    }
    await G2Handlers.clickOnElement('Login.LoginBtn');
  }

  async navigateToPortal(url) {
    if (url.includes('sp')) {
      await I.amOnPage(CommonUtils.identifyData('Login.SP-Url'));
    } else {
      await I.amOnPage(CommonUtils.identifyData('Login.Org-Url'));
    }
  }

  async loginRepeatedly(login_details, numberOfTimes) {
    let userId = CommonUtils.identifyData('Login.' + login_details + '.UserID');
    let password = CommonUtils.identifyData('Login.' + login_details + '.password');
    let verificationCode = CommonUtils.identifyData('Login.VerificationCode');
    await I.clearCookie();
    if (login_details.includes('org')) {
      await I.amOnPage(CommonUtils.identifyData('Login.Org-Url'));
      //await I.see('Organization Portal');
      await G2Handlers.enterValue(
        'Login.ShortCode',
        CommonUtils.identifyData('Login.' + login_details + '.Shortcode'),
      );
    } else {
      await I.amOnPage(CommonUtils.identifyData('Login.SP-Url'));
    }
    for (let i = 0; i < numberOfTimes; i++) {
      await G2Handlers.enterValue('Login.UserName', userId);
      await G2Handlers.enterValue('Login.Password', password);
      await G2Handlers.enterValue('Login.VerificationCode', verificationCode);
      if (CommonUtils.identifyData('Login.SP-Url').includes('tz')) {
        await G2Handlers.clickOnElement('Login Service Agreement', 'buttonInLink');
        await G2Handlers.clickOnElement('Continue', 'buttonInDiv');
      }
      await G2Handlers.clickOnElement('Login.LoginBtn');
    }
    Assert.verifyIfStringContains(I.grabSource(), 'locked');
  }
}
module.exports = new LoginPage();
module.exports.LoginPage = LoginPage;
