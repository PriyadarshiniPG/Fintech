const { I, LoggerFactory, Mobile, CommonUtils } = inject();

const logger = LoggerFactory.init();

class USSD {
  //this method is used for getting the menus for the service
  async _getMenuCommands(service) {
    let result = null;
    let commandLine = CommonUtils.identifyData(service);
    if (typeof commandLine !== 'undefined') {
      let items = commandLine.split('/');
      result = items;
    } else {
      logger.error(`Commandline not found for the service ${service}`);
      I.fail('Menu can not be selected as Commandline is not found for the service.');
    }
    return result != null ? result : 'Commands not found';
  }
  //this method is used for selecting the menus for the service
  async _selectMenus(menuItems, customer) {
    await I.waitForElement(CommonUtils.identifyLocator('ussd.menu_input'), 30);
    const menus = await this._getUSSDMenuText();
    logger.info('Menu Items are', menus);
    logger.info('Selecting the menu id for', menuItems);
    menus.forEach((items) =>
      items.includes(menuItems) ? console.log('') : I.fail(menuItems + ' not found in the options'),
    );
    let regex = new RegExp('\\d+(?=.?\\s+' + menuItems + ')');
    if (regex.test(menus)) {
      let match = menus.toString().match(regex);
      logger.info('Matched menu is : ' + match);
      logger.info('Menu id is ' + match[0] + ' for ' + menuItems);
      if (match != null) {
        await I.see(menuItems);
        await I.appendField(CommonUtils.identifyLocator('ussd.menu_input'), match);
        //   await I.hideDeviceKeyboard();
        await I.tap(CommonUtils.identifyLocator('ussd.menu_button'));
        await I.waitForElement(CommonUtils.identifyLocator('ussd.menu_input'), 40);
      }
    } else {
      let value = CommonUtils.identifyData(customer + '.' + menuItems.toString().toUpperCase());
      if (typeof value === 'undefined') {
        if (menuItems === 'Enter an amount') {
          this._selectAmount(menus);
        }
      } else {
        logger.info('Value is ' + value + ' for ' + menuItems);
        await I.waitForElement(CommonUtils.identifyLocator('ussd.menu_input'), 30);
        await I.appendField(CommonUtils.identifyLocator('ussd.menu_input'), value);
        await I.tap(CommonUtils.identifyLocator('ussd.menu_button'));
      }
    }
  }

  //this method is used for selecting the amount for loan
  async _selectAmount(menus) {
    let regex = new RegExp(
      '([\\d\\.]+)\\s+and\\s+' + CommonUtils.identifyData('Currency') + '?([\\d\\.]+)',
    );
    let match = menus.toString().match(regex);
    logger.info('match of 1 ' + match[1]);
    logger.info('match of 2 ' + match[2]);
    await I.appendField(CommonUtils.identifyLocator('ussd.menu_input'), parseInt(match[1]));
    await I.tap(CommonUtils.identifyLocator('ussd.menu_button'));
  }

  async checkMessage(message, sms, customer) {
    await I.switchHelper('Appium');
    await Mobile.startApp('messageapp', customer);
    await I.seeElement(CommonUtils.identifyLocator('ussd.message_search'));
    await I.tap(CommonUtils.identifyLocator('ussd.message_search'));
    await I.seeElement(CommonUtils.identifyLocator('ussd.search_text'));
    await I.appendField(CommonUtils.identifyLocator('ussd.search_text'), sms);
    await I.sendDeviceKeyEvent(66);
    await I.waitForElement(CommonUtils.identifyLocator('ussd.message_title'), 30);
    await I.tap(sms);
    await I.waitForElement(CommonUtils.identifyLocator('ussd.message_text'), 30);
    const messages = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.message_text'));
    const verifyMessage = CommonUtils.identifyData(message);
    Mobile.getMsgRegex(verifyMessage, messages);
  }

  async tap() {
    await I.switchHelper('Appium');
    await I.tap(CommonUtils.identifyLocator('ussd.ok_button'));
  }

  //this method is used to verify the sms in messages
  async verifyMessage(message, sms, customer) {
    await I.switchHelper('Appium');
    await Mobile.startApp('messageapp', customer);
    await I.waitForElement(CommonUtils.identifyLocator('ussd.message_search'), 30);
    await I.seeElement(CommonUtils.identifyLocator('ussd.message_search'));
    await I.tap(CommonUtils.identifyLocator('ussd.message_search'));
    await I.seeElement(CommonUtils.identifyLocator('ussd.search_text'));
    await I.appendField(CommonUtils.identifyLocator('ussd.search_text'), sms);
    await I.sendDeviceKeyEvent(66);
    await I.waitForElement(CommonUtils.identifyLocator('ussd.message_title'), 30);
    await I.tap(sms);
    await I.waitForElement(CommonUtils.identifyLocator('ussd.message_text'), 30);
    const messages = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.message_text'));
    const verifyMessage = CommonUtils.identifyDataData(message);
    if (messages[0].includes(verifyMessage)) {
      I.report('Message ' + verifyMessage + ' is seen ');
      logger.info('Message ' + verifyMessage + ' is seen ');
    } else {
      I.fail('Message ' + verifyMessage + ' is not seen ');
    }
  }

  //this method is used for waiting that message is received
  async _waitForMessage(seconds, sender) {
    const threshold = parseInt(seconds / 2); // Wait 2 seconds for each iteration
    let count = 0;
    while (count < threshold) {
      if (await this._getSender(sender)) {
        return true;
      }
      await I.wait(2);
      count++;
    }
    return false;
  }

  //this method gets the senders list in Messages app and compares with user provided Sender
  async _getSender(sender) {
    /* Grab all Senders from the locator and compare with the User provided Sender
     */
    const resultMsg = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.message_sender'));
    const match = resultMsg.toString().includes(sender);
    return match;
  }

  //this method is used for getting the number of messages
  // async _getNumOfMessages() {
  //   // Message search result widget locator (ToDo: Move to USSD locator)
  //   // const msgSearchResultLocator =
  //   //   '//hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.ViewGroup/android.widget.TextView';
  //   /* Grab all Text from the locator
  //      e.g.: For the sender "OLMpesa" the following result is retuned
  //         5 results for "OLMpesa"
  //      or,
  //         For the sender "M-Pesa-UAT" the following result is returned
  //         1 result for "M-Pesa-UAT"
  //   */
  //   const resultMsg = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.msg_search_result'));
  //   const match = resultMsg.toString().match(new RegExp(/\d+(?=\s+result)/));
  //   return match ? Number(match[0]) : 0;
  // }

  //this method is used for deleting the conversation in messages.
  async _deleteMessage() {
    await I.tap(CommonUtils.identifyLocator('ussd.more_options'));
    await I.tap('Delete conversation', CommonUtils.identifyLocator('ussd.text_view'));
    await I.see('Delete');
    await I.tap(CommonUtils.identifyLocator('ussd.delete_button'));
  }

  //this method is used for selecting the service from ussd menu
  async selectService(service, customer) {
    await I.switchHelper('Appium');
    const items = await this._getMenuCommands(service);
    if (items !== 'Commands not found') {
      for (let i = 0; i < items.length; i++) {
        await this._selectMenus(items[i], customer);
      }
      // await I.waitForElement(CommonUtils.identifyLocator('ussd.menu_message'), 30);
      // let menus = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.menu_message'));
      // if (menus.includes(CommonUtils.identifyData('Confirm_Submission'))) {
      //   await I.seeElement(CommonUtils.identifyLocator('ussd.menu_button'));
      //   await I.tap(CommonUtils.identifyLocator('ussd.menu_button'));
      // }
    } else {
      logger.error('commands not found');
      I.fail('Menu commands not found to select the menu');
    }
  }
  //this method is used for dialing ussd menu
  async dialUSSD(numbers, customer) {
    await I.switchHelper('Appium');
    //await I.sendDeviceKeyEvent('4');
    await Mobile.startApp('dialerapp', customer);

    //
    // let menuMessage = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.menu_message'));
    // let widget = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.widget_frame'));
    // if (menuMessage.length !== 0 || widget.length !== 0) {
    //   await I.tap(CommonUtils.identifyLocator('ussd.menu_button'));
    // }
    // await I.waitForElement(CommonUtils.identifyLocator('ussd.menu_button'), 30);
    // await I.tap(CommonUtils.identifyLocator('ussd.menu_button'));
    //
    await I.waitForElement(CommonUtils.identifyLocator('ussd.dialer_button'), 30);
    await I.tap(CommonUtils.identifyLocator('ussd.dialer_button'));
    await I.appendField(
      CommonUtils.identifyLocator('ussd.dialer_input'),
      CommonUtils.identifyData(numbers),
    );
    await I.tap(CommonUtils.identifyLocator('ussd.dialer_call'));
    await I.waitForElement(CommonUtils.identifyLocator('ussd.menu_input'), 30);
  }

  // this method gets the text from the USSD menu
  async _getUSSDMenuText(seconds = 60) {
    const threshold = parseInt(seconds);
    let count = 0;
    let menuText = '';
    do {
      menuText = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.menu_message'));
      if (count > threshold) {
        return null;
      }
      await I.wait(1);
      count++;
    } while (menuText.toString().includes('USSD code running'));
    return menuText;
  }

  //this method get messages from the USSD Menu and stores the value in TestData
  async checkMenuText(message) {
    const menuText = await this._getUSSDMenuText();
    logger.debug('Menu text: ' + menuText);
    Mobile.getMsgRegex(message, menuText);
  }

  //this method selects the servce based on user input and regex
  async select(value, regex = '', menuDescriptionText = false) {
    const pattern = menuDescriptionText
      ? new RegExp(
          '(?<=' +
            CommonUtils.identifyData(regex) +
            '\\s*)\\d+(?=\\.?\\s*' +
            CommonUtils.identifyData(value) +
            '\\s*)',
        )
      : new RegExp(
          '\\d+(?=\\.?\\s*' +
            CommonUtils.identifyData(value) +
            '\\s*\\-?\\s*' +
            CommonUtils.identifyData(regex) +
            '\\s*)',
        );
    const menus = await this._getUSSDMenuText();
    logger.debug('Menus :' + menus);
    const match = menus ? menus.toString().match(pattern) : null;
    if (match) {
      const matchString = match[0];
      logger.debug('matched select: ' + matchString);
      await I.appendField(CommonUtils.identifyLocator('ussd.menu_input'), parseInt(matchString));
      await I.tap(CommonUtils.identifyLocator('ussd.menu_button'));
    } else {
      I.fail('Unable to find the selection: ', pattern);
    }
  }

  //this method enter text in USSD menu
  async enterText(value) {
    await I.waitForElement(CommonUtils.identifyLocator('ussd.menu_input'), 30);
    await I.appendField(
      CommonUtils.identifyLocator('ussd.menu_input'),
      CommonUtils.identifyData(value),
    );
    await I.tap(CommonUtils.identifyLocator('ussd.menu_button'));
  }

  //this method gets text in USSD menu and compares with user data
  async getText(value) {
    const verifyMessage = CommonUtils.identifyData(value);
    const menus = await this._getUSSDMenuText();
    if (menus != null) {
      I.report('USSD menu contains ' + verifyMessage);
      logger.debug('USSD menu contains ' + verifyMessage);
    } else {
      I.fail('USSD menu expected to contain ' + verifyMessage + ' but found ' + menus);
    }
  }

  //this method is used to submit button
  async submit() {
    await I.seeElement(CommonUtils.identifyLocator('ussd.menu_button'));
    await I.tap(CommonUtils.identifyLocator('ussd.menu_button'));
  }

  //this method is used to verify user data in the message
  async verifyItems(value, message) {
    const text = CommonUtils.identifyData(message);
    const verifyMessage = CommonUtils.identifyData(value);
    if (text.includes(verifyMessage)) {
      I.report(verifyMessage + ' is found in message');
      logger.info(verifyMessage + ' is found in message');
    } else {
      I.fail(verifyMessage + ' is not found in ' + text);
    }
  }

  async startApp(customer) {
    await I.switchHelper('Appium');
    await Mobile.startApp('dialerapp', customer);
  }

  async waitTillPushNotification() {
    await I.waitForElement(CommonUtils.identifyLocator('ussd.push_notification'), 60);
  }

  async enterPIN(customer) {
    await I.seeElement(CommonUtils.identifyLocator('ussd.push_notification'));
    await I.seeElement(CommonUtils.identifyLocator('ussd.enter_pin'));
    await I.tap(CommonUtils.identifyLocator('ussd.enter_pin'));
    const pin = CommonUtils.identifyData(customer + '.PIN');
    pin.split('');
    for (var i = 0; i < pin.length; i++) {
      await I.pressKey(pin[i]);
    }
    await I.tap(CommonUtils.identifyLocator('ussd.send_button'));
    await I.tap(CommonUtils.identifyLocator('ussd.ok_button'));
  }

  async enterIncorrectPIN(customer) {
    await I.seeElement(CommonUtils.identifyLocator('ussd.push_notification'));
    await I.seeElement(CommonUtils.identifyLocator('ussd.enter_pin'));
    await I.tap(CommonUtils.identifyLocator('ussd.enter_pin'));
    const pin = CommonUtils.identifyData(customer + '.IncorrectPIN');
    pin.split('');
    for (var i = 0; i < pin.length; i++) {
      await I.pressKey(pin[i]);
    }
    await I.tap(CommonUtils.identifyLocator('ussd.send_button'));
    await I.tap(CommonUtils.identifyLocator('ussd.ok_button'));
  }

  async cancelPushNotification() {
    await I.seeElement(CommonUtils.identifyLocator('ussd.push_notification'));
    await I.tap(CommonUtils.identifyLocator('ussd.cancel_button'));
  }
}
module.exports = new USSD();
module.exports.USSD = USSD;
