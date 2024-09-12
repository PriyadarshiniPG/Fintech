@FINLSO_GP_REG2case

Feature: Fintech2.0 Gptc Regression Test case

@TC_FINLSO_REG2_BankAccountviaChildOrganization_EnsureDeleteBankAccount!
#Unable to access the table
Scenario:Bank Account via Child Organization_Ensure Delete Bank Account
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCodeChild"
  Then I click on "Search" button in cite
  Then I click on "GenericLocators.DetailInOrgPortal"
  Then I Switch tab
  Then I wait "50"
  Then I click on "GenericLocators.BankAccount"
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.BankHODropdownSP"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I click on "GenericLocators.AssetTypeSP"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccNo"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Remove"
  Then I enter text area "Reason" with value "Reason Description"
  Then I click on "Confirm" button in cite
  Then I click on the "Removed Account" tab
  Then I wait "10"
  #Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on " Detail " of "Operation" column
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I report "Child Org Can Delete bank account"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG2_BankAccountviaChildOrganization_EnsureCreateBankAccount!
#Unable to access the table
Scenario:Bank Account via Child Organization_Ensure Create Bank Account
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCodeChild"
  Then I click on "Search" button in cite
  #Then I check table "Table.BankAccountCreated" with multiple values as "ShortCode.NewChlidOrg" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.DetailInOrgPortal"
  Then I Switch tab
  Then I wait "50"
  Then I click on "GenericLocators.BankAccount"
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.BankHODropdownSP"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I click on "GenericLocators.AssetTypeSP"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccNo"
  Then I click on "Submit" button in cite
  Then I wait "10"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I report "Child Org Can create bank account "
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG2_BankAccountMyOrganizationViewRemoveAccountDetail!
Scenario:Bank Account via My Organization_Ensure View Remove Account Detail
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCodeChild"
  Then I click on "Search" button in cite
  Then I click on "GenericLocators.DetailInOrgPortal"
  Then I Switch tab
  Then I wait "50"
  Then I click on "GenericLocators.BankAccount"
  Then I click on the "Removed Account" tab
  Then I wait "10"
  #Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on " Detail " of "Operation" column
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I report "Organization operator can set default account via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG2_ServiceProviderBankAccount_EnsureDeleteBankAccount!
Scenario:Service Provider Bank Account_Ensure Delete Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Service Provider" in the "Home" Page
  Then I click on "GenericLocators.BankAcc"
  Then I click on left child menu "Bank Account" in the "Home" Page
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.BankHODropdownSP"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I click on "GenericLocators.AssetTypeSP"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "Bussiness Account"
  Then I enter text in "Label.AccountNumber" with value "AccountNumber"
  Then I click on " Submit " button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewInBank"
  Then I click on "Search" button in cite
  Then I click on the "Active Account" tab
  Then I check table "Table.OrganizationOperator" with multiple values as "Asset Type" and click on "Remove" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitRemoveBan"
  Then I report " The bank account is successfully removed and can be viewed on the removed account tab page"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_BankAccountMyOrganizationSetDefaultBankAccount!
Scenario:Bank Account via My Organization _Ensure Set Default Bank Account
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCodeChild"
  Then I click on "Search" button in cite
  Then I click on "GenericLocators.DetailInOrgPortal"
  Then I Switch tab
  Then I wait "50"
  Then I click on "GenericLocators.BankAccount"
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.BankHODropdownSP"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I click on "GenericLocators.AssetTypeSP"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccNo"
  Then I click on "Submit" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "More" of "Operation" column
  Then I click on "GenericLocators.SetDefault"
  Then I click on "GenericLocators.ConfirmException"
  When static text "Success to set default account." is visible
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser
  Then I report "Organization operator can set default account via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG2_BankAccountviaOrganizationCreateBankAccount!
Scenario:Bank Account via Organization_ Ensure Create Bank Account
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I click on "Search" button in cite
  Then I click on "GenericLocators.DetailInOrgPortal"
  Then I Switch tab
  Then I click on "GenericLocators.BankAccount"
  Then I wait "10"
  Then I click on "Add" button in cite
  Then I select drop down "GenericLocators.BankHODropdownSP" with the "DropDown.StandardLesothoBank"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I click on "GenericLocators.AssetTypeSP"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccNo"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Remove"
  Then I enter text area "Reason" with value "Reason Description"
  Then I click on "Confirm" button in cite
  Then I click on the "Removed Account" tab
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on " Detail " of "Operation" column
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I report "Organization operator can set default account via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG2_ServiceProviderBankAccount_EnsureViewRemoveAccountDetail!
Scenario:Service Provider Bank Account_Ensure View Remove Account Detail
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Service Provider" in the "Home" Page
  Then I click on "GenericLocators.BankAcc"
  Then I click on left child menu "Bank Account" in the "Home" Page
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.BankHODropdownSP"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I click on "GenericLocators.AssetTypeSP"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "Bussiness Account"
  Then I enter text in "Label.AccountNumber" with value "AccountNumber"
  Then I click on " Submit " button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewInBank"
  Then I click on "Search" button in cite
  Then I click on the "Active Account" tab
  Then I check table "Table.OrganizationOperator" with multiple values as "Asset Type" and click on "Remove" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitRemoveBan"
  Then I click on the "Removed Account" tab
  Then I switch to next frame
  Then I report "The Bank Account menu displays normally."
  Then I click on "Home" on button in top menu
  Then I report "The details of the deleted bank account are correct."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_LoginOrganizationPortalCreateBankAccountviaOrganization_EnsureDeleteBankAccount!
Scenario:Bank Account via Organization _Ensure Delete Bank Account
  Given I login to Fintech as "org" operator
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Add" button in cite
  Then I select drop down "Bank Head Office" with option "DropDown.StandardLesothoBank"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.FintechTest"
  Then I select drop down "Asset Type" with option "DropDown.DepositAccount"
  Then I select drop down "Currency" with option "DropDown.LSL"
  Then I enter text in "Account Name" with value "AccountName"
  Then I enter text in "Account Number" with value "AccNo"
  Then I click on "Confirm" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Remove" of "Operation" column
  Then I enter text area "Reason" with value "Reason Description"
  Then I click on "Confirm" button in cite
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG2_LoginOrganizationPortalCreateBankAccountviaOrganization_EnsureSetDefaultBankAccount!
Scenario:Bank Account via Organization_Ensure Set Default Bank Account
  Given I login to Fintech as "org" operator
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Add" button in cite
  Then I select drop down "Bank Head Office" with option "DropDown.StandardLesothoBank"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.FintechTest"
  Then I select drop down "Asset Type" with option "DropDown.DepositAccount"
  Then I select drop down "Currency" with option "DropDown.LSL"
  Then I enter text in "Account Name" with value "AccountName"
  Then I enter text in "Account Number" with value "AccNo"
  Then I click on "Confirm" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Set Default" of "Operation" column
  Then I click on "GenericLocators.SubmitButtonInSetDefault"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG2_BankAccountOrganizationQuery!
Scenario:Bank Account via Organization_ Ensure Query Bank Account
  Given I login to Fintech as "org" operator
  Given I generate name "AccountName" with value "Test3165"
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.NewOrg2"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountCreated" with multiple values as "ShortCode.NewOrg2" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I click on "GenericLocators.BankAccount"
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.Closebutton"
  Then I report "Organization operator can Query the Bank account via organization"
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG2_OrganizationBankAccountDeleteBankAccount!
Scenario:Organization Bank Account_Ensure Delete Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue            | Status        |
  | Table.Organization | ShortCode.NewShortCode | Label.Organization Short Code | ShortCode.NewShortCode | Status.Active |
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I click on "Add" button in cite
  #Creating a new bank account to delete for testing purpose
  Then I click on "GenericLocators.BankHODropdownSP"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I click on "GenericLocators.AssetTypeSP"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccountNumber"
  Then I click on "Submit" button in cite
  #Removing the newly created bank account for testing purpose
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Remove" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitRemoveBan"
  When static text "Success to delete." is visible
  Then I click on the "Removed Account" tab
  Then I wait "4"
  Then I report "SP operator can delete Organization Bank Account via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ChildOrgBankAccEnsureCreateBankAccount!
Scenario: Child Organization Bank Account - Ensure Create Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "Child_RAND_4"
  Given I generate name "PostalAdd" with value "Semonkong"
  Given I generate name "PhyAdd" with value "Semonkong"
  Given I generate name "City" with value "City"
  Given I generate name "PhoneNo" with value "RAND_10"
  Given I generate name "Postal" with value "RAND_6"
  Given I generate name "Email" with value "abc@123"
  Given I generate name "NationalId" with value "RAND_6"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Child Organization "
  Then I Add product in the organization as "Super Agent"
  Then I enter text in "Label.Organizationname" with value "OrgName"
  Then I scroll "GenericLocators.ScrollKYcInfo" to view using "false" parameter
  Then I click on "GenericLocators.Region"
  Then I click on "GenericLocators.SemonRegTopOrg"
  Then I click on "GenericLocators.ConfirmBtn"
  Then I enter text in "Label.PostalAddress" with value "PostalAdd"
  Then I enter text in "Label.PhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.OfficePhoneNumber" with value "PhoneNo"
  Then I enter text in "Label.CityorTownInorgpage" with value "City"
  Then I select drop down "Organisation Category Code" with option "DropDown.Veterinaryservices"
  Then I select drop down "Type of Business" with option "DropDown.PublicListedCompany"
  Then I scroll "GenericLocators.ScrollDetail" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "PhoneNo"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I enter text in "Label.ContactPhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.ContactAddress2" with value "PhyAdd"
  Then I enter text in "Label.ContactPostCode" with value "Postal"
  Then I enter text in "Label.ContactCityorTown" with value "City"
  Then I scroll "GenericLocators.ScrollOrganizationContact" to view using "false" parameter
  Then I switch to next frame
  Then I click on "GenericLocators.ContactType"
  Then I click on "GenericLocators.OwnerContact"
  Then I enter text for "GenericLocators.TopOrgContactFirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactSurName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactPhNo" with value "PhoneNo"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.TopOrgContactIdNo" with value "NationalId"
  Then I click on "GenericLocators.ContactIdType"
  Then I click on "GenericLocators.NationalId"
  Then I switch to current window
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I scroll "GenericLocators.ScrollHierarchy" to view using "false" parameter
  Then I select drop down "Sub Agent Expansion Model" with option "DropDown.Aggregator"
  Then I click on " Add Account " button in cite
  Then I click on "GenericLocators.BankHODropdown"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I select drop down "Asset Type" with option "DropDown.DepositAccount"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.ChildOrgAccountName" with value "AccountName"
  Then I enter text for "GenericLocators.ChildOrgAccountNumber" with value "AccNo"
  Then I click on "Submit" button in cite
  Then I scroll "GenericLocators.ScrollCommissionSettlement" to view using "false" parameter
  Then I click on "GenericLocators.CommissionSettlementConfiguration"
  Then I click on "GenericLocators.DefaultSettingTemp"
  Then I wait "5"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.SubmitBtn"
  Then I click on "GenericLocators.ViewDetailsChild"
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewInBank"
  Then I report "The Child Organization can Create Bank Account via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_TopOrgBankAccEnsureDelBankAccount!
Scenario: Top Organization Bank Account - Ensure Delete Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "Child_RAND_4"
  Given I generate name "PostalAdd" with value "Semonkong"
  Given I generate name "PhyAdd" with value "Semonkong"
  Given I generate name "City" with value "City"
  Given I generate name "PhoneNo" with value "RAND_10"
  Given I generate name "Postal" with value "RAND_6"
  Given I generate name "Email" with value "abc@123"
  Given I generate name "NationalId" with value "RAND_6"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I Add product in the organization as "Super Agent"
  Then I enter text in "Label.Organizationname" with value "OrgName"
  Then I scroll "GenericLocators.ScrollKYcInfo" to view using "false" parameter
  Then I click on "GenericLocators.Region"
  Then I click on "GenericLocators.SemonRegTopOrg"
  Then I click on "GenericLocators.ConfirmBtn"
  Then I enter text in "Label.PostalAddress" with value "PostalAdd"
  Then I enter text in "Label.PhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.OfficePhoneNumber" with value "PhoneNo"
  Then I enter text in "Label.CityorTownInorgpage" with value "City"
  Then I select drop down "Organisation Category Code" with option "DropDown.Veterinaryservices"
  Then I select drop down "Type of Business" with option "DropDown.PublicListedCompany"
  Then I scroll "GenericLocators.ScrollDetail" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "PhoneNo"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I enter text in "Label.ContactPhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.ContactAddress2" with value "PhyAdd"
  Then I enter text in "Label.ContactPostCode" with value "Postal"
  Then I enter text in "Label.ContactCityorTown" with value "City"
  Then I scroll "GenericLocators.ScrollOrganizationContact" to view using "false" parameter
  Then I switch to next frame
  Then I click on "GenericLocators.ContactType"
  Then I click on "GenericLocators.OwnerContact"
  Then I enter text for "GenericLocators.TopOrgContactFirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactSurName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactPhNo" with value "PhoneNo"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.TopOrgContactIdNo" with value "NationalId"
  Then I click on "GenericLocators.ContactIdType"
  Then I click on "GenericLocators.NationalId"
  Then I switch to current window
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I scroll "GenericLocators.ScrollHierarchy" to view using "false" parameter
  Then I select drop down "Sub Agent Expansion Model" with option "DropDown.Aggregator"
  Then I click on " Add Account " button in cite
  Then I click on "GenericLocators.BankHODropdown"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I select drop down "Asset Type" with option "DropDown.DepositAccount"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.ChildOrgAccountName" with value "AccountName"
  Then I enter text for "GenericLocators.ChildOrgAccountNumber" with value "AccNo"
  Then I click on "Submit" button in cite
  Then I scroll "GenericLocators.ScrollCommissionSettlement" to view using "false" parameter
  Then I click on "GenericLocators.CommissionSettlementConfiguration"
  Then I click on "GenericLocators.DefaultSettingTemp"
  Then I wait "5"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.SubmitBtn"
  Then I click on "GenericLocators.ViewDetailsChild"
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Remove" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitRemoveBan"
  Then I report "The Bank Account can be deleted in Top Organization"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_TopOrganizationBankAccountCreateBankAccount!
Scenario:Top Organization Bank Account_Ensure Create Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "Child_RAND_4"
  Given I generate name "PostalAdd" with value "Semonkong"
  Given I generate name "PhyAdd" with value "Semonkong"
  Given I generate name "City" with value "City"
  Given I generate name "PhoneNo" with value "RAND_10"
  Given I generate name "Postal" with value "RAND_6"
  Given I generate name "Email" with value "abc@123"
  Given I generate name "NationalId" with value "RAND_6"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I Add product in the organization as "Super Agent"
  Then I enter text in "Label.Organizationname" with value "OrgName"
  Then I scroll "GenericLocators.ScrollKYcInfo" to view using "false" parameter
  Then I click on "GenericLocators.Region"
  Then I click on "GenericLocators.SemonRegTopOrg"
  Then I click on "GenericLocators.ConfirmBtn"
  Then I enter text in "Label.PostalAddress" with value "PostalAdd"
  Then I enter text in "Label.PhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.OfficePhoneNumber" with value "PhoneNo"
  Then I enter text in "Label.CityorTownInorgpage" with value "City"
  Then I select drop down "Organisation Category Code" with option "DropDown.Veterinaryservices"
  Then I select drop down "Type of Business" with option "DropDown.PublicListedCompany"
  Then I scroll "GenericLocators.ScrollDetail" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "PhoneNo"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I enter text in "Label.ContactPhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.ContactAddress2" with value "PhyAdd"
  Then I enter text in "Label.ContactPostCode" with value "Postal"
  Then I enter text in "Label.ContactCityorTown" with value "City"
  Then I scroll "GenericLocators.ScrollOrganizationContact" to view using "false" parameter
  Then I switch to next frame
  Then I click on "GenericLocators.ContactType"
  Then I click on "GenericLocators.OwnerContact"
  Then I enter text for "GenericLocators.TopOrgContactFirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactSurName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactPhNo" with value "PhoneNo"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.TopOrgContactIdNo" with value "NationalId"
  Then I click on "GenericLocators.ContactIdType"
  Then I click on "GenericLocators.NationalId"
  Then I switch to current window
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I scroll "GenericLocators.ScrollHierarchy" to view using "false" parameter
  Then I select drop down "Sub Agent Expansion Model" with option "DropDown.Aggregator"
  Then I click on " Add Account " button in cite
  Then I click on "GenericLocators.BankHODropdown"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I select drop down "Asset Type" with option "DropDown.DepositAccount"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.ChildOrgAccountName" with value "AccountName"
  Then I enter text for "GenericLocators.ChildOrgAccountNumber" with value "AccNo"
  Then I click on "Submit" button in cite
  Then I scroll "GenericLocators.ScrollCommissionSettlement" to view using "false" parameter
  Then I click on "GenericLocators.CommissionSettlementConfiguration"
  Then I click on "GenericLocators.DefaultSettingTemp"
  Then I wait "5"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.SubmitBtn"
  Then I click on "GenericLocators.ViewDetailsChild"
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewInBank"
  Then I report "Top Organization Bank Account_Ensure Create Bank Account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_OrganizationBankAccountSetDefaultBankAccount!
Scenario:Organization Bank Account_ Ensure Set Default Bank Account
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue            | Status        |
  | Table.Organization | ShortCode.NewShortCode | Label.Organization Short Code | ShortCode.NewShortCode | Status.Active |
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "More" of "Operation" column
  Then I click on "GenericLocators.SetDefault"
  Then I click on "GenericLocators.SubmitRemoveBan"
  When static text "Success to set default account." is visible
  Then I report "Organization Bank Account Set to Default"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_OrganizationBankAccountQueryBankAccount!
Scenario: Organization Bank Account_Ensure Query Bank Account
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue            | Status        |
  | Table.Organization | ShortCode.NewShortCode | Label.Organization Short Code | ShortCode.NewShortCode | Status.Active |
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I select the "bankHeadOffice" click on the "Standard Lesotho Bank"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailofTopOrg"
  Then I report "Organization Bank Account Ensure Query Bank Account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_OrganizationBank_EnsureCreateBankAccount!
Scenario:Top Organization Bank Account_Ensure Create Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "Child_RAND_4"
  Given I generate name "PostalAdd" with value "Semonkong"
  Given I generate name "PhyAdd" with value "Semonkong"
  Given I generate name "City" with value "City"
  Given I generate name "PhoneNo" with value "RAND_10"
  Given I generate name "Postal" with value "RAND_6"
  Given I generate name "Email" with value "abc@123"
  Given I generate name "NationalId" with value "RAND_6"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I Add product in the organization as "Super Agent"
  Then I enter text in "Label.Organizationname" with value "OrgName"
  Then I scroll "GenericLocators.ScrollKYcInfo" to view using "false" parameter
  Then I click on "GenericLocators.Region"
  Then I click on "GenericLocators.SemonRegTopOrg"
  Then I click on "GenericLocators.ConfirmBtn"
  Then I enter text in "Label.PostalAddress" with value "PostalAdd"
  Then I enter text in "Label.PhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.OfficePhoneNumber" with value "PhoneNo"
  Then I enter text in "Label.CityorTownInorgpage" with value "City"
  Then I select drop down "Organisation Category Code" with option "DropDown.Veterinaryservices"
  Then I select drop down "Type of Business" with option "DropDown.PublicListedCompany"
  Then I scroll "GenericLocators.ScrollDetail" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "PhoneNo"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I enter text in "Label.ContactPhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.ContactAddress2" with value "PhyAdd"
  Then I enter text in "Label.ContactPostCode" with value "Postal"
  Then I enter text in "Label.ContactCityorTown" with value "City"
  Then I scroll "GenericLocators.ScrollOrganizationContact" to view using "false" parameter
  Then I switch to next frame
  Then I click on "GenericLocators.ContactType"
  Then I click on "GenericLocators.OwnerContact"
  Then I enter text for "GenericLocators.TopOrgContactFirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactSurName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactPhNo" with value "PhoneNo"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.TopOrgContactIdNo" with value "NationalId"
  Then I click on "GenericLocators.ContactIdType"
  Then I click on "GenericLocators.NationalId"
  Then I switch to current window
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I scroll "GenericLocators.ScrollHierarchy" to view using "false" parameter
  Then I select drop down "Sub Agent Expansion Model" with option "DropDown.Aggregator"
  Then I click on " Add Account " button in cite
  Then I click on "GenericLocators.BankHODropdown"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I select drop down "Asset Type" with option "DropDown.DepositAccount"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.ChildOrgAccountName" with value "AccountName"
  Then I enter text for "GenericLocators.ChildOrgAccountNumber" with value "AccNo"
  Then I click on "Submit" button in cite
  Then I scroll "GenericLocators.ScrollCommissionSettlement" to view using "false" parameter
  Then I click on "GenericLocators.CommissionSettlementConfiguration"
  Then I click on "GenericLocators.DefaultSettingTemp"
  Then I wait "5"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.SubmitBtn"
  Then I click on "GenericLocators.ViewDetailsChild"
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewInBank"
  Then I report "Top Organization Bank Account_Ensure Create Bank Account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ServiceProviderBankAccount_EnsureQueryBankAccount!
Scenario:Service Provider Bank Account_Ensure Query Bank Account
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Service Provider" in the "Home" Page
  Then I click on "GenericLocators.BankAcc"
  Then I click on left child menu "Bank Account" in the "Home" Page
  Then I select the "bankHeadOffice" click on the "Standard Lesotho Bank"
  Then I click on "Search" button in cite
  Then I click on the "Active Account" tab
  Then I check table "Table.OrganizationOperator" with multiple values as "Asset Type" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailofTopOrg"
  Then I report "The Bank Account menu displays normally."
  Then I report "The operation options are available in the result column to query other details about the bank account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureServiceProviderCreateBankAccount!
Scenario:Service Provider Bank Account_ Ensure Create Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Service Provider" in the "Home" Page
  Then I click on "GenericLocators.BankAcc"
  Then I click on left child menu "Bank Account" in the "Home" Page
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.BankHODropdownSP"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.Bank"
  Then I click on "GenericLocators.AssetTypeSP"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "Bussiness Account"
  Then I enter text in "Label.AccountNumber" with value "AccountNumber"
  Then I click on " Submit " button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewInBank"
  Then I report "SP operator can Create Bank Account via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCanResetOrgOpPINwhenOrgOpPinIsLocked!
Scenario: Resetting Organization Operator PIN - Ensure SP Operator can able reset Organization Operator PIN when Org Operator Pin is in locked status
  Given I login to Fintech as "sp" operator
  Given I generate name "Newpin" with value "Testrest"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.MpatOrg"
  Then I select drop down "Status" with option "Active"
  Then I click on "Search" button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "ShortCode.MpatOrg|Active" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.OperatorButtonForOrgOp"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Newpin" in the popup dialog window
  Then I click on "GenericLocators.SubmitResetForOrgOp"
  When static text "Reset PIN SUCCESS" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCanResetOrgOperatorPINViaWeb!
Scenario:Resetting Organization Operator PIN - Ensure SP Operator can reset Organization Operator PIN via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "Newpin" with value "Testrest"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I select drop down "Status" with option "Active"
  Then I enter text in "Label.User Name" with value "Prak"
  Then I click on "Search" button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "ShortCode.ShortCode1|Active" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.OperatorButtonForOrgOp"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Newpin" in the popup dialog window
  Then I click on "GenericLocators.SubmitReset11"
  Then I click on "GenericLocators.ConfirmException"
  Then I logout the "sp" portal and close the browser
  #Approve
  Then I wait "10"
  Given I login to Fintech as "sp_generic" operator
  When MakerChecker is on "Approve" task from group task for "Approve 'Reset Organization Operator PIN'"
  When static text "Submitted Successfully" is visible
  Then I report "Operator PIN RESET successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCanResetThePinwhenCustomerPinIsInLockedStatus!
Scenario:Resetting Customer PIN - Ensure SP Operator can able to reset the pin when Customer Pin is in locked status
  Given I login to Fintech as "sp" operator
  Given I generate name "Newpin" with value "Pinreset"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnCustomer" with value "Customer.Registered_Customer_Two"
  Then I click on a "Search"
  Then I check table "Table.CustomerInIdentity" with multiple values as "Customer.Registered_Customer_Two" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Newpin" in the popup dialog window
  Then I click on "GenericLocators.SubmitResetForCustomer"
  When static text "Reset PIN SUCCESS" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCanResetPinWhenCustomersIdentityStatusIsInActive!
Scenario:Resetting Customer PIN - Ensure SP Operator can able to reset the pin when Customer's Identity Status is inactive
  Given I login to Fintech as "sp" operator
  Given I generate name "Newpin" with value "Infrozenstate"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnCustomer" with value "Customer.Registered_Customer_Pending"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInIdentity" with multiple values as "Customer.Registered_Customer_Pending" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Newpin" in the popup dialog window
  Then I click on "GenericLocators.SubmitReset6"
  When static text "Reset PIN SUCCESS!" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCanResetCustomerPINByViaWeb!
Scenario:Resetting Customer PIN - Ensure SP Operator can Reset Customer PIN By via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "Newpin" with value "Resettingpin"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnCustomer" with value "Customer.Registered_Customer_Fourt"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInIdentity" with multiple values as "Customer.Registered_Customer_Fourt" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Newpin" in the popup dialog window
  Then I click on "GenericLocators.SubmitReset6"
  When static text "Reset PIN SUCCESS!" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_AttemptCallFailSuspendCustomer!
Scenario: Customer Service - Attempt Take a Call Failed Suspened Customer when customer fails to answer questions for X times, the system sets the customer status to Customer Care Suspended
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "User Service" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "Customer.Registered_Customer_thir"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "Customer.Registered_Customer_thir|Active" and click on "Detail" of "Operation" column
  When static text "Verify Customer" is visible
  Then I wait "5"
  Then I click on Generic "Fail"
  Then I click on "Submit" button in cite
  Then I report "Attempt Take a Call Failed Suspened Customer when customer fails to answer questions for X times, the system sets the customer status to Customer Care Suspended"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureSpTakeCallByMsisdn!
Scenario: Customer Care Service - Ensure SP operator can take Customer Take Call Search by MSISDN
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "User Service" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "Customer.Registered_Customer_Nine"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "Customer.Registered_Customer_Nine" and click on "Detail" of "Operation" column
  When static text "Verify Customer" is visible
  Then I wait "5"
  Then I click on Generic "Pass"
  Then I click on "Submit" button in cite
  When static text "Customer.Registered_Customer_Nine" is visible
  Then I report "The SP operator can take Customer Call Search by MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureSpCanViewTillViaWeb!
Scenario: Ensure SP operator can view till info via web
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                | Status                |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber | Status.Pending Active |
  Then I report "The SP operator can view till info via web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SpOperatorCantCreatetillIfMSISDNisoutofrange!
Scenario:Attempt SP operator can't be create till if till MSISDN is out of range
  Given I login to Fintech as "sp" operator
  Given I generate name "TillNumber" with value "ABC1234"
  Given I generate name "MSISDN" with value "8613300002001_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Till "
  Then I enter text in "Label.Organization Short Code" with value "Till.MpatOrgOne.ShortCode"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I select drop down "Language" with option "DropDown.English"
  Then I scroll "GenericLocators.AvailableProduct" to view using "false" parameter
  Then I wait "5"
  Then I click on "GenericLocators.AvailableProductCheckbox"
  Then I click on "GenericLocators.AvailableProductArrow"
  Then I click on "Submit" button in cite
  Then I check error text "msisdn is not in msisdn range" is displayed
  Then I report "The SP operator can't create till if MSISDN is out of range"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_AttemptspoperatorcantbecreatetillIftillMSISDNisAlreadyUsedbyanotherTill!
Scenario: Attempt sp operator can't be create till. If till MSISDN is Already Used by another Till
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "OrgOperator.MSISDN_3"
  Then I click on "GenericLocators.TillAutogeneratecode"
  Then I wait "4"
  When static text "msisdn has been used" is visible
  Then I report "The till MSISDN is Already Used by another Till unable to Create Till via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPNotAllowCreateTillMSISDNAlreadyUsedByOrgOperator!
Scenario: Attempt SP operator not allow to create till if till MSISDN already used by Organization Operator
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I enter text in "Label.MSISDN" with value "OrgOperator.MSISDN_2"
  Then I enter text in "Label.Till Number" with value "OrgOperator.Till"
  When static text "msisdn has been used" is visible
  Then I report "The SP operator not allow to create till if till MSISDN already used by Organization Operator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorCanUseTillMSISDNWhichisAlreadyUsedByCustomer!
Scenario:Ensure SP operator can use Till MSISDN which is already used by Customer
  Given I login to Fintech as "sp" operator
  Given I generate name "TillNumber" with value "RAND_8"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "Till.MpatOrgOne.ShortCode"
  Then I enter text in "Label.MSISDN" with value "Customer.Registered_Customer_Ten"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I enter text in "Label.Till Number" with value "TillNumber"
  Then I select drop down "Language" with option "DropDown.English"
  When static text "msisdn has been used" is visible
  Then I report "The SP operator can use Till MSISDN which is already used by Customer"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorCanAbleToCreateTillViaWeb!
Scenario:Ensure SP Operator can able to Create Till via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "Till.MpatOrgOne.ShortCode"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I select drop down "Language" with option "DropDown.English"
  Then I scroll "GenericLocators.SelectedProduct" to view using "false" parameter
  Then I click on "GenericLocators.AvaliableProduct"
  Then I click on "GenericLocators.ArrowRightButton"
  Then I click on "Submit" button in cite
  Then I report "The SP Operator can able to Create Till via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPShouldNotSeeUnlockPinWhenCustomerPinIsNormal!
#Pending
Scenario:Unlocking Customer PIN - Attempt The SP operator should not see the unlock pin button when The customer's PIN is normal
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "186000530_RAND_2"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I click on "+ Add Basic Product " button in cite
  Then I click on "GenericLocators.Test33Product" radio
  Then I click on "GenericLocators.OkButtonForAddBasicProduct" radio in dialog window
  # Then I click on "GenericLocators.OkButtonForAddBasicProduct"
  Then I scroll "GenericLocators.ScrollCustIdentity" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "CustomerMSISDN"
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text in "Date of Birth" with value "DateOfBirth"
  Then I click on "Male" radio
  Then I click on "Next" button in cite
  Then I click on "+ Add Product" button in cite
  Then I click on "AddProduct.P2PTransfer" checkbox in dialog window
  Then I click on "GenericLocators.OkButtonForAddBasicProduct"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  When static text "Create completed, please waiting for approving." is visible
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "CustomerMSISDN"
  Then I click on a "Search"
  Then I check table "Table.CustomerInIdentity" with multiple values as "CustomerMSISDN" and click on "Detail" of "Operation" column
  Then I report "NO button to unlock PIN."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCantakeOrgOperatorCallSearchbyOperatorID!
Scenario:Customer Service - Ensure SP Operator can take Organization Operator Call Search by Operator ID
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "User Service" in the "Home" Page
  Then I click on "GenericLocators.Customerbtn"
  Then I click on "GenericLocators.Organizationoperator"
  Then I enter text in "Label.Organization Short Code" with value "MpatOrg.ShortCode"
  Then I enter text in "Label.Operator ID" with value "MpatOrg.OperatorID"
  Then I click on a "Search"
  Then I check table "Table.OrganizationOperator" with multiple values as "MpatOrg.OperatorID" and click on "Detail" of "Operation" column
  Then I enter text in "Label.Secret Word" with value "MpatOrg.SecretWord"
  Then I enter text in "Label.Balance of Default Account" with value "MpatOrg.BalanceOfDefaultAccount"
  Then I select drop down "Verify Account" with option "DropDown.Organization Wallet Working Account"
  Then I click on "Submit" button in cite
  Then I report "Page prompt verify Success"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureSpCantCreateTillIfNumOutOfRange!
Scenario: till if till number out of range
  Given I login to Fintech as "sp" operator
  Given I generate name "TillNumber" with value "RAND_15"
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "Till.MpatOrgOne.ShortCode"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I enter text in "Label.Till Number" with value "TillNumber"
  Then I select drop down "Language" with option "DropDown.English"
  Then I check error text "The characters do not comply with the rule. The regular expression is '^([0-9A-Za-z]{4,12})$'." is displayed
  Then I report "The SP operator can't create till if till number is out of range"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorIsAbleToArchiveAProject!
#Pending : Due to Itreation3 change
# Error - Project is not getting published
Scenario:Life Cycle of Configuration items - Ensure that SP operator is able to archive a project
  Given I login to Fintech as "sp" operator
  Given I generate name "projectName" with value "Demo_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Project Management" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Project Name" with value "projectName" in the popup dialog window
  Then I enter text area "Description" with value "Reason Description" in the popup dialog window
  Then I click on "Submit" button in cite
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and click on "Lock" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "Confirm" button in cite
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and click on "Archive" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "Confirm" button in cite
  When static text "Project archived successfully" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorIsAbleTopublishAProject!
#Pending : Due to Itreation3 change
# Error - Project is not getting published
Scenario:Life Cycle of Configuration items - Ensure that SP operator is able to publish a project
  Given I login to Fintech as "sp" operator
  Given I generate name "projectName" with value "Demo_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Project Management" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Project Name" with value "projectName" in the popup dialog window
  Then I enter text area "Description" with value "Reason Description" in the popup dialog window
  Then I click on "Submit" button in cite
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and click on "Lock" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "Confirm" button in cite
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and click on "Publish" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "Start Publishing" button in cite
  When static text "Project published successfully" is visible
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and store "TableList.ProjManTable.StatusColNum" column value in "projectStatus"
  Then I check value of "projectStatus" is "Published"
  Then I report "The SP operator is able to publish a project"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorIsAbleTotoUnlockAproject!
#Pending : Due to Itreation3 change
# Error - Project is not getting published
Scenario:Life Cycle of Configuration items - Ensure that SP operator is able to unlock a project
  Given I login to Fintech as "sp" operator
  Given I generate name "projectName" with value "Demo_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Project Management" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Project Name" with value "projectName" in the popup dialog window
  Then I enter text area "Description" with value "Reason Description" in the popup dialog window
  Then I click on "Submit" button in cite
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and click on "Lock" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "Confirm" button in cite
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and click on "Unlock" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "Confirm" button in cite
  When static text "Project unlocked successfully" is visible
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and store "TableList.ProjManTable.StatusColNum" column value in "projectStatus"
  Then I check value of "projectStatus" is "Active"
  Then I report "The SP operator is able to unlock a project"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorIsAbleTotolockAproject!
#Pending : Due to Itreation3 change
# Error - Project is not getting published
Scenario:Life Cycle of Configuration items - Ensure that SP operator is able to lock a project
  Given I login to Fintech as "sp" operator
  Given I generate name "projectName" with value "Demo_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Project Management" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Project Name" with value "projectName" in the popup dialog window
  Then I enter text area "Description" with value "Reason Description" in the popup dialog window
  Then I click on "Submit" button in cite
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and click on "Lock" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "Confirm" button in cite
  When static text "Project locked successfully" is visible
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and store "TableList.ProjManTable.StatusColNum" column value in "projectStatus"
  Then I check value of "projectStatus" is "Locked"
  Then I report "The SP operator is able to lock a project"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorIsAbleToRejectaKYC!
#Pending : Due to Itreation3 change
Scenario:Life Cycle of Configuration items - Ensure that SP operator is able to reject a KYC
  Given I login to Fintech as "sp" operator
  Given I generate name "kycName" with value "Kyc_RAND_4"
  Given I generate name "kycAlias" with value "Alias_RAND_4"
  Given I generate name "kycCode" with value "Code_RAND_4"
  Given I generate name "displayName" with value "Disp_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Customer" in the "Configuration" Page
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I close tab near to home tab
  Then I click on "SimpleValue KYC" radio
  Then I enter text in "Label.KYC Name" with value "kycName"
  Then I enter text in "Label.Alias" with value "kycAlias"
  Then I enter text area "Tips" with value "Reason Description"
  Then I scroll "GenericLocators.KycField" to view using "false" parameter
  Then I select drop down "Data Type" with option "DropDown.String"
  Then I click on the "No" toggle switch
  Then I click on the "View" tab
  Then I enter text for "GenericLocators.DisplayName" with value "displayName"
  Then I click on "GenericLocators.ControlDropDown"
  Then I click on "GenericLocators.ControlDropDownValue"
  Then I click on "Submit" button in cite
  When static text "KYC created successfully" is visible
  Then I close tab near to home tab
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I select the project "Group Savings and Loans" in the "Please select project" dropdown button
  Then I enter text in "KYC Name" with value "kycName"
  Then I click on a "Search"
  Then I check table "Table.KYC" with multiple values as "kycName" and click on "Review" of "Operation" column
  Then I click on "Delete" button in cite
  When static text "KYC deleted successfully" is visible
  Then I close tab near to home tab
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I report "SP operator can delete a KYC that are not released"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPAbleToCreateNewVersionForReleasedDeactivedKYC!
#Pending : Due to Itreation3 change
Scenario:Life Cycle of Configuration items - Ensure that SP operator is able to create new-version for a Released/Deactived KYC
  Given I login to Fintech as "sp" operator
  Given I generate name "kycName" with value "Kyc_RAND_4"
  Given I generate name "kycAlias" with value "Alias_RAND_4"
  Given I generate name "kycCode" with value "Code_RAND_4"
  Given I generate name "displayName" with value "Disp_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Customer" in the "Configuration" Page
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I click on "SimpleValue KYC" radio
  Then I enter text in "Label.KYC Name" with value "kycName"
  Then I enter text in "Label.Alias" with value "kycAlias"
  Then I enter text area "Tips" with value "Reason Description"
  Then I scroll "GenericLocators.KycField" to view using "false" parameter
  Then I select drop down "Data Type" with option "DropDown.String"
  Then I click on the "No" toggle switch
  Then I click on the "View" tab
  Then I enter text for "GenericLocators.DisplayName" with value "displayName"
  Then I click on "GenericLocators.ControlDropDown"
  Then I click on "GenericLocators.ControlDropDownValue"
  Then I click on "Submit" button in cite
  When static text "KYC created successfully" is visible
  Then I close tab near to home tab
  Then I close tab near to home tab
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I select the project "test" in the "Please select project" dropdown button
  Then I enter text in "KYC Name" with value "kycName"
  Then I click on a "Search"
  Then I check table "Table.KYC" with multiple values as "kycName" and click on "Edit" of "Operation" column
  Then I click on "Submit" button in cite
  Then I check table "Table.KYC" with multiple values as "kycName" and click on "Review" of "Operation" column
  Then I click on "Release" button in cite
  Then I check table "Table.KYC" with multiple values as "kycName" and click on "New Version" of "Operation" column
  Then I click on "Submit" button in cite
  When static text "created new version successfully" is visible
  Then I report "The SP operator is able to create new-version for a Released KYC"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorIsAbleTodeactivateaKYC!
#Pending : Due to Itreation3 change
Scenario:Life Cycle of Configuration items - Ensure that SP operator is able to deactivate a KYC
  Given I login to Fintech as "sp" operator
  Given I generate name "kycName" with value "Kyc_RAND_4"
  Given I generate name "kycAlias" with value "Alias_RAND_4"
  Given I generate name "kycCode" with value "Code_RAND_4"
  Given I generate name "displayName" with value "Disp_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Customer" in the "Configuration" Page
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I click on "SimpleValue KYC" radio
  Then I enter text in "Label.KYC Name" with value "kycName"
  Then I enter text in "Label.Alias" with value "kycAlias"
  Then I enter text area "Tips" with value "Reason Description"
  Then I scroll "GenericLocators.KycField" to view using "false" parameter
  Then I select drop down "Data Type" with option "DropDown.String"
  Then I click on the "No" toggle switch
  Then I click on the "View" tab
  Then I enter text for "GenericLocators.DisplayName" with value "displayName"
  Then I click on "GenericLocators.ControlDropDown"
  Then I click on "GenericLocators.ControlDropDownValue"
  Then I click on "Submit" button in cite
  When static text "KYC created successfully" is visible
  Then I close tab near to home tab
  Then I close tab near to home tab
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I select the project "test" in the "Please select project" dropdown button
  Then I enter text in "KYC Name" with value "kycName"
  Then I click on a "Search"
  Then I check table "Table.KYC" with multiple values as "kycName" and click on "Edit" of "Operation" column
  Then I click on "Submit" button in cite
  Then I check table "Table.KYC" with multiple values as "kycName" and click on "Review" of "Operation" column
  Then I click on "Release" button in cite
  Then I check table "Table.KYC" with multiple values as "kycName" and click on "Deactive" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "Submit" button in cite
  When static text "Deactive KYC successfully" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsuerThatSPOperatorCanDeleteKYCthatAreNotReleased!
#Pending : Due to Itreation3 change
Scenario:Life Cycle of Configuration items - Ensure that SP operator can delete a KYC that are not released
  Given I login to Fintech as "sp" operator
  Given I generate name "kycName" with value "Kyc_RAND_4"
  Given I generate name "kycAlias" with value "Alias_RAND_4"
  Given I generate name "kycCode" with value "Code_RAND_4"
  Given I generate name "displayName" with value "Disp_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Customer" in the "Configuration" Page
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I click on "SimpleValue KYC" radio
  Then I enter text in "Label.KYC Name" with value "kycName"
  Then I enter text in "Label.Alias" with value "kycAlias"
  Then I enter text area "Tips" with value "Reason Description"
  Then I scroll "GenericLocators.KycField" to view using "false" parameter
  Then I select drop down "Data Type" with option "DropDown.String"
  Then I click on the "No" toggle switch
  Then I click on the "View" tab
  Then I enter text for "GenericLocators.DisplayName" with value "displayName"
  Then I click on "GenericLocators.ControlDropDown"
  Then I click on "GenericLocators.ControlDropDownValue"
  Then I click on "Submit" button in cite
  When static text "KYC created successfully" is visible
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I select the project "test" in the "Please select project" dropdown button
  Then I check table "Table.KYC" with multiple values as "kycName" and click on "Review" of "Operation" column
  Then I click on "Delete" button in cite
  When static text "KYC deleted successfully" is visible
  Then I report "The SP operator can delete a KYC that are not released"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCanReleaseKYCToActiveProjectOnThePortal!
#Pending : Due to Itreation3 change
Scenario:Life Cycle of Configuration items - Ensure that SP operator can release a KYC to an active project on the portal
  Given I login to Fintech as "sp" operator
  Given I generate name "kycName" with value "Kyc_RAND_4"
  Given I generate name "kycAlias" with value "Alias_RAND_4"
  Given I generate name "kycCode" with value "Code_RAND_4"
  Given I generate name "displayName" with value "Disp_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Customer" in the "Configuration" Page
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I close tab near to home tab
  Then I click on "SimpleValue KYC" radio
  Then I enter text in "Label.KYC Name" with value "kycName"
  Then I enter text in "Label.Alias" with value "kycAlias"
  Then I enter text area "Tips" with value "Reason Description"
  Then I scroll "GenericLocators.KycField" to view using "false" parameter
  Then I select drop down "Data Type" with option "DropDown.String"
  Then I click on the "No" toggle switch
  Then I click on the "View" tab
  Then I enter text for "GenericLocators.DisplayName" with value "displayName"
  Then I click on "GenericLocators.ControlDropDown"
  Then I click on "GenericLocators.ControlDropDownValue"
  Then I click on "Submit" button in cite
  When static text "KYC created successfully" is visible
  Then I close tab near to home tab
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I select the project "test" in the "Please select project" dropdown button
  Then I check table "Table.KYC" with multiple values as "kycName" and click on "Review" of "Operation" column
  Then I click on "Release" button in cite
  When static text "KYC released successfully." is visible
  Then I report "The SP operator can released successfully."

@TC_FINLSO_REG2_SPCanCreateGroupKYCOnPortal!
#Pending : Due to Itreation3 change
Scenario:Life Cycle of Configuration items - Ensure that SP operator can create a group KYC on the portal.
  Given I login to Fintech as "sp" operator
  Given I generate name "kycName" with value "Kyc_RAND_4"
  Given I generate name "kycAlias" with value "Alias_RAND_4"
  Given I generate name "kycCode" with value "Code_RAND_4"
  Given I generate name "displayName" with value "Disp_RAND_4"
  Given I generate name "kycFieldName" with value "KycField_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Customer" in the "Configuration" Page
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I click on "Group KYC" radio
  Then I enter text in "Label.KYC Name" with value "kycName"
  Then I enter text in "Label.Alias" with value "kycAlias"
  Then I enter text area "Tips" with value "Reason Description"
  Then I scroll "GenericLocators.KycField" to view using "false" parameter
  Then I click on "GenericLocators.KycFieldAddButton"
  Then I enter text in "Label.KYC Field Name" with value "kycFieldName" in the message dialog window
  Then I click on "Confirm" button in cite
  Then I select drop down "Data Type" with option "DropDown.String"
  Then I click on the "No" toggle switch
  Then I click on the "View" tab
  Then I enter text for "GenericLocators.DisplayName" with value "displayName"
  Then I click on "GenericLocators.ControlDropDown"
  Then I click on "GenericLocators.ControlDropDownValue"
  Then I click on "Submit" button in cite
  When static text "KYC created successfully" is visible
  Then I close tab near to home tab
  Then I close tab near to home tab
  Then I click on left child menu "KYC Configuration" in the "Configuration" Page
  Then I check table "Table.KYC" with multiple values as "kycName" and store "TableList.KycTable.OperationDetailColNum" column value in "operationValue"
  Then I check value of "operationValue" is "Detail"
  Then I check table "Table.KYC" with multiple values as "kycName" and store "TableList.KycTable.OperationEditColNum" column value in "operationValue"
  Then I check value of "operationValue" is "Edit"
  Then I check table "Table.KYC" with multiple values as "kycName" and store "TableList.KycTable.OperationReviewColNum" column value in "operationValue"
  Then I check value of "operationValue" is "Review"
  Then I report "The Operation of the newly created KYC include Detail, Edit and Review button."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCanCreateProjectOnThePortal!
#Pending : Due to Itreation3 change
Scenario:Life cycle of configuration items - Ensure SP operator to create a project on the portal
  Given I login to Fintech as "sp" operator
  Given I generate name "projectName" with value "Demo_RAND_4"
  Then I click on a "GenericLocators.Configuration"
  Then I click on left child menu "Project Management" in the "Configuration" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Project Name" with value "projectName" in the popup dialog window
  Then I enter text area "Description" with value "Reason Description" in the popup dialog window
  Then I click on "Submit" button in cite
  When static text "Project created successfully." is visible
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and store "TableList.ProjManTable.StatusColNum" column value in "statusValue"
  Then I check value of "statusValue" is "Active"
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and store "TableList.ProjManTable.OperationDetailColNum" column value in "operationValue"
  Then I check value of "operationValue" is "Detail"
  Then I check table "Table.ProjectManagement" with multiple values as "projectName" and store "TableList.ProjManTable.OperationLockColNum" column value in "operationValue"
  Then I check value of "operationValue" is "Lock"
  Then I report "The Operation includes Detail, Lock button and Active Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ResetOrganizationOperatorPINthatResetOrganizationOperatorPIN!
Scenario:Reset organization operator PIN - Ensure that Reset organization operator PIN
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I enter text in "Label.Operator ID" with value "OrgOperator.DefaultOperatorId"
  Then I click on a "Search"
  Then I check table "Table.OrganizationOperator" with multiple values as "OrgOperator.Shortcode" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.OperatorButtonForOrgOp"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitReset"
  Then I report "The organization operator can Reset the Pin"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureSPResetCustomerPINThroughCustomerCareChannel!
Scenario:Reset Customer PIN - Ensure that SP to Reset Customer PIN Through the customer care channel
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "User Service" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "Customer.Registered_Customer_Nine"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "Customer.Registered_Customer_Nine|Active" and click on "Detail" of "Operation" column
  When static text "Verify Customer" is visible
  Then I click on Generic "Pass"
  Then I click on "Submit" button in cite
  When static text "Verify Success" is visible
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitResetForCustomer"
  When static text "Reset PIN SUCCESS" is visible
  Then I report "The SP can able to Reset Customer PIN through Customer Care Channel"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureSPResetCustomerPIN!
Scenario:Reset Customer PIN - Ensure that the SP to Reset Customer PIN
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnCustomer" with value "Customer.Registered_Customer_Nine"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInIdentity" with multiple values as "Customer.Registered_Customer_Nine" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitResetForCustomer"
  When static text "Reset PIN SUCCESS" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPChangeCustomerStatusActiveToSuspended!
Scenario:SP Operator Change Customer status - Ensure SP Operator Change Customer status (Active to Suspended)
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                         | SearchBy     | SearchValue                         | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer_Active | Label.MSISDN | Customer.Registered_Customer_Active | Status.Active |
  Then I edit Identity Status of customer with value "Suspended"
  Then I edit Identity Status of customer with value "Active"
  Then I report "The status of the customer changes to Suspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureSPOperatorChangeOperatorlanguageviaWeb!
Scenario:Change operator language_Ensure_SP Operator Change Operator language via Web
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I enter text in "Label.First Name" with value "aa"
  Then I click on " Search " button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "OrgOperator.ShortCode1" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.EditLanguageOrg"
  Then I select drop down "Language" with option "DropDown.Southern Sotho"
  Then I enter text area "Remark" with value "Test"
  Then I click on "GenericLocators.ConfirmLanguage"
  Then I click on "GenericLocators.EditLanguageOrg"
  Then I click on "GenericLocators.LanguageDropdown"
  Then I click on "GenericLocators.LanguageEnglish"
  Then I enter text area "Remark" with value "Test"
  Then I click on "GenericLocators.ConfirmLanguage"
  When static text "Change Language SUCCESS!" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsurethatQueryOrganizationOperatorInfo!
Scenario:Query Identity by SP Portal_Ensure that Query Organization Operator Info
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I enter text in "Label.First Name" with value "aa"
  Then I click on " Search " button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "OrgOperator.ShortCode1" and click on "Detail" of "Operation" column
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureQueryOrganizationInfo!
Scenario:Query Identity by SP Portal_Ensure Query Organization Info
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I click on " Search " button in cite
  Then I check table "Table.Organization" with multiple values as "ShortCode.ShortCode1" and click on "View" of "Operation" column
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureQueryCustomerInfo!
Scenario:Query Identity by SP Portal_Ensure Query Customer Info
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "Customer.Registered_Customer_Nine"
  Then I click on " Search " button in cite
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SpOperatorCantCreateCusIfMSISDNIsAlreadyExist!
Scenario: Create Customer - Exception - Attempt SP Operator Create Registered Customer via Web MSISDN Already Used
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "Customer.Registered_Customer_Nine"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text in "Label.First Name" with value "Reason Description"
  When static text "The MSISDN has been used!" is visible
  Then I report "SP Operator can't create Registered Customer via Web MSISDN Already Used"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_AttemptSPCreateRegCusViaWebMSISDNOutOfRange!
Scenario:Create Customer - Exception - Attempt SP Operator Create Registered Customer via Web - MSISDN is out of Range
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "26659999999_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text in "Label.First Name" with value ""
  When static text "The phone number does not meet the requirements" is visible
  Then I report "SP Operator Create Can't Registered Customer via Web_MSISDN is out of Range"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCreateRegCusViaWebMandatoryverificationBasicProduct!
Scenario:Create Customer - Exception - Attempt SP Operator Create Registered Customer via Web - Mandatory verification: basic product
  Given I login to Fintech as "sp" operator
  Given I generate name "CusMSISDN" with value "1320001_RAND_4"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I wait "5"
  Then I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "CusMSISDN"
  Then I select drop down "Language" with option "Southern Sotho"
  Then I scroll "GenericLocators.ScrollPersonalDetail" to view using "false" parameter
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.Middle Name" with value "MiddleName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I click on "GenericLocators.DateInorgportal"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.DateofBirth"
  Then I click on " Male " radio
  Then I scroll "GenericLocators.ScrollAddressDetail" to view using "false" parameter
  Then I enter text in "Label.CityorTown" with value "City"
  Then I select drop down "Secret Question" with option "DropDown.SecretQuestion"
  Then I enter text in "Label.SecretAnswer" with value "DateOfBirth"
  Then I click on "Next" button in cite
  Then I check error text "Please select the default product" is displayed
  Then I report "SP Operator Can't Create Registered Customer via Web_Mandatory verification: basic product"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCreateRegisteredCustomerViaWeb!
Scenario:Create Customer - Ensure SP Operator Create Registered Customer via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "132000_RAND_5"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I wait "5"
  When I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I click on "+ Add Basic Product " button in cite
  Then I click on "GenericLocators.Fintech2TestProduct"
  Then I click on " Confirm " button in cite
  Then I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "CustomerMSISDN"
  Then I select drop down "Language" with option "Southern Sotho"
  Then I scroll "GenericLocators.ScrollPersonalDetail" to view using "false" parameter
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.Middle Name" with value "MiddleName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I click on "GenericLocators.DateInorgportal"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.DateofBirth"
  Then I click on " Male " radio
  Then I scroll "GenericLocators.ScrollAddressDetail" to view using "false" parameter
  Then I enter text in "Label.CityorTown" with value "City"
  Then I select drop down "Secret Question" with option "DropDown.SecretQuestion"
  Then I enter text in "Label.SecretAnswer" with value "DateOfBirth"
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I click on "Submit" button in cite
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "CustomerMSISDN"
  Then I click on "Search" button in cite
  Then I check table "Table.CustomerInIdentity" with multiple values as "CustomerMSISDN" and click on "Detail" of "Operation" column
  Then I report "SP Operator can Create Registered Customer via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCreateWEBandHANDSETOrgOperatorViaWeb!
Scenario:Create Organisation Operator - Ensure SP Operator Create WEB and HANDSET Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "userName" with value "Techtest_RAND_4"
  Given I generate name "OperatorId" with value "RAND_4"
  Given I generate name "Role" with value "test_role03"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "GenericLocators.LanguageDropdown"
  Then I click on "GenericLocators.LanguageEnglishOrgOpe"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "Label.Web" checkbox
  Then I click on "Label.Handset" checkbox
  Then I enter text in "Label.Operator ID" with value "OperatorId"
  Then I enter text in "Label.User Name" with value "userName"
  Then I click on "Next" button in cite
  Then I click on "Add Role" button in cite
  Then I click on "OrgOpRole.Test001" checkbox in dialog window
  Then I click on "GenericLocators.Confirmbutton"
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I click on "Submit" button in cite
  Then I click on " View Detail >> " to check
  Then I report "SP Operator can Create WEB&HANDSET Organization Operator via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCreateHANDSETOrgOpViaWebNewOperatorIDAlreadyUsed!
Scenario:Create Organization Operator - Exception - Attempt SP Operator Create HANDSET Organization Operator via Web - New Operator ID Already Used
  Given I login to Fintech as "sp" operator
  Given I generate name "OperatorId" with value "AB1234"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "GenericLocators.LanguageDropdown"
  Then I click on "GenericLocators.LanguageEnglishOrgOpe"
  Then I click on "Label.Handset" checkbox
  Then I enter text in "Label.Operator ID" with value "OperatorId"
  Then I click on "Next" button in cite
  When static text "The Operator ID is existed" is visible
  Then I report "SP Operator can't Create HANDSET Organization Operator via Web_New Operator ID Already Used"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCreateOrgOperatorViaWeb!
Scenario:Create Organization Operator - SP Operator Create WEB Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "userName" with value "spoperator_RAND_4"
  Given I generate name "MSISDN" with value "861330000_RAND_4"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "SP Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Username" with value "userName"
  Then I select drop down "Language" with option "DropDown.Southern Sotho"
  Then I click on "Next" button in cite
  Then I scroll "GenericLocators.AddRole" to view using "false" parameter
  Then I click on "Add Role" button in cite
  Then I click on "SpRole.SPOperatorRole" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I click on "Next" button in cite
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I enter text in "Label.Email" with value "Test Email"
  Then I scroll "GenericLocators.AddID" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Email"
  Then I enter text in "Notification Receiving E-mail" with value "Test Email"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  Then I report "SP Operator Create WEB Organization Operator via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_OrgOperatorSpCreateHANDSETOrgOperatorViaWeb!
Scenario:Create Organization Operator - SP Operator Create HANDSET Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "OperatorId" with value "RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I select drop down "Language" with option "DropDown.Southern Sotho"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "Label.Handset" checkbox
  Then I enter text in "Label.Operator ID" with value "OperatorId"
  Then I click on "Next" button in cite
  Then I click on "Add Role" button in cite
  Then I click on "OrgOpRole.Test001" checkbox in dialog window
  Then I click on "GenericLocators.Confirmbutton"
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I click on "Submit" button in cite
  Then I click on " View Detail >> " to check
  Then I report "SP Operator Create HANDSET Organization Operator via Web and it is in Pending Active state"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCreateAPIOrgOpViaWebUserNameAlreadyUsed!
Scenario:Create Organization Operator - Exception - Attempt SP Operator Create API Organization Operator via Web - User Name Already Used
  Given I login to Fintech as "sp" operator
  Given I generate name "userName" with value "Techtest"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "GenericLocators.API"
  Then I enter text in "Label.User Name" with value "naren"
  When static text "The User Name is existed" is visible
  Then I click on "Next" button in cite
  Then I report "SP Operator Can't Create API Organization Operator via Web_User Name Already Used"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCreateAPIOrgOperatorViaWeb!
Scenario: Create Organization Operator - SP Operator Create API Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "FirstName" with value "Fintech"
  Given I generate name "LasttName" with value "Automation"
  Given I generate name "userName" with value "Techtest_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "GenericLocators.API"
  Then I enter text in "Label.User Name" with value "userName"
  Then I click on "Next" button in cite
  Then I click on "Add Role" button in cite
  Then I click on "OrgOpRole.Test001" checkbox in dialog window
  Then I click on "GenericLocators.Confirmbutton"
  Then I click on "Next" button in cite
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text for "GenericLocators.LastName" with value "LasttName"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.CreateSubmit"
  When static text "Organization operator created successfully!" is visible
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I enter text in "Label.User Name" with value "userName"
  Then I click on "GenericLocators.SubmitButton"
  Then I check table "Table.OrganizationOperator" with multiple values as "userName" and click on "Detail" of "Operation" column
  Then I report "SP Operator Create API Organization Operator via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCreateChildAggregatorOrganizationViaWeb!
Scenario:Create Organization - Ensure SP Operator Create Child Aggregator Organization via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "Child_RAND_4"
  Given I generate name "PostalAdd" with value "Semonkong"
  Given I generate name "PhyAdd" with value "Semonkong"
  Given I generate name "City" with value "City"
  Given I generate name "PhoneNo" with value "RAND_10"
  Given I generate name "Postal" with value "RAND_6"
  Given I generate name "Email" with value "abc@123"
  Given I generate name "NationalId" with value "RAND_6"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Given I generate name "Product" with value "CashIn2"
  Given I generate name "Role" with value "test_role01"
  Given I generate name "OrgName" with value "ChildAgg_RAND_4"
  Given I generate name "OrgNameShortCode" with value "RAND_6"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Child Organization "
  Then I Add product in the organization as "Agency Independent Store"
  Then I scroll page to bottom
  Then I enter text for "GenericLocators.ParentShortCode" with value "ShortCode.ShortCode1"
  Then I enter text for "GenericLocators.ShortCode" with value "OrgOperator.ShortCode1"
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I enter text in "Label.PostalAddress" with value "PostalAdd"
  Then I click on "GenericLocators.Region"
  Then I click on "GenericLocators.SemonRegTopOrg"
  Then I click on "GenericLocators.ConfirmBtnBO"
  Then I enter text in "Label.PhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.OfficePhoneNumber" with value "PhoneNo"
  Then I enter text in "Label.CityorTownInorgpage" with value "City"
  Then I scroll "GenericLocators.Settlementnumber" to view using "false" parameter
  Then I select drop down "Organisation Category Code" with option "DropDown.Veterinaryservices"
  Then I select drop down "Type of Business" with option "DropDown.PublicListedCompany"
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "PhoneNo"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I enter text in "Label.ContactPhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.ContactAddress2" with value "PhyAdd"
  Then I enter text in "Label.ContactPostCode" with value "Postal"
  Then I enter text in "Label.ContactCityorTown" with value "City"
  Then I scroll "GenericLocators.BankAccountDetails" to view using "false" parameter
  Then I switch to next frame
  Then I click on "GenericLocators.ContactType"
  Then I click on "GenericLocators.OwnerContact"
  Then I enter text for "GenericLocators.TopOrgContactfirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactsurName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactphNo" with value "PhoneNo"
  Then I enter text for "GenericLocators.TopOrgContactidNo" with value "NationalId"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.TopOrgContactidNo" with value "NationalId"
  Then I click on "GenericLocators.ContactIdType"
  Then I click on "GenericLocators.NationalId"
  Then I enter text for "GenericLocators.ContactIdNo" with value "Reason Description"
  Then I click on "Next" button in cite
  When static text "Child organization created successfully, please wait for approving." is visible
  Then I click on "View Detail" to check
  Then I report "SP Operator Create Child Aggregator Organization via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsurethatSPCreateChildOwnedOrganizationViaWeb!
Scenario:Create Organization - Ensure SP Operator Create Child Owned Organization via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "Product" with value "Label.CashIn2"
  Given I generate name "Role" with value "Label.test_role01"
  Given I generate name "OrgName" with value "ChildOwn_RAND_4"
  Given I generate name "OrgNameShortCode" with value "RAND_6"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Child Organization "
  Then I click on "Add" button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I scroll "GenericLocators.EffectiveDate" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product"
  Then I scroll page to bottom
  Then I enter text for "GenericLocators.ParentShortCode" with value "ShortCode.MpatOrgOne"
  Then I enter text for "GenericLocators.ShortCode" with value "OrgNameShortCode"
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I select drop down "Preferred Notification Channel" with option "Label.Email"
  Then I enter text in "Notification Receiving E-MAIL" with value "Test Email"
  Then I scroll "GenericLocators.Language" to view using "false" parameter
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.IdentityModel"
  Then I click on "GenericLocators.OptionOwned"
  Then I click on "GenericLocators.ChildSubAgentModel"
  Then I click on "GenericLocators.OptionOwned"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.CreateSubmit"
  When static text "Child organization created successfully, please wait for approving." is visible
  Then I click on "View Detail" to check
  Then I report "The SP Operator can create Child Owned Organization via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCanCreateTopOrgViaWebwithEmail!
Scenario:Create Organization - Ensure SP Operator Create Top Organization via Web with Email
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "Child_RAND_4"
  Given I generate name "PostalAdd" with value "Semonkong"
  Given I generate name "PhyAdd" with value "Semonkong"
  Given I generate name "City" with value "City"
  Given I generate name "PhoneNo" with value "RAND_10"
  Given I generate name "Postal" with value "RAND_6"
  Given I generate name "NationalId" with value "RAND_6"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I Add product in the organization as "Super Agent"
  Then I enter text in "Label.Organizationname" with value "OrgName"
  Then I scroll "GenericLocators.ScrollKYcInfo" to view using "false" parameter
  Then I click on "GenericLocators.Region"
  Then I click on "GenericLocators.SemonRegTopOrg"
  Then I click on "GenericLocators.ConfirmBtn"
  Then I enter text in "Label.PostalAddress" with value "PostalAdd"
  Then I enter text in "Label.PhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.OfficePhoneNumber" with value "PhoneNo"
  Then I enter text in "Label.CityorTownInorgpage" with value "City"
  Then I select drop down "Organisation Category Code" with option "DropDown.Veterinaryservices"
  Then I select drop down "Type of Business" with option "DropDown.PublicListedCompany"
  Then I scroll "GenericLocators.ScrollDetail" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.Email"
  Then I enter text in "Label.Notificationreceivingemail" with value "Test Email"
  Then I wait "15"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I enter text in "Label.ContactPhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.ContactAddress2" with value "PhyAdd"
  Then I enter text in "Label.ContactPostCode" with value "Postal"
  Then I enter text in "Label.ContactCityorTown" with value "City"
  Then I scroll "GenericLocators.ScrollOrganizationContact" to view using "false" parameter
  Then I switch to next frame
  Then I click on "GenericLocators.ContactType"
  Then I click on "GenericLocators.OwnerContact"
  Then I enter text for "GenericLocators.TopOrgContactFirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactSurName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactPhNo" with value "PhoneNo"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.TopOrgContactIdNo" with value "NationalId"
  Then I click on "GenericLocators.ContactIdType"
  Then I click on "GenericLocators.NationalId"
  Then I switch to current window
  Then I click on "Next" button in cite
  Then I scroll "GenericLocators.ScrollCommissionSettlement" to view using "false" parameter
  Then I click on "GenericLocators.CommissionSettlementConfiguration"
  Then I click on "GenericLocators.DefaultSettingTemp"
  Then I wait "5"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.SubmitBtn"
  Then I report "Top organization created successfully, please wait for approving."
  Then I click on "View Detail" to check
  Then I report "The SP Operator can create Top Organization via Web with email"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPCreateTopOrgViaWebWithMSISDN!
Scenario:Create Organization - Ensure SP Operator Create Top Organization via Web with MSISDN
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "Child_RAND_4"
  Given I generate name "PostalAdd" with value "Semonkong"
  Given I generate name "PhyAdd" with value "Semonkong"
  Given I generate name "City" with value "City"
  Given I generate name "PhoneNo" with value "RAND_10"
  Given I generate name "Postal" with value "RAND_6"
  Given I generate name "NationalId" with value "RAND_6"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I Add product in the organization as "Super Agent"
  Then I enter text in "Label.Organizationname" with value "OrgName"
  Then I scroll "GenericLocators.ScrollKYcInfo" to view using "false" parameter
  Then I click on "GenericLocators.Region"
  Then I click on "GenericLocators.SemonRegTopOrg"
  Then I click on "GenericLocators.ConfirmBtn"
  Then I enter text in "Label.PostalAddress" with value "PostalAdd"
  Then I enter text in "Label.PhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.OfficePhoneNumber" with value "PhoneNo"
  Then I enter text in "Label.CityorTownInorgpage" with value "City"
  Then I select drop down "Organisation Category Code" with option "DropDown.Veterinaryservices"
  Then I select drop down "Type of Business" with option "DropDown.PublicListedCompany"
  Then I scroll "GenericLocators.ScrollDetail" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "PhoneNo"
  Then I wait "15"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I enter text in "Label.ContactPhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.ContactAddress2" with value "PhyAdd"
  Then I enter text in "Label.ContactPostCode" with value "Postal"
  Then I enter text in "Label.ContactCityorTown" with value "City"
  Then I scroll "GenericLocators.ScrollOrganizationContact" to view using "false" parameter
  Then I switch to next frame
  Then I click on "GenericLocators.ContactType"
  Then I click on "GenericLocators.OwnerContact"
  Then I enter text for "GenericLocators.TopOrgContactFirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactSurName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactPhNo" with value "PhoneNo"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.TopOrgContactIdNo" with value "NationalId"
  Then I click on "GenericLocators.ContactIdType"
  Then I click on "GenericLocators.NationalId"
  Then I switch to current window
  Then I click on "Next" button in cite
  Then I scroll "GenericLocators.ScrollCommissionSettlement" to view using "false" parameter
  Then I click on "GenericLocators.CommissionSettlementConfiguration"
  Then I click on "GenericLocators.DefaultSettingTemp"
  Then I wait "5"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.SubmitBtn"
  Then I report "Top organization created successfully, please wait for approving."
  Then I click on "View Detail" to check
  Then I report "The SP Operator can create Top Organization via Web with MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatoLogoutSPPortal!
Scenario:SP Operator Logout SP Portal
  Given I login to Fintech as "sp" operator
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsureSPOperatorCreateWEBSPOperatorViaWeb!
Scenario:Create SP Operator - Ensure that SP Operator Create WEB SP Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "spUsername" with value "spoperator_RAND_4"
  Given I generate name "msisdn" with value "123456_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "SP Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I wait "5"
  Then I enter text in "Label.Username" with value "spUsername"
  Then I click on "Next" button in cite
  Then I click on "Add Role" button in cite
  Then I click on "GenericLocators.Addcheckbox"
  Then I click on "Confirm" button in cite
  Then I wait "5"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  When static text "SP Operator created successfully, please wait for approving." is visible
  Then I close tab near to home tab
  Then I close tab near to home tab
  Then I click on left child menu "SP Operator" in the "Home" Page
  Then I enter text in "Label.Username" with value "spUsername"
  Then I click on a "Search"
  Then I check table "Table.SPOperator" with multiple values as "spUsername" and click on "Detail" of "Operation" column
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_EnsurethatSPCanLoginSPPortal!
Scenario:SP Operator Login SP Portal - Ensure that SP Operator Login SP Portal Active
  Given I login to Fintech as "sp" operator
  Then I report "The SP operator login the portal successful."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_TransferFromAgencyOrganizationMoveFundsViaWEB!
#Need balance to execute this Test Case
Scenario:Transfer From AgencyOrganizationMoveFunds Via WEB
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.AgencyOrganizationMoveFundsFloatToM-Pesa"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Initiate Transaction submitted successfully." is visible
  Then I report "Transfer AgencyOrganizationMoveFundsFloatToM-Pesa is Successfully Completed"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_TransferFromOrganizationFundsManagementBusinessDepositViaWEB!
Scenario:Transfer From Organization Funds Management - Business Deposit Via WEB
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessDeposit"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Initiate Transaction submitted successfully." is visible
  Then I report "Transfer From Organization Funds Management - Business Deposit Via WEB is Successfully Completed"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_TransferOrganizationFundsManagementBusinessWithdrawalViaWEB!
Scenario:Transfer From Organization Funds Management - Business Withdrawal Via WEB
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessWithdraw"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Initiate Transaction submitted successfully." is visible
  Then I report "Transfer From Organization Funds Management - Business Withdrawal Via WEB is Successfully Completed"

@TC_FINLSO_REG2_CreateCustomerInSPInputMandatoryKYCFields!
Scenario: Scenario name Create Customer in SP Portal, and Only Input the Mandatory KYC Fields
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "132000_RAND_5"
  Given I generate name "FirstName" with value "TestKYC"
  Given I generate name "LastName" with value "AutomationKYC"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I wait "5"
  Then I click on "+ Add Basic Product " button in cite
  Then I click on "GenericLocators.Fintech2TestProduct"
  Then I click on " Confirm " button in cite
  Then I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "CustomerMSISDN"
  Then I scroll "GenericLocators.ScrollPersonalDetail" to view using "false" parameter
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I click on "GenericLocators.DateInorgportal"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.Selectedyear"
  Then I click on "GenericLocators.DateofBirth"
  Then I click on " Male " radio
  Then I scroll "GenericLocators.ScrollAddressDetail" to view using "false" parameter
  Then I enter text in "Label.CityorTown" with value "City"
  Then I select drop down "Secret Question" with option "DropDown.SecretQuestion"
  Then I enter text in "Label.SecretAnswer" with value "DateOfBirth"
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I click on "Next" button in cite
  Then I wait "5"
  Then I click on "Submit" button in cite
  When static text "Create completed" is visible
  Then I click on " View >> " to check
  Then I report "SP Operator Created Customer with Input the Mandatory KYC Fields"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorofTillOrganizationisintheFrozenstateToChangeTillProduct!
Scenario:When The Till Organization is in the Frozen state To Change Till Product
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Till" with below details
  | TableId    | TableValues                  | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                  | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber10 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.TillNumber10 | Status.Active |
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I click on "Add Product" button in cite
  Then I click on "AddProduct.C2BBusiness-UtlityPaymentTill" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I report "The Product is successfully modified. The modification is successfully submitted."
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Product" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The Till status is modified the Product when Organization Status is Frozen"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorofTillisinthePendingActivestateToChangeTillProduct!
Scenario:When The Till is in the Pending Active state To Change Till Product
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                | Status                |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber | Status.Pending Active |
  Then I report "Query the till successfully, The till details page is displayed."
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I click on "Add Product" button in cite
  Then I click on "AddProduct.CollectionBankTill" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I report "The Product is successfully modified. The modification is successfully submitted."
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Product" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ChangeTillDeviceWhenTillInFrozenAndTillOrganizationInFrozen!
Scenario:Change Till Device When The till is in the Frozen state and the till organization is in the Frozen state
  #Pre-Requisite
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I scroll "GenericLocators.ScrollDevice" to view using "false" parameter
  Then I edit Device MSISDN with value "MSISDN"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Device" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "Sp can change device when Till and organization are in Frozen State"
  #Post Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I scroll "GenericLocators.ScrollDevice" to view using "false" parameter
  Then I edit Device MSISDN with value "Till.MpatOrgOne.MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ChangeTillDeviceWhenTillInFrozenAndTillOrganizationInActive!
Scenario:Change Till Device When The till is in the Frozen state and the till organization is in the Active state
  #Pre-Requisite
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I scroll "GenericLocators.ScrollDevice" to view using "false" parameter
  Then I edit Device MSISDN with value "MSISDN"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Device" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I close tab near to home tab
  Then I report "Sp can change device when Till is in Frozen and organization is in Active State"
  #Post Requisite
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Active"
  Then I scroll "GenericLocators.ScrollDevice" to view using "false" parameter
  Then I edit Device MSISDN with value "Till.MpatOrgOne.MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatortoChangeTillProductWhenThetillisintheActivestateandthetillorganizationisintheActivestate!
Scenario:Change Till Product When The till is in the Active state and the till organization is in the Active state
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                  | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                  | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber10 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.TillNumber10 | Status.Active |
  Then I wait "5"
  Then I report "Query the till successfully, The till details page is displayed"
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I click on "Add Product" button in cite
  Then I click on "AddProduct.C2BBusiness-UtlityPaymentTill" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I report "The Product is successfully modified. The modification is successfully submitted."
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ChangeTillDeviceWhenTillInActiveAndTillOrganizationInActive!
Scenario:Change Till Device When The till is in the Active state and the till organization is in the Active state
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  When I search for "Till" with below details
  | TableId    | TableValues                  | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                  | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber10 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.TillNumber10 | Status.Active |
  Then I scroll "GenericLocators.ScrollDevice" to view using "false" parameter
  Then I edit Device MSISDN with value "MSISDN"
  Then I edit Device MSISDN with value "Till.MpatOrgOne.MSISDN4"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Device" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "Till device changed successfully when the status is Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorChangeTillDefaultOperatorIdviaWeb_OrganizationStatusFrozen!
Scenario:SP Operator Change Till Default Operator Id via Web_ Organization Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber7 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber7 | Status.Active |
  Then I edit Default Operator Id with value "012345" and Remark as "Reason Description"
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The Till modify the operator ID when Organization Status is Suspended"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorChangeTillDefaultOperatorIdviaWeb_OperatorStatusSuspended!
Scenario:SP Operator Change Till Default Operator Id via Web_ Operator Status Suspended
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber7 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber7 | Status.Active |
  Then I edit Default Operator Id with value "012345" and Remark as "Reason Description"
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The Till modify the operator ID when Organization Status is Suspended"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status           |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Suspended |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorChangeTillDefaultOperatorIdviaWeb_OperatorStatusPendingActive!
#pending - need approval for changing status of org
Scenario:SP Operator Change Till Default Operator Id via Web_ Operator Status Pending Active
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber7 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber7 | Status.Active |
  Then I edit Default Operator Id with value "012345" and Remark as "Reason Description"
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The Till Default Operator Id is changed to Suspended when Organization Status is Frozen"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorChangeTillDefaultOperatorIdviaWebOperatorStatusActive!
Scenario:SP Operator Change Till Default Operator Id via Web_ Operator Status Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                | Status                |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber | Status.Pending Active |
  Then I edit Default Operator Id with value "012345" and Remark as "Reason Description"
  Then I edit Default Operator Id with value "0100002" and Remark as "Reason Description"
  Then I report "SP Operator Change Till Default Operator Id via Web"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Default OperatorId" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorChangeTillLanguageviaWeb_organizationStatusFrozen!
#pending - need approval for changing status of org
Scenario:SP Operator Change Till Language via Web_ organization Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber7 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber7 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I change Language with value "English" and Remark as "Test"
  When static text "Language edited successfully" is visible
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The Till status is changed to Frozen and Change Till Language when Organization Status is Frozen"
  #Post-Requisite
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber7 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber7 | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorChangeTillLanguageviaWebTillStatusPendingActive!
Scenario: SP Operator Change Till Language via Web_ Till Status Pending Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                | Status                |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber | Status.Pending Active |
  Then I change Language with value "English" and Remark as "Test"
  When static text "Language edited successfully" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator" and click on "Detail" of "opration" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_LoginTheOrganizationPortalExceptionEnteranincorrectanswer!
#pending need Another Login credentials
Scenario: Login The Organization Portal_Exception_ Enter an incorrect answer
  Given I navigate to Mpesa "org" portal
  Then I click on "GenericLocators.OrgPortalForgetPassword"
  Then I enter text in "Short Code" with value "Login.org.Shortcode"
  Then I enter text in "User Name" with value "Login.org.UserID"
  Then I click on "Submit" button in cite
  Then I enter text in "Answer1" with value "Login.orgIncorrectPassword.SecretQuestionAswer"
  Then I click on "Confirm" button in cite
  When static text "Incorrect answer." is visible
  Then I report "The Organization Portal Exception Incorrect answer."

@TC_FINLSO_REG2_LoginTheOrganizationPortalForgotPasswordResetSuccessfully!
#pending need Another Login credentials with SecretQuestionAswer
Scenario: Login The Organization Portal_Forgot Password Reset Successfully
  Given I navigate to Mpesa "org" portal
  Then I click on "GenericLocators.OrgPortalForgetPassword"
  Then I enter text in "Short Code" with value "Login.org.Shortcode"
  Then I enter text in "User Name" with value "Login.org.UserID"
  Then I click on "Submit" button in cite
  Then I enter text in "Answer1" with value "Login.org.SecretQuestionAswer"
  Then I click on "Confirm" button in cite
  When static text "Password retrieved successfully." is visible
  Then I report "The Organization Portal_Forgot Password Reset Successfully"

@TC_FINLSO_REG2_SPOperatorChangeTillLanguageviaWebTillStatusFrozen!
Scenario: SP Operator Change Till Language via Web_ Till Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  Then I click on "GenericLocators.ConfirmButton"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp_generic" operator
  Given I login to Fintech as "sp_generic" operator
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp" operator
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber9 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber9 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  Then I change Language with value "English" and Remark as "Test"
  Then I report "Language Change successfully Till Status Frozen"
  #Post-Requisite
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  Then I click on "GenericLocators.ConfirmButton"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp_generic" operator
  Given I login to Fintech as "sp_generic" operator
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp" operator
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber9 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber9 | Status.Frozen |
  Then I wait "3"
  Then I edit Identity Status in "Till" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_LoginOrganizationPortalIncorrectPassword!
Scenario:Login The Organization Portal_Exception_ Incorrect Password
  Given I login to Fintech as "orgIncorrectPassword" operator
  Then I check error text " Incorrect username, password, or status." is displayed
  Then I report "The organization operator login the portal failed with incorrect password"

@TC_FINLSO_REG2_LoginTheOrganizationPortalExceptionIncorrectVerificationCode!
Scenario: Login The Organization Portal_Exception_ Incorrect Verification Code
  Given I navigate to Mpesa "org" portal
  Then I enter text in "Short Code" with value "Login.org.Shortcode"
  Then I enter text in "User Name" with value "Login.org.UserID"
  Then I enter text in "Password" with value "Login.org.password"
  Then I enter text in "Verification Code" with value "Login.orgIncorrectPassword.IncorrectVerificationCode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "3"
  Then I click on " I Have Read And Agreed" button in cite
  Then I click on " Login " button in cite
  Then I check error text " Incorrect verification code. " is displayed
  Then I report "The organization operator login the portal failed with incorrect Verificationcode"

@TC_FINLSO_REG2_LoginOrganizationPortalExceptionShortCodeDoesNotExist!
Scenario:Login The Organization Portal_Exception_The Short Code does not exist
  Given I login to Fintech as "orgIncorrectShortcode" operator
  Then I check error text " The organization does not exist. " is displayed
  Then I report "The organization operator login the portal failed"

@TC_FINLSO_REG2_SPOperatorChangeTillLanguageviaWebTillStatusActive!
Scenario:SP Operator Change Till Language via Web_ Till Status Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | Query Condition | SearchValue                | TableValues                | MSISDN                 | Status        |
  | Table.Till | MSISDN          | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.MSISDN | Status.Active |
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  Then I change Language with value "English" and Remark as "Test"
  When static text "Message.LanguageEdited" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The status is selected and modified successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_LoginOrganizationPortalSuccesed!
Scenario:Login The Organization Portal_Login The Organization Portal Succesed
  Given I login to Fintech as "org" operator
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG2_SSPOperatorCloseTillviaWeb_TillStatusFrozenandorganizationstatusisfrozen!
#Pending - need a active till number to work with this test case!
Scenario:SP Operator Close Till via Web_Till Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues      | SearchBy                      | SearchValue      | Status        |
  | Table.Organization | ShortCode.NewOrg | Label.Organization Short Code | ShortCode.NewOrg | Status.Active |
  Then I edit Identity Status in "org" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Till" with below details
  | TableId    | TableValues                 | SearchBy          | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber2 | Label.Till Number | Till.MpatOrgOne.TillNumber2 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I wait "5"
  Then I click on left child menu "Till" in the "Home" Page
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber2"
  Then I click on a "Search"
  Then I check table "Table.Till" with multiple values as "Till.MpatOrgOne.TillNumber2" and click on "Close" of "Operation" column
  Then I enter text area "Remark" with value "Testing" in the popup dialog window
  Then I click on "Confirm" button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Close Till" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The till is closed when the organization and till status is Frozen"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues      | SearchBy                      | SearchValue      | Status        |
  | Table.Organization | ShortCode.NewOrg | Label.Organization Short Code | ShortCode.NewOrg | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorCloseTillviaWebTillStatusPendingActive!
Scenario: Exception_SP Operator Close Till via Web_Till Status Pending Active
  Given I login to Fintech as "sp" operator
  Given I generate name "TillMSISDN" with value "2665000_RAND_4"
  Given I generate name "TillNumber" with value "20_RAND_3"
  Then I create Till with below details
  | Short_Code           | MSISDN     | Till_Number | Language | Operator_ID | Product           |
  | ShortCode.ShortCode2 | TillMSISDN | TillNumber  | English  | ABC1        | Available Product |
  When I search for "Till" with below details
  | TableId    | TableValues | Query Condition                       | SearchBy          | Organization Short Code | Till Number | SearchValue | Status                |
  | Table.Till | TillNumber  | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | TillNumber  | TillNumber  | Status.Pending Active |
  Then I report "The till is queried successfully and the details page is displayed"
  Then I report "Sp operator unable to close Till via web when status is pending Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorCloseTillviaWebTillStatusActive!
#Need a active till number to work with this test case
Scenario:SP Operator Close Till via Web_ Till Status Active
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber8"
  Then I click on "Search" button in cite
  Then I check table "Table.Till" with multiple values as "Till.MpatOrgOne.TillNumber8" and click on "Close" of "Operation" column
  Then I enter text area "Remark" with value "Testing" in the popup dialog window
  Then I click on "Confirm" button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select drop down "Event" with option "DropDown.EventClosetill"
  Then I click on "Search" button in cite
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Close Till" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "SP operator close Till via Web when till status is active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorCloseTillviaWeb_TillStatusFrozen!
#Pending - need a active till number to work with this test case!
Scenario:SP Operator Close Till via Web_Till Status Frozen
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                 | SearchBy          | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber2 | Label.Till Number | Till.MpatOrgOne.TillNumber2 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I wait "5"
  Then I click on left child menu "Till" in the "Home" Page
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber2"
  Then I click on a "Search"
  Then I check table "Table.Till" with multiple values as "Till.MpatOrgOne.TillNumber2" and click on "Close" of "Operation" column
  Then I enter text area "Remark" with value "Testing" in the popup dialog window
  Then I click on "Confirm" button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Close Till" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The till is closed when the organization and till status is Frozen"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorChangeTillStatusViaWebOrganizationStatusIsFrozen!
Scenario:SP Operator Change Till Status via Web _ Organization Status Is Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  Then I click on "GenericLocators.ConfirmButton"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp_generic" operator
  Given I login to Fintech as "sp_generic" operator
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp" operator
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber9 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber9 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The Till status is changed to Frozen and when Organization Status is Frozen"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  Then I click on "GenericLocators.ConfirmButton"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp_generic" operator
  Given I login to Fintech as "sp_generic" operator
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp" operator
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber9 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber9 | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorChangeTillStatusviaWebfromFrozentoActive!
Scenario:SP Operator Change Till Status via Web from Frozen to Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber9 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber9 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  #Post-Requisite
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber9 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber9 | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I report "Sp operator can change The status and modified successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorChangeStatusviaWebfromActivetoFrozen!
Scenario:SP Operator Change Till Status via Web from Active to Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber9 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber9 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The status is selected and modified successfully."
  #Post-Requisite
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code   | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber9 | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.ShortCode | Till.MpatOrgOne.TillNumber9 | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SuspendedCustomerDeleteBeneficiary!
Scenario: Suspended Customer Delete Beneficiary. Exception - The Initiator Status Invalid
  Given I generate name "BeneficiaryMSISDN" with value "Beneficiary.RegisteredCustomer.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "Beneficiary.RegisteredCustomer.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                       | SearchBy     | SearchValue                       | Status        |
  | Table.CustomerInIdentity | Handset.RegisteredCustomer.MSISDN | Label.MSISDN | Handset.RegisteredCustomer.MSISDN | Status.Active |
  Then I edit Identity Status of customer with value "Suspended"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerRejectedSuspended" on "Handset.RegisteredCustomer"
  Then I edit Identity Status of customer with value "Active"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Then I report "The Suspended Customer can't delete beneficiary"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionPINIncorrect!
Scenario: Exception - PIN Incorrect
  Given I generate name "BeneficiaryMSISDN" with value "Beneficiary.RegisteredCustomer.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "Beneficiary.RegisteredCustomer.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I generate name "WrongPin" with value "RAND_5"
  Given I generate name "Amount" with value "RAND_2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.SendMoneyToBeneficiaryWithWrongPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.SendMoneyRejected" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Then I report "Customer can't send money to Beneficiary via USSD if pin is incorrect"

@TC_FINLSO_REG2_CustomerDeleteOrganizationBeneficiary!
Scenario: Customer Delete Organization Beneficiary via USSD
  Given I generate name "BeneficiaryTopOrg" with value "Beneficiary.TopOrganization.ShortCode"
  Given I generate name "BeneficiaryTopOrgName" with value "Beneficiary.TopOrganization.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryOrganization" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryOrganizationAccepted" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryOrganization" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryOrganizationAccepted" on "Handset.RegisteredCustomer"
  Then I report "Customer Delete Organization Beneficiary via USSD"

@TC_FINLSO_REG2_ExceptionPINIncorrectToAddBeneficiary!
Scenario: Customer Can't Add Beneficiary using Incorrect PIN. Exception - PIN Incorrect
  Given I generate name "BeneficiaryMSISDN" with value "Beneficiary.RegisteredCustomer.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "Beneficiary.RegisteredCustomer.Name"
  Given I generate name "WrongPin" with value "RAND_5"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomerWrongPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerRejected" on "Handset.RegisteredCustomer"
  Then I report "Customer Can't Add Beneficiary using Incorrect PIN"

@TC_FINLSO_REG2_CustomerDeleteUnregCusBeneficiary!
Scenario: Customer Delete Unregistered Customer Beneficiary via USSD
  Given I generate name "BeneficiaryMSISDN" with value "Beneficiary.UnregisteredCustomer.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "Beneficiary.UnregisteredCustomer.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Then I report "Customer can delete Unregistered Customer Beneficiary via USSD"

@TC_FINLSO_REG2_CustomerDeleteRegCustomerBeneficiary!
Scenario: Customer Delete Registered Customer Beneficiary via USSD
  Given I generate name "BeneficiaryMSISDN" with value "Beneficiary.RegisteredCustomer.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "Beneficiary.RegisteredCustomer.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select the customer "Customer.Registered_Customer_Active"
  Then I select drop down "Event" with option "DropDown.DeleteBeneficiary"
  Then I click on a "Search"
  Then I check table "Table.IdentityAuditlog" with multiple values as "Customer" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseForViewDetails"
  Then I report "Customer can delete Registered Customer Beneficiary via USSD"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPLookupBeneficiaryViaWeb!
Scenario:SP Operator Lookup Beneficiary via Web
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                         | SearchBy     | SearchValue                         | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer_Active | Label.MSISDN | Customer.Registered_Customer_Active | Status.Active |
  Then I wait "5"
  Then I click on "GenericLocators.BeneficiaryList"
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|LookUp Beneficiary" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_TheOrganizationNotActive!
Scenario: Exception - The Organization Not Active
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues                           | SearchBy                      | SearchValue                           | Status        |
  | Table.Organization | Beneficiary.TopOrganization.ShortCode | Label.Organization Short Code | Beneficiary.TopOrganization.ShortCode | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  Given I generate name "BeneficiaryTopOrg" with value "Beneficiary.TopOrganization.ShortCode"
  Given I generate name "BeneficiaryTopOrgName" with value "Beneficiary.TopOrganization.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryOrganization" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryOrganizationRejected" on "Handset.RegisteredCustomer"
  Then I edit Identity Status in "Organization" with value "Active"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select drop down "Initiator Type" with option "DropDown.Customer"
  Then I select the customer "Customer.Registered_Customer_Active"
  Then I select drop down "Event" with option "DropDown.AddBeneficiary"
  Then I click on a "Search"
  Then I check table "Table.IdentityAuditlog" with multiple values as "Customer" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseForViewDetails"
  Then I report "Customer can't add Organization beneficiary if it is in Frozen State"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionTheShortCodeNotExist!
Scenario: Exception - The Short Code Not Exist
  Given I generate name "BeneficiaryTopOrg" with value "RAND_6"
  Given I generate name "BeneficiaryTopOrgName" with value "TopOrg_RAND_4"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryOrganization" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryOrganizationNotExistRejected" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select drop down "Initiator Type" with option "DropDown.Customer"
  Then I select the customer "Customer.Registered_Customer_Active"
  Then I select drop down "Event" with option "DropDown.AddBeneficiary"
  Then I click on a "Search"
  Then I check table "Table.IdentityAuditlog" with multiple values as "Customer" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseForViewDetails"
  Then I report "Customer can't add Organization beneficiary if it is not Exist"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_CustAddOrgBeneficiaryViaUSSD!
Scenario: Customer Add Organization Beneficiary via USSD
  Given I generate name "BeneficiaryTopOrg" with value "Beneficiary.TopOrganization.ShortCode"
  Given I generate name "BeneficiaryTopOrgName" with value "Beneficiary.TopOrganization.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryOrganization" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryOrganizationAccepted" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select the customer "Customer.Registered_Customer_Active"
  Then I select drop down "Event" with option "DropDown.AddBeneficiary"
  Then I click on "GenericLocators.SearchButtonInIdAudLog"
  Then I check table "Table.IdentityAuditlog" with multiple values as "Customer" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseForViewDetails"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryOrganization" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryOrganizationAccepted" on "Handset.RegisteredCustomer"
  Then I report "Customer can add Organization beneficiary via USSD"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionReceiverAlreadyExistInBeneficiaryList!
Scenario: Exception - Receiver Already Exist in the Beneficiary List
  Given I generate name "BeneficiaryMSISDN" with value "Beneficiary.RegisteredCustomer.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "Beneficiary.RegisteredCustomer.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryAlreadyExist" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select the customer "Customer.Registered_Customer_Active"
  Then I select drop down "Event" with option "DropDown.AddBeneficiary"
  Then I click on "GenericLocators.SearchButtonInIdAudLog"
  Then I check table "Table.IdentityAuditlog" with multiple values as "Customer" and click on "Detail" of "Operation" column
  When static text "The beneficiary already exists" is visible
  Then I click on "GenericLocators.CloseForViewDetails"
  Then I report "Customer can't add Customer Beneficiary if it already exist in the list"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_CustAddRegCustBeneficiaryViaUSSD!
Scenario: Customer Add Registered Customer Beneficiary via USSD
  Given I generate name "BeneficiaryMSISDN" with value "Beneficiary.RegisteredCustomer.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "Beneficiary.RegisteredCustomer.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select the customer "Customer.Registered_Customer_Active"
  Then I select drop down "Event" with option "DropDown.AddBeneficiary"
  Then I click on "GenericLocators.SearchButtonInIdAudLog"
  Then I check table "Table.IdentityAuditlog" with multiple values as "Customer" and click on "Detail" of "Operation" column
  When static text "success" is visible
  Then I click on "GenericLocators.CloseForViewDetails"
  Then I report "Customer can add Registered Customer Beneficiary via USSD"
  Then I logout the "sp" portal and close the browser
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"

@TC_FINLSO_REG2_CreateTillMaintainABlacklistOfIdentifiersViaPortal!
Scenario:Create Till Maintain A Blacklist Of Identifiers Via Portal
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "Till.MpatOrgOne.ShortCode"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I wait "5"
  Then I click on "GenericLocators.TillAutogeneratecode"
  Then I wait "5"
  Then I scroll "GenericLocators.SelectAllButtonTill" to view using "false" parameter
  Then I select drop down "Language" with option "DropDown.Southern Sotho"
  Then I scroll "GenericLocators.SelectAllButtonTill" to view using "false" parameter
  Then I click on "GenericLocators.CheckboxforTill"
  Then I click on "GenericLocators.SelectAllButtonTill"
  Then I click on "Submit" button in cite
  Then I click on "View Detail" to check
  Then I report "The SP operator can Create Till Maintain A Blacklist Of Identifiers Via Portal"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_CreateChildOrgMaintainABlacklistOfIdentifiersViaPortal!
Scenario:Create Child Org Maintain A Blacklist Of Identifiers Via Portal
  Given I login to Fintech as "sp" operator
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Child Organization "
  Then I click on " Add " button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  #Then I scroll "GenericLocators.ProductName" to view using "false" parameter
  #Then I click on checkbox "GenericLocators.Product" with text "Product Name"
  Then I enter text for "GenericLocators.ParentShortCode" with value "ShortCode.MpatOrgOne"
  Then I wait "5"
  Then I click on "GenericLocators.AutoGenerateIdentitier"
  Then I wait "5"
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I scroll "GenericLocators.Language" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_One"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.IdentityModel"
  Then I click on "GenericLocators.OptionOwned"
  Then I click on "GenericLocators.ChildSubAgentModel"
  Then I click on "GenericLocators.OptionOwned"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.CreateSubmit"
  When static text "Child organization created successfully, please wait for approving." is visible
  Then I click on "View Detail" to check
  Then I report "The SP Operator can Create Child Org Maintain A Blacklist Of Identifiers Via Portal"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_CreateTopOrgMaintainABlacklistOfIdentifiersViaPortal!
Scenario:Create Top Org Maintain A Blacklist Of Identifiers Via Portal
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I click on " Add " button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I scroll "GenericLocators.ProductName" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product Name"
  Then I scroll page to bottom
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I wait "5"
  Then I click on "GenericLocators.AutoGenerateIdentitier"
  Then I wait "5"
  Then I select drop down "Preferred Notification Channel" with option "Label.Email"
  Then I enter text in "Notification Receiving E-MAIL" with value "Test Email"
  Then I scroll "GenericLocators.Language" to view using "false" parameter
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.AggregatorModel"
  Then I click on "GenericLocators.OptionModel"
  Then I click on "GenericLocators.CentralOwnedModel"
  Then I click on "GenericLocators.OptionModel"
  Then I select drop down "Sub Agent Expansion Model" with option "Can Make AllType"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  Then I report "Top organization created successfully, please wait for approving."
  Then I click on "View Detail" to check
  Then I report "The SP Operator can Create Top Org Maintain A Blacklist Of Identifiers Via Portal"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionAutogeneratedShortcodeHasexistWhenCreateChildOrg!
Scenario: Exception_Autogenerated Shortcode Has exist When Create Child Org
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "ChildOrg_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Child Organization "
  Then I scroll "GenericLocators.AutoGenerateIdentitier" to view using "false" parameter
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.Checkbox"
  Then I click on "GenericLocators.ConfirmTopOrg"
  Then I scroll "GenericLocators.ParentShortCode" to view using "false" parameter
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I enter text for "GenericLocators.CreateTopOrgShortCode" with value "ShortCode.ShortCode1"
  Then I enter text for "GenericLocators.ParentShortCode" with value "ShortCode.ShortCode1"
  Then I wait "3"
  When static text "The short code is existed." is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionAutogeneratedShortcodeHasexistWhenCreateTopOrg!
Scenario:Exception_ Autogenerated Shortcode Has exist When Create Top Org
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I scroll "GenericLocators.AutoGenerateIdentitier" to view using "false" parameter
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.Checkbox"
  Then I click on "GenericLocators.ConfirmTopOrg"
  Then I scroll "GenericLocators.CreateTopOrgShortCode" to view using "false" parameter
  Then I enter text for "GenericLocators.CreateTopOrgShortCode" with value "ShortCode.ShortCode1"
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  When static text "The short code is existed" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionTheAvailableShortcodeUsedUpWhenCreateChildOrg!
Scenario: Exception_The Available Shortcode Used Up When Create Child Org
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "ChildOrg_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Child Organization "
  Then I click on "Add" button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I scroll "GenericLocators.ProductName" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product Name"
  Then I enter text for "GenericLocators.ParentShortCode" with value "ShortCode.MpatOrgOne"
  Then I enter text for "GenericLocators.CreateTopOrgShortCode" with value "ShortCode.NewOrg"
  Then I wait "3"
  Then I click on "GenericLocators.AutoGenerateIdentitier"
  When static text "The short code is existed." is visible
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I scroll "GenericLocators.Language" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_One"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.IdentityModel"
  Then I click on "GenericLocators.OptionOwned"
  Then I click on "GenericLocators.ChildSubAgentModel"
  Then I click on "GenericLocators.OptionOwned"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.CreateSubmit"
  When static text "Child organization created successfully, please wait for approving." is visible
  Then I click on "View Detail" to check
  Then I report "The SP Operator can create Child Owned Organization via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionTheAvailableShortcodeUsedUpWhenCreateTopOrg!
Scenario: Exception_The Available Shortcode Used Up When Create Top Org
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I click on "Add" button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I scroll "GenericLocators.ProductName" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product Name"
  Then I scroll "GenericLocators.AutoGenerateIdentitier" to view using "false" parameter
  Then I enter text for "GenericLocators.CreateTopOrgShortCode" with value "ShortCode.NewOrg"
  Then I click on "GenericLocators.AutoGenerateIdentitier"
  When static text "The short code is existed" is visible
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I scroll "GenericLocators.Language" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_One"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.AggregatorModel"
  Then I click on "GenericLocators.OptionModel"
  Then I click on "GenericLocators.CentralOwnedModel"
  Then I click on "GenericLocators.OptionModel"
  Then I select drop down "Sub Agent Expansion Model" with option "Can Make AllType"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.CreateSubmit"
  Then I report "Top organization created successfully, please wait for approving."
  Then I click on "View Detail" to check
  Then I report "The SP Operator can create Top Organization via Web with Email"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_CreateChildOrgAutomaticShortcodeAssignmentViaPortal!
Scenario:Create Child Org Automatic Shortcode Assignment Via Portal
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "ChildOrg_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Child Organization "
  Then I click on "Add" button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I scroll "GenericLocators.ProductName" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product Name"
  Then I enter text for "GenericLocators.ParentShortCode" with value "ShortCode.MpatOrgOne"
  Then I click on "GenericLocators.AutoGenerateIdentitier"
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I scroll "GenericLocators.Language" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_One"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.IdentityModel"
  Then I click on "GenericLocators.OptionOwned"
  Then I click on "GenericLocators.ChildSubAgentModel"
  Then I click on "GenericLocators.OptionOwned"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.CreateSubmit"
  When static text "Child organization created successfully, please wait for approving." is visible
  Then I click on "View Detail" to check
  Then I report "The SP Operator can create Child Owned Organization via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_CreateTopOrgAutomaticShortcodeAssignmentViaPortal!
Scenario: Create Top Org Automatic Shortcode Assignment Via Portal
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I click on "Add" button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I scroll "GenericLocators.ProductName" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product Name"
  Then I scroll "GenericLocators.AutoGenerateIdentitier" to view using "false" parameter
  Then I click on "GenericLocators.AutoGenerateIdentitier"
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I scroll "GenericLocators.Language" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.Email"
  Then I enter text in "Notification Receiving E-MAIL" with value "Test Email"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.AggregatorModel"
  Then I click on "GenericLocators.OptionModel"
  Then I click on "GenericLocators.CentralOwnedModel"
  Then I click on "GenericLocators.OptionModel"
  Then I select drop down "Sub Agent Expansion Model" with option "Can Make AllType"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.CreateSubmit"
  Then I report "Top organization created successfully, please wait for approving."
  Then I click on "View Detail" to check
  Then I report "The SP Operator can create Top Organization via Web with Email"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_BusinessWithdrawviaSPPortalDifferrentTopOrganization
Scenario: Business Withdraw via SP Portal_Differrent Top Organization
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I wait "5"
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessWithdraw"
  Then I select drop down "Identifier Type" with option "Short Code"
  Then I wait "5"
  Then I enter text in "Label.Short Code" with value "ShortCode.OrgOper"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "GenericLocators.ReasonInTransaction"
  Then I click on "GenericLocators.InputManualyinTransaction"
  Then I scroll "GenericLocators.ReasonInTransaction" to view using "false" parameter
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "3"
  Then I click on " Continue " button in cite
  Then I report "Business Deposit for Different Top Organization is successfully done"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_BusinessWithdrawviaCreditIdentityStatusInvalid!
Scenario: Exception _Business Withdraw via SP PORTAL _Credit Identity Status Invalid
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessWithdraw"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg2"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Testing"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I click on "Confirm" button in cite
  Then I report "Exception Business Withdraw Credit Identity Status Invalid"
  Then I close tab near to home tab
  #Post-Requisite
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionBusinessWithdrawviaSPPortalSameTopOrganizationpayerIdentityStatusInvalid!
Scenario: Exception_Business Withdraw via SP Portal_Same Top Organization_payer Identity Status Invalid
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessWithdraw"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg2"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Testing"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I check error text "The status of the participant 101100150000009414017 is Suspended, not in tradable status." is displayed
  Then I click on "Confirm" button in cite
  Then I report "Exception Business Deposit Credit Identity Status Invalid"
  Then I close tab near to home tab
  #Post-Requisite
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status           |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Suspended |
  Then I edit Identity Status in "Organization" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_Exception_BusinessWithdrawviaSPPortalBalanceNotEnough!
Scenario:Exception_Business Withdraw via SP Portal_Balance Not Enough
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessWithdraw"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg2"
  Then I enter text in "Label.Amount" with value "Amount.Limit100000"
  Then I enter text area "Remark" with value "Testing"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I check error text "The account balance is insufficient." is displayed
  Then I click on "Confirm" button in cite
  Then I report "Exception Business Withdraw Balance Not Enough"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_BusinessWithdrawviaSPPortalSameTopOrganization!
Scenario: Business Withdraw via SP Portal_Same Top Organization
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessWithdraw"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg2"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Testing"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Initiate Transaction submitted successfully." is visible
  Then I click on "GenericLocators.ReviewTransaction"
  Then I click on " Credit " checkbox
  Then I click on a "Search"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_BusinessDepositviaSPPORTALDifferentTopOrganization
Scenario:Business Deposit via SP PORTAL _Different Top Organization
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues      | SearchBy                      | SearchValue      | Status        |
  | Table.Organization | ShortCode.NewOrg | Label.Organization Short Code | ShortCode.NewOrg | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessDeposit"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewChlidOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Test"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Initiate Transaction submitted successfully." is visible
  Then I report "Business Deposit for Different Top Organization is successfully done"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_BusinessDepositviaCreditIdentityStatusInvalid!
Scenario: Exception _Business Deposit via SP PORTAL _Credit Identity Status Invalid
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessDeposit"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewChlidOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Testing"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I click on "Confirm" button in cite
  Then I report "Exception Business Deposit Credit Identity Status Invalid"
  Then I close tab near to home tab
  #Post-Requisite
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionBusinessDepositviaSPPORTALPayerIdentityStatusInvalid!
Scenario:Exception _Business Deposit via SP PORTAL _Payer Identity Status Invalid
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue      | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessDeposit"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewChlidOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Testing"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I check error text "The status of the participant 101100250000001105006 is Suspended, not in tradable status." is displayed
  Then I click on "Confirm" button in cite
  Then I report "Exception Business Deposit Credit Identity Status Invalid"
  Then I close tab near to home tab
  #Post-Requisite
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues      | SearchBy                      | SearchValue      | Status           |
  | Table.Organization | ShortCode.NewOrg | Label.Organization Short Code | ShortCode.NewOrg | Status.Suspended |
  Then I edit Identity Status in "Organization" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionBusinessDepositviaSPPORTALBalanceNotEnough!
Scenario: Exception _Business Deposit via SP PORTAL _Balance Not Enough
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessDeposit"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewChlidOrg"
  Then I enter text in "Label.Amount" with value "Amount.Limit100000"
  Then I enter text area "Remark" with value "Testing"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I check error text "The account balance is insufficient." is displayed
  Then I click on "Confirm" button in cite
  Then I report "Exception Business Deposit Balance Not Enough"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_BusinessDepositviaSPPORTALSameTopOrganization!
Scenario: Business Deposit via SP PORTAL _Same Top Organization
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessDeposit"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewChlidOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Testing"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Initiate Transaction submitted successfully." is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionTransferFromMerchantPayToMerchantViaWEB!
Scenario:Exception_Transfer From Merchant Pay To Merchant Via WEB
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.MerchantToMerchant"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg2"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I check error text "The trade type is not supported." is displayed
  Then I click on "Confirm" button in cite
  Then I report "Exception while Transfering From Merchant Pay To Merchant Via WEB with in the same organization"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionCreditIdentityStatusInvalid!
Scenario:Exception_Credit Identity Status Invalid
  Given I login to Fintech as "sp" operator
  #Pre-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.MerchantToMerchant"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewChlidOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I check error text "The status of the participant 101100150000009414017 is Frozen, not in tradable status." is displayed
  Then I click on "Confirm" button in cite
  Then I report "Exception while Transfering From Merchant Pay To Merchant Via WEB when payee status is Frozen"
  #Post-Requisite
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionDebitIdentityStatusInvalid!
Scenario:Exception_Debit Identity Status Invalid
  Given I login to Fintech as "sp" operator
  #Pre-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.MerchantToMerchant"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewChlidOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I check error text "The status of the participant 101100150000009414017 is Frozen, not in tradable status." is displayed
  Then I click on "Confirm" button in cite
  Then I report "Exception while Transfering From Merchant Pay To Merchant Via WEB when payee status is Frozen"
  #Post-Requisite
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_ExceptionBalanceNotEnough!
Scenario:Exception_Balance Not Enough
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessDeposit"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg"
  Then I enter text in "Label.Amount" with value "Amount.Limit100000"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I check error text "The account balance is insufficient." is displayed
  Then I click on "Confirm" button in cite
  Then I report "Exception:The account balance is insufficient and unable to complete the transaction"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_TransferFromMerchantPayToMerchantViaWEB!
Scenario:Transfer From Merchant Pay To Merchant Via WEB
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I click on " Search " button in cite
  Then I check table "Table.Organization" with multiple values as "ShortCode.MpatOrgOne" and click on "Detail" of "Operation" column
  Then I wait "5"
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.MerchantToMerchant"
  Then I select drop down "Identifier Type" with option "DropDown.ShortCode"
  Then I enter text in "Label.Short Code" with value "ShortCode.ShortCode2"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I click on " Continue " button in cite
  When static text "Initiate Transaction submitted successfully." is visible
  Then I click on " View Detail >> " to check
  Then I report "Transfer From Merchant Pay To Merchant Via WEB is Successfully Completed"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_TransferFromBusinessTransfersFromUtilityCollectionAccountViaWEB!
#Need Account balance to execute this testcase
Scenario:Transfer From Business Transfers from Utility Collection Account Via WEB
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessTransfersfromUtilityCollectionAccount"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I report "Transfer From Business Transfers from Utility Collection Account Via WEB is Successfully Completed"
  When static text "Initiate Transaction submitted successfully." is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_TransferFromBusinessTransfersUtilityDisbursementM-PESAAccountViaWEB!
Scenario:Transfer From Business Transfers - Utility Disbursement to/from M-PESA Working Account Via WEB
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessTransfers-UtilityDisbursementto/fromM-PESA Working Account"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I report "Transfer Business Transfers - Utility Disbursement to/from M-PESA Working Account Via WEB Successfully Completed"
  When static text "Initiate Transaction submitted successfully." is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatorCloseTillviaWeb_OrganizationStatusFrozen!
Scenario:SP Operator Close Till via Web_Organization Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues      | SearchBy                      | SearchValue      | Status        |
  | Table.Organization | ShortCode.NewOrg | Label.Organization Short Code | ShortCode.NewOrg | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I wait "5"
  Then I click on left child menu "Till" in the "Home" Page
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber2"
  Then I click on a "Search"
  Then I check table "Table.Till" with multiple values as "Till.MpatOrgOne.TillNumber2" and click on "Close" of "Operation" column
  Then I enter text area "Remark" with value "Testing" in the popup dialog window
  Then I click on "Confirm" button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Close Till" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The till is closed when the organization status is Frozen"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues      | SearchBy                      | SearchValue      | Status        |
  | Table.Organization | ShortCode.NewOrg | Label.Organization Short Code | ShortCode.NewOrg | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatortoChangeTillProductWhenThetillisintheFrozenstateandthetillorganizationisintheActivestate!
Scenario:Change Till Product When The till is in the Frozen state and the till organization is in the Active state
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                  | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                  | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber10 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.TillNumber10 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I wait "5"
  Then I report "Query the till successfully, The till details page is displayed"
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I click on "Add Product" button in cite
  Then I click on "AddProduct.C2BBusiness-UtlityPaymentTill" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I report "The Product is successfully modified. The modification is successfully submitted."
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  #Post-Requisite
  Then I close tab near to home tab
  When I search for "Till" with below details
  | TableId    | TableValues                  | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                  | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber10 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.TillNumber10 | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG2_SPOperatortoChangeTillProductWhenThetillisintheFrozenstateandthetillorganizationisintheFrozenstate!
Scenario:Change Till Product When The till is in the Frozen state and the till organization is in the Frozen state
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Till" with below details
  | TableId    | TableValues                  | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                  | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber10 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.TillNumber10 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I wait "5"
  Then I report "Query the till successfully, The till details page is displayed"
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I click on "Add Product" button in cite
  Then I click on "AddProduct.C2BBusiness-UtlityPaymentTill" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I report "The Product is successfully modified. The modification is successfully submitted."
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  #Post-Requisite
  When I search for "Till" with below details
  | TableId    | TableValues                  | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                  | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber10 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.TillNumber10 | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I wait "5"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser
