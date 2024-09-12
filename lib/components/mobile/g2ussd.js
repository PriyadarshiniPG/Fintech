const { I, LoggerFactory, Mobile, CommonUtils, TestData } = inject();
const { USSD } = require('./ussd');
const logger = LoggerFactory.init();

class G2Ussd extends USSD {
  //this method is used for selecting the menus for the service
  async _selectMenus(menuItems, customer) {
    await I.waitForElement(TestData.getLocator('ussd.menu_input'), 30);
    let menus = await I.grabTextFromAll(TestData.getLocator('ussd.menu_message'));
    let tillmenus = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.till_menu_message'));
    logger.info('Menu Items are', menus);
    logger.info('Menu Items are', tillmenus);
    logger.info('Selecting the menu id for', menuItems);
    let regex = new RegExp('\\d+(?=.?\\s?' + menuItems + ')');
    if (regex.test(menus)) {
      let match = menus.toString().match(regex);
      logger.info('Menu id is ' + match[0] + ' for ' + menuItems);
      if (match != null) {
        await I.waitForElement(TestData.getLocator('ussd.menu_input'), 40);
        await I.appendField(TestData.getLocator('ussd.menu_input'), match);
        //await I.tap(TestData.getLocator('ussd.menu_button'));
        await I.tap(TestData.getLocator('ussd.send_button'));
        await I.waitForInvisible(TestData.getLocator('ussd.menu_progress'), 40);
      }
    } else {
      let value = CommonUtils.identifyData(menuItems);
      if (value == 'PIN') {
        value = TestData.getData(customer + '.PIN');
      } else if (value == 'AssistantID') {
        value = TestData.getData(customer + '.AssistantID');
      }
      logger.info('Value is ' + value + ' for ' + menuItems);
      await I.waitForElement(TestData.getLocator('ussd.menu_input'), 30);
      await I.appendField(TestData.getLocator('ussd.menu_input'), value);
      //await I.tap(TestData.getLocator('ussd.menu_button'));
      await I.tap(TestData.getLocator('ussd.send_button'));
    }
  }

  //this method is used to get some value from the sms in messages
  async checkMessage(message, customer, sms) {
    await I.wait(10);
    if (sms !== undefined) {
      sms = CommonUtils.identifyData(sms);
    }
    await I.switchHelper('Appium');
    // let testing = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.menu_message'));
    // if (testing.length !== 0) {
    //   await I.tap(TestData.getLocator('ussd.menu_button'));
    // }
    await Mobile.startApp('messageapp', customer);
    //await I.wait(60);
    // let time1 = await I.grabTextFromAll(
    //   "//android.widget.TextView[@resource-id='com.android.mms:id/from']//ancestor::android.widget.LinearLayout//following-sibling::android.widget.LinearLayout//android.widget.TextView[@resource-id='com.android.mms:id/unread']",
    // );
    await I.waitForElement(TestData.getLocator('ussd.message_search'), 30);
    await I.seeElement(TestData.getLocator('ussd.message_search'));
    await I.tap(TestData.getLocator('ussd.message_search'));
    await I.seeElement(TestData.getLocator('ussd.search_text'));
    if (sms !== undefined) {
      await I.appendField(TestData.getLocator('ussd.search_text'), sms);
    } else {
      await I.appendField(TestData.getLocator('ussd.search_text'), message); //sms
    }
    await I.sendDeviceKeyEvent(66);
    await I.waitForElement(TestData.getLocator('ussd.message_title'), 30);
    if (sms !== undefined) {
      await I.tap(sms);
    } else {
      await I.tap(TestData.getLocator('ussd.message_title')); //sms
    }

    await I.waitForElement(TestData.getLocator('ussd.message_text'), 60);
    //let time2 = await I.grabTextFromAll(TestData.getLocator('ussd.message_received_time'));
    //let deviceTime = await this.helpers['appium'].getDeviceTime();
    const messages = await I.grabTextFromAll(TestData.getLocator('ussd.message_text'));
    TestData.setField('strSMS', messages[messages.length - 1]);
    logger.info('Message received on handset : ' + messages[messages.length - 1]);
    I.report('Grabbed Message : ' + messages[messages.length - 1]);
    const verifyMessage = CommonUtils.identifyData(message);
    logger.info('Verifying sms : ' + verifyMessage);
    if (messages[messages.length - 1].toString().includes(verifyMessage)) {
      I.report(verifyMessage + ' is found');
    } else {
      I.fail(verifyMessage + ' not found in Messages');
    }
    await I.switchHelper('WebDriver');
  }

  //this method is used for deleting the conversation in messages.
  async _deleteMessage() {
    await I.tap(CommonUtils.identifyLocator('ussd.more_options'));
    await I.tap('Delete conversation', CommonUtils.identifyLocator('ussd.text_view'));
    //await I.see('Delete');
    await I.tap(CommonUtils.identifyLocator('ussd.delete_button'));
  }

  async selectService(service, customer) {
    await I.switchHelper('Appium');
    const items = await this._getMenuCommands(service);
    if (items !== 'Commands not found') {
      for (let i = 0; i < items.length; i++) {
        items[i] = CommonUtils.identifyData(items[i]);
        await this._selectMenus(items[i], customer);
      }
      await I.waitForElement(TestData.getLocator('ussd.menu_message'), 30);
      // await I.seeElement(TestData.getLocator('ussd.menu_button'));
      // await I.tap(TestData.getLocator('ussd.menu_button'));
      await I.waitForElement(TestData.getLocator('ussd.ok_button'), 30);
      await I.seeElement(CommonUtils.identifyLocator('ussd.ok_button'), 30);
      let ele = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.menu_message'));
      let ele1 = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.till_menu_message'));
      if (ele != 0) TestData.setField('TextMsg', ele);
      else TestData.setField('TextMsg', ele1);
      // else if (ele1 != null) TestData.setField('TextMsg', ele1);
      await I.tap(CommonUtils.identifyLocator('ussd.ok_button'));
      await I.wait(1);
      await I.sendDeviceKeyEvent(4);
    } else {
      logger.error('commands not found');
      I.fail('Menu commands not found to select the menu');
    }
  }

  async verifyingtext(message) {
    await I.switchHelper('Appium');
    let verifyMessage = CommonUtils.identifyData(message);
    let menu = TestData.getField('TextMsg');
    let menus = menu.toString();
    let menutext = verifyMessage.split(' ');
    for (let i = 0; i < menutext.length; i++) {
      if (menus.includes(menutext[i])) {
        let verifytext = menutext.toString();
        I.report('Message ' + verifytext + ' is seen ');
        logger.info('Message ' + verifytext + ' is seen ');
        break;
      } else {
        I.fail('Message ' + verifyMessage + ' is not seen ');
      }
    }
  }

  async getMessage(sms, customer) {
    sms = CommonUtils.identifyData(sms);
    await I.switchHelper('Appium');
    await Mobile.startApp('messageapp', customer);
    await I.waitForElement(TestData.getLocator('ussd.message_search'), 30);
    await I.seeElement(TestData.getLocator('ussd.message_search'));
    await I.tap(TestData.getLocator('ussd.message_search'));
    await I.seeElement(TestData.getLocator('ussd.search_text'));
    await I.appendField(TestData.getLocator('ussd.search_text'), sms);
    await I.sendDeviceKeyEvent(66);
    await I.waitForElement(TestData.getLocator('ussd.message_title'), 30);
    await I.tap(sms);
    await I.waitForElement(TestData.getLocator('ussd.message_text'), 30);
    const messages = await I.grabTextFromAll(TestData.getLocator('ussd.message_text'));
    TestData.setField('strSMS', messages[messages.length - 1]);
    await I.switchHelper('WebDriver');
  }

  async getVoucherCode(sms, customer) {
    await this.getMessage(sms, customer);
    let strMessage = CommonUtils.identifyData('strSMS');
    // let getVoucherCode = strMessage.split('Voucher number is ')[1].toString();
    // getVoucherCode = getVoucherCode.split('.')[0].toString();
    let getVoucherCode = strMessage.toString().match('(?<=.oucher\\s?.*)\\d{9}');
    logger.info('getVoucherCode - ', getVoucherCode);
    return getVoucherCode[0];
  }

  async getReceiptNumber(sms, customer) {
    await this.checkMessage(sms, customer, CommonUtils.identifyData('USSD.Sender'));
    let strMessage = CommonUtils.identifyData('strSMS');
    // let getReceiptNumber = strMessage.split(' ')[0].toString();
    //let getReceiptNumber = strMessage.toString().match('(\\d{3}[A-Z]{8}\\d{1}[A-Z0-9]{0})'); //Commenting because the syntax of receipt number changes often
    let getReceiptNumber = strMessage.toString().match('(\\d{3}[A-Z]{3}\\d{1}[A-Z0-9]{5})');
    return getReceiptNumber[0];
  }

  async getPIN(sms, customer) {
    await this.checkMessage(sms, customer, CommonUtils.identifyData('USSD.Sender'));
    var strMessage = CommonUtils.identifyData('strSMS');
    // let index = strMessage.toString().indexOf('PIN');
    // let pin = strMessage.toString().substr(parseInt(index) + 7, 4);
    let pin = strMessage.toString().match('(?<=PIN\\s?.*\\s?)\\d+');
    return pin[0];
  }

  async selectServiceOnSTK(service, device) {
    await I.switchHelper('Appium');
    await Mobile.setStkDevice(device);
    I.wait(5);
    service = CommonUtils.identifyData(service);
    service = service.split('/');
    for (let i = 0; i < service.length; i++) {
      I.wait(2);
      await I.waitForInvisible(CommonUtils.identifyLocator('ussd.stk_progress'), 30);
      let menuItems = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.stk_menu_items'));
      if (menuItems.includes(service[i])) {
        await I.tap(service[i], CommonUtils.identifyLocator('ussd.text_view'));
      } else {
        let value = TestData.getData(device + '.' + service[i]);
        if (typeof value == 'undefined') {
          service[i] = CommonUtils.identifyData(service[i]);
        } else {
          service[i] = value;
        }
        await I.appendField(CommonUtils.identifyLocator('ussd.stk_input'), service[i]);
        await I.tap(CommonUtils.identifyLocator('ussd.stk_ok_button'));
      }
      await I.waitForInvisible(CommonUtils.identifyLocator('ussd.stk_progress'), 30);
    }
    await I.tap(CommonUtils.identifyLocator('ussd.stk_ok_button'));
    // await Assert.verifyText('SIM Menu');
    I.wait(2);
    await I.tap(CommonUtils.identifyLocator('ussd.stk_ok_button'));
    I.wait(3);
    await I.sendDeviceKeyEvent(36);
  }

  //this method is used for dialing ussd menu
  async dialUSSD(numbers, customer) {
    await I.switchHelper('Appium');
    await this._deleteMessage();
    await Mobile.startApp('dialerapp', customer);
    let menuMessage = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.menu_message'));
    let widget = await I.grabTextFromAll(CommonUtils.identifyLocator('ussd.widget_frame'));
    if (menuMessage.length !== 0 || widget.length !== 0) {
      await I.tap(TestData.getLocator('ussd.menu_button'));
    }
    await I.waitForElement(CommonUtils.identifyLocator('ussd.dialer_button'), 30);
    await I.tap(CommonUtils.identifyLocator('ussd.dialer_button'));
    await I.appendField(
      CommonUtils.identifyLocator('ussd.dialer_input'),
      CommonUtils.identifyData(numbers),
    );
    await I.tap(CommonUtils.identifyLocator('ussd.dialer_call'));
    await I.waitForElement(CommonUtils.identifyLocator('ussd.menu_input'), 30);
  }

  async closeRecentApps() {
    await I.wait(70);
    await I.sendDeviceKeyEvent(187);
    await I.wait(2);
    let task = await I.grabNumberOfVisibleElements(TestData.getLocator('ussd.dismiss_task'));
    while (task > 0) {
      await I.tap(TestData.getLocator('ussd.clear_all'));
      await I.wait(2);
      await I.sendDeviceKeyEvent(187);
      await I.wait(2);
      task = await I.grabNumberOfVisibleElements(TestData.getLocator('ussd.dismiss_task'));
    }
    await I.wait(1);
    await I.sendDeviceKeyEvent(4);
  }

  async getVoucherNumber(sms, customer, numOfDigits) {
    await this.getMessage(sms, customer);
    let strMessage = CommonUtils.identifyData('strSMS');
    // let getVoucherCode = strMessage.split('Voucher number is ')[1].toString();
    // getVoucherCode = getVoucherCode.split('.')[0].toString();
    let getVoucherCode = strMessage.toString().match('(?<=.oucher\\s?.*)\\d{' + numOfDigits + '}');
    logger.info('getVoucherCode - ', getVoucherCode);
    return getVoucherCode[0];
  }

  // This method is created by Jaivikram. It updates the required field in the required json file
  /*This method is updated to only change or update the value of specific json file */
  async addOrUpdateJsonFile(key, value, jsonFile) {
    let jsonDataObject = null,
      jsonDataString = null;
    if (
      key == 'Handset.RegisteredCustomer.PIN' ||
      key == 'Handset.RegisteredCustomerTwo' ||
      key == 'Handset.RegisteredCustomerThree.PIN'
    ) {
      //Determine the location of json file
      const fs = require('fs');
      fs.readFile(
        './environments/lso/uat/gptc/' + jsonFile + '.json',
        'utf8',
        (err, jsonString) => {
          if (err) {
            console.log('File read failed:', err);
            return;
          }
          try {
            //parse the string, update the respective value, again converted into string and overwriiten in the same json file
            jsonDataObject = JSON.parse(jsonString);
            jsonDataObject.Handset.RegisteredCustomerThree.PIN = JSON.stringify(
              TestData.getField(value),
            );
            jsonDataString = JSON.stringify(jsonDataObject);
            fs.writeFile(
              './environments/lso/uat/gptc/' + jsonFile + '.json',
              jsonDataString,
              (err) => {
                if (err) {
                  console.log('Error writing file', err);
                } else {
                  console.log('Successfully updated the ' + jsonFile + '.json file');
                }
              },
            );
          } catch (err) {
            console.log('Error parsing JSON string:', err);
          }
        },
      );
    }
  }

  /*This Method is created by SHLOK PANDEY, 
  It is a dynamic method and can be used anywhere the eariler method is not dynamic and required a lot of changes so i have created this method!
  This method can be used to modify the json file directly from the gherkin code itself
  The variable Folderlocation species the exact folder Location of the variable to be stored or changed !
  */
  async appendAFileLocation(key, value, jsonFile, FolderLocation) {
    let jsonDataObject = null,
      jsonDataString;
    if (key !== undefined) {
      var FolderLocation = CommonUtils.identifyData(FolderLocation);
      //Determine the location of json file
      const fs = require('fs');
      fs.readFile(FolderLocation + jsonFile + '.json', 'utf8', (err, jsonString) => {
        if (err) {
          console.log('File read failed:', err);
          return;
        }
        try {
          //Parse the string and update the respective value
          jsonDataObject = JSON.parse(jsonString);
          const propertyNames = key.split('.');
          let currentObject = jsonDataObject;
          for (let i = 0; i < propertyNames.length - 1; i++) {
            currentObject = currentObject[propertyNames[i]];
          }
          currentObject[propertyNames[propertyNames.length - 1]] = TestData.getField(value);
          jsonDataString = JSON.stringify(jsonDataObject);
          //jsonDataString = jsonDataString.replace(new RegExp(TestData.getField(value), 'g'), '"' + TestData.getField(value) + '"');
          // Convert the updated object to JSON string and overwrite the file
          fs.writeFile(FolderLocation + jsonFile + '.json', jsonDataString, (err) => {
            if (err) {
              console.log('Error writing file', err);
            } else {
              console.log('Successfully updated the ' + jsonFile + '.json file');
            }
          });
        } catch (err) {
          console.log('Error parsing JSON string:', err);
        }
      });
    }
  }

  async checkMenuNotAvailable(menuname) {
    await I.waitForElement(TestData.getLocator('ussd.menu_input'), 30);
    let menus = await I.grabTextFromAll(TestData.getLocator('ussd.menu_message'));
    logger.info('Menu Items are', menus);
    if (menus.includes(menuname) == false) {
      I.report('The ' + menuname + ' is not available');
    } else {
      I.fail('The ' + menuname + ' is available');
    }
  }
}
module.exports = new G2Ussd();
module.exports.G2Ussd = G2Ussd;
