const { I, G2Handlers, IFrame, CommonUtils, LoggerFactory } = inject();
const logger = LoggerFactory.init();
class HomePage extends Helper {
  async navigateUrl() {
    await I.amOnPage(CommonUtils.identifyData('url'));
  }

  async validateHomePageLabels() {
    await G2Handlers.verifyText('HOME');
    await G2Handlers.verifyText('SEARCH');
  }

  async moveToAppiumAndPerformSteps() {
    await I.switchHelper('Appium');
    await I.amOnPage(CommonUtils.identifyData('url'));
    await G2Handlers.verifyText(CommonUtils.identifyData('Codecept Page Title Text'));
    await G2Handlers.clickOnElement('Quickstart', 'buttonInSpan');
    await I.switchHelper('WebDriver');
  }

  async enterOTPLogin(serviceportalOTP) {
    // example Business process component method goes here
    logger.info(serviceportalOTP);
  }

  async clickOnTopAndSubMenu(topMenu, subMenu) {
    if (typeof subMenu !== 'undefined') {
      await G2Handlers.clickOnElement(topMenu, 'buttonTopMenu');
      await G2Handlers.moveOnElement(topMenu, 'buttonTopMenu');
      await this.clickOnSubMenu(subMenu);
    } else {
      await G2Handlers.clickOnElement(topMenu, 'buttonTopMenu');
    }
    await IFrame.switchToLastFrame();
  }

  async clickOnCloseTabNearHome() {
    await I.waitForInvisible(
      "//div[contains(@style,'display: block')]//div[@class='info loading']",
      10,
    );
    await IFrame.switchToMainPage();
    await G2Handlers.clickOnElement('homepage.Close_TAB');
    await I.waitForInvisible(
      "//div[contains(@style,'display: block')]//div[@class='info loading']",
      10,
    );
  }

  async clickOnLogout(logout_details) {
    if (logout_details == 'sp') {
      await G2Handlers.waitForPageLoad();
      await G2Handlers.clickOnElement('homepage.Profile');
      await G2Handlers.clickOnElement('homepage.Logout');
      await G2Handlers.clickOnElement('homepage.Logout_Yes');
      await I.clearCookie();
      //Review Comment - No need to refresh page
      //await I.refreshPage();
    } else if (logout_details == 'org') {
      await G2Handlers.waitForPageLoad();
      await G2Handlers.clickOnElement('homepage.ProfileOrg');
      await G2Handlers.clickOnElement('homepage.LogoutOrg');
      await G2Handlers.clickOnElement('homepage.LogoutConfirm');
      await I.clearCookie();
      //Review Comment - No need to refresh page
      //await I.refreshPage();
    } else {
      await G2Handlers.clickOnElement('homepage.ProfileConfig');
      await G2Handlers.clickOnElement('homepage.Logout_Config_Yes');
      await I.clearCookie();
      //Review Comment - No need to refresh page
      //await I.refreshPage();
    }
  }

  async clickOnSubMenu(submenuname) {
    const client = this.helpers['WebDriver'].browser;
    logger.debug('Clicking on Sub Menu - ');
    const els = await client.$$("//a[contains(text(),'" + submenuname + "')]");
    let subMenuFound = 0;
    for (let el of els) {
      var sbname = await el.getText();
      if (sbname.includes(submenuname)) {
        subMenuFound = 1;
        await el.click();
        break;
      }
    }
    if (subMenuFound == 0) {
      logger.debug('Submenu not found for ' + submenuname);
      throw new Error('SubMenu not found for ' + submenuname);
    }

    return true;
  }

  async reloadPage() {
    await I.wait(5);
    await I.refreshPage();
  }

  async closeCurrentTab() {
    await I.waitForInvisible(
      "//div[contains(@style,'display: block')]//div[@class='info loading']",
      10,
    );
    await IFrame.switchToMainPage();
    await G2Handlers.clickOnElement(
      locate(CommonUtils.identifyLocator('homepage.TAB_FRAME')).last(),
    );
    // await I.click(locate('div').withAttr({ id$: '_close' }).last());
    await I.waitForInvisible(
      "//div[contains(@style,'display: block')]//div[@class='info loading']",
      10,
    );
    await IFrame.switchToCurrentWindowHandle();
    await IFrame.switchToMainPage();
    await IFrame.switchToLastFrame();
    await IFrame.switchToNextFrame();
  }
}
module.exports = new HomePage();
module.exports.HomePage = HomePage;
