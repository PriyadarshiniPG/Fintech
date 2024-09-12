let { I, CreateTopOrgPage } = inject();

/* eslint-disable no-undef */
Then(
  /^I check "([^"]*)" value of "([^"]*)" column of table "([^"]*)"$/,
  async (productName, columnName, tableName) => {
    await CreateTopOrgPage.selectProduct(productName, columnName, tableName);
    I.report('Selected product ' + productName + ' from table ' + tableName);
  },
);

Then(/^I select region "([^"]*)"$/, async (regionName) => {
  await CreateTopOrgPage.selectRegion(regionName);
  I.report('Selected region ' + regionName);
});

Then(
  /^I enter "([^"]*)" as "([^"]*)" of table "([^"]*)"$/,
  async (columnName, value, tableName) => {
    await CreateTopOrgPage.enterValueOnTable(columnName, value, tableName);
    I.report('Entered ' + value + ' for ' + columnName + ' in table ' + tableName);
  },
);

Then(
  /^I select drop down "([^"]*)" as "([^"]*)" of table "([^"]*)"$/,
  async (columnName, value, tableName) => {
    await CreateTopOrgPage.selectValueOnTable(columnName, value, tableName);
    I.report(
      'Selected drop down ' + columnName + 'with value ' + value + ' inside table ' + tableName,
    );
  },
);

When(/^I navigate to Create All ID -> "([^"]*)" page$/, async (table) => {
  await CreateTopOrgPage.navigateToCreateAllIdPage(table);
  I.report('Successfully navigated from Create All Id page');
});

Then(/^I create top organization with below details$/, async (table) => {
  await CreateTopOrgPage.createTopOrg(table);
  I.report('Successfully created top organization');
});

Then(/^I create child organization with below details$/, async (table) => {
  await CreateTopOrgPage.createChildOrg(table);
  I.report('Successfully created child organization');
});

Then(/^I create customer with below details$/, async (table) => {
  await CreateTopOrgPage.createCustomer(table);
  I.report('Successfully created customer');
});

Then(/^I create Till with below details$/, async (table) => {
  await CreateTopOrgPage.createTill(table);
  I.report('Successfully created Till');
});

Given(
  /^I create "([^"]*)" child organizations from testdata creation data file$/,
  async (shortCode) => {
    await CreateTopOrgPage.createChildOrgsForTestDataCreation(shortCode);
  },
);

Given(
  /^I create "([^"]*)" top organisation from testdata creation data file$/,
  async (shortCode) => {
    await CreateTopOrgPage.createTopOrgFromTestDataCreationFile(shortCode);
  },
);

Then(/^I select the option "([^"]*)" in the product list$/, async (productOption) => {
  await CreateTopOrgPage.selectProduct(
    productOption,
    'Product Name',
    'createtoporgpage.Product_Table',
  );
  I.report('Successfully selected option - ' + productOption);
});
