@FINLSO_GP_REG

Feature: Fintech2.0 Gptc Regression Test case

@TC_FINLSO_REG_SearchCustomerIdentityIDCustomerActiveStatus!
# Passed
Scenario:Search Customer by Identity ID When Customer is in the Active Status
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | Customer Type | Identity ID           | btnName     | SecretAnswer |
  | Identity Id     | All           | 101100210001000301015 | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Search Customer by Identity ID When Customer is in the Active Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SearchCustomerMiddleNameCustomerInCappedStatus!
#Passed
Scenario:Search Customer by MiddleName When Customer is in the Capped Status
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Capped"
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  Then I wait "3"
  When I verify customer from Take a Call
  | Query Condition     | Middle Name      | btnName     | SecretAnswer |
  | DropDown.MiddleName | MiddlenameActive | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Search Customer by MiddleName When Customer is in the Capped Status"
  Then I logout the "sp" portal and close the browser
  #Post-Requisite
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Active"
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SearchCustomerByDateOfBirthWhenCustomerIsInFrozenStatus!
# Passed
Scenario:Search Customer by Date of Birth When Customer is in the Frozen Status
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Frozen"
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  Then I wait "3"
  When I verify customer from Take a Call
  | Query Condition      | Date of Birth     | btnName     | SecretAnswer |
  | DropDown.DateOfBirth | DateOfBirthActive | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Search Customer by Date of Birth When Customer is in the Frozen Status"
  Then I logout the "sp" portal and close the browser
  Then I wait "3"
  #Post-Requisite
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Active"
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"

@TC_FINLSO_REG_SearchCustomerLastNameCustomerInSuspendedStatus!
#Passed
Scenario:Search Customer by LastName When Customer is in the Suspended Status
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Suspended"
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  Then I wait "3"
  When I verify customer from Take a Call
  | Query Condition            | First Name | Last Name      | btnName     | SecretAnswer |
  | DropDown.FirstNameLastName |            | LastnameActive | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Search Customer by LastName When Customer is in the Suspended Status"
  Then I logout the "sp" portal and close the browser
  Then I wait "3"
  #Post-Requisite
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Active"
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"

@TC_FINLSO_REG_SearchCustomerFirstNameCustomerPendingActiveStatus!
#Passed
Scenario:Search Customer by FirstName When Customer is in the Pending Active Status
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition            | First Name       | Last Name | btnName     | SecretAnswer |
  | DropDown.FirstNameLastName | FirstnamePending |           | Button.Pass | qwer         |
  Then I click on " Verify " button in cite
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Search Customer by FirstName When Customer is in the Pending Active Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SearchOrgOperatorByUserNameOrgOperatorInActiveStatus!
# passed
Scenario:Search OrgOperator By User Name When OrgOperator is in the Active Status
  Given I login to Fintech as "sp" operator
  When I verify organization operator from Take a Call
  | UserName          | PassOrFail |
  | OrgUsernameActive | pass       |
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Sp operator Search OrgOperator By User Name When OrgOperator is in the Active Status is successful"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SearchOrgOperatorByOperatorIDOrgOperatorInActiveStatus!
# Passed
Scenario:Search OrgOperator By Operator ID When OrgOperator is in the Active Status
  Given I login to Fintech as "sp" operator
  When I verify organization operator from Take a Call
  | OperatorID                    | PassOrFail |
  | OrgOperator.DefaultOperatorId | pass       |
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Sp operator Search OrgOperator By Operator ID When OrgOperator is in the Active Status is successful"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_ExceptionTheAvailableTillNumUsedUpWhenCreateTill!
Scenario: Exception_The Available Till Num Used Up When Create Till
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.NewShortCode"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text for "GenericLocators.CreateTillNo" with value "Till.MpatOrgOne.UsedTill"
  Then I select drop down "Language" with option "DropDown.English"
  Then I wait "3"
  When static text "till number has been used" is visible
  Then I report "The Exception can be seen when we enter already used till number"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_CancelTheSSOlogoutsuccessfully!
Scenario:Cancel the SSO logout successfully
  Given I login to Fintech as "sp" operator
  Then I wait "5"
  Then I click on "GenericLocators.LogoutDropdown"
  Then I click on "GenericLocators.Logout"
  Then I click on "GenericLocators.Logout_No"
  Then I report "The SP portal is still displayed on the home page."

@TC_FINLSO_REG_TheSSOLogoutSuccessful!
Scenario:The SSO logout is successful
  Given I login to Fintech as "sp" operator
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Security Audit Log" in the "Home" Page
  Then I select drop down "Event" with option "DropDown.LogoutSuccess"
  Then I click on "Search" button in cite
  Then I report "The audit Log of Logout Success is recorded completely."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_ExceptionTheSSOloginIsFailedWithTheIncorrectPassword!
Scenario:Exception_ The SSO login is failed with the incorrect password
  Given I login to Fintech as "spIncorrectPass" operator
  Then I check error text "Incorrect username, password, or status." is displayed
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Security Audit Log" in the "Home" Page
  Then I select drop down "Event" with option "DropDown.LoginFailure"
  Then I click on "Search" button in cite
  Then I report "The audit Log of Login Failure is recorded completely."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorCreateTillWithNakedNumberViaWeb!
Scenario:SP Operator Create Till_with Naked Number via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "Till.MpatOrgOne.ShortCode"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I wait "5"
  Then I click on "GenericLocators.TillAutogeneratecode"
  Then I select drop down "Language" with option "DropDown.English"
  Then I scroll "GenericLocators.AvailableProduct" to view using "false" parameter
  Then I wait "5"
  Then I click on "GenericLocators.AvailableProductCheckbox"
  Then I click on "GenericLocators.AvailableProductArrow"
  Then I click on "Submit" button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|LookUp Beneficiary" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SearchOrgOperatorByOrganizationShortCodeOrgOperatorInActiveStatus!
# Passed
Scenario:Search OrgOperator By Organization Short Code When OrgOperator is in the Active Status
  Given I login to Fintech as "sp" operator
  When I verify organization operator from Take a Call
  | ShortCode            | PassOrFail |
  | ShortCode.ShortCode1 | pass       |
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Search OrgOperator By Organization Short Code When OrgOperator is in the Active Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SearchCustomerByLastNameCustomerActive!
#Passed
Scenario:Search Customer by LastName When Customer is in the Active Status
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition            | First Name | Last Name      | btnName     | SecretAnswer |
  | DropDown.FirstNameLastName |            | LastnameActive | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Search Customer by LastName When Customer is in the Active Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SearchCustomerByFirstNameLastNameCustomerActiveStatus!
#Passed
Scenario:Search Customer by FirstName and LastName When Customer is in the Active Status
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition            | First Name      | Last Name      | btnName     | SecretAnswer |
  | DropDown.FirstNameLastName | FirstnameActive | LastnameActive | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "Search Customer by FirstName LastName When Customer is in the Active Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPLookupBeneficiaryViaWeb!
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

@TC_FINLSO_REG_LoginTheOrganizationPortalFirstLoginTheOrganizationPortalSuccesed!
#Note-Need a new credential to excecute this testcase
Scenario:Login The Organization Portal_First Login The Organization Portal Succesed
  Given I login to Fintech as "orgSecond" operator
  Then I enter text in "Old Password" with value "Login.orgSecond.password"
  Then I enter text in "New Password" with value "Login.OrgportalNewPassword.NewPassword"
  Then I enter text in "Confirm Password" with value "Login.OrgportalNewPassword.Confirmpassword1"
  Then I click on "Next" button in cite

@TC_FINLSO_REG_LoginOrganizationPortalException_DoNotSelectanyProductToCreateCustomer!
Scenario:Exception_Do Not Select any Product To Create Customer
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.Customor"
  Then I click on "Create" button in cite
  Then I Switch tab
  Then I enter text in "Label.FirstName" with value "Service"
  Given I generate name "MSISDN" with value "8613300002001_RAND_4"
  Given I generate name "MSISDN" with value "8613300002001_RAND_4"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text in "Label.LastNameInorgpage" with value "LastName"
  Then I click on "GenericLocators.DateInorgportal"
  Then I click on "GenericLocators.DateofBirth"
  Then I scroll "GenericLocators.ScrollAddressDetail" to view using "false" parameter
  Then I enter text in "Label.CityorTownInorgpage" with value "city"
  Then I select drop down "Secret Question" with option "DropDown.SecretQuestion"
  Then I enter text for "GenericLocators.SecretAnswer" with value "Placeofbirth"
  Then I click on "Next" button in cite
  Then I check error text "Please add" is displayed
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_LoginOrganizationPortaltoCreateCustomeronOrgnizationPortal_AddProductsonTheEnterDetailspage!
Scenario:Create Customer on Orgnization Portal_Add Products on The Enter Details page
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.Customor"
  Then I click on "Create" button in cite
  Then I Switch tab
  Then I click on " Add " button in cite
  Then I click on "GenericLocators.DateofBirthone"
  Then I click on "Confirm" button in cite
  Then I enter text in "Label.FirstName" with value "Service"
  Given I generate name "MSISDN" with value "8613300002001_RAND_4"
  Given I generate name "MSISDN" with value "8613300002001_RAND_4"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text in "Label.LastNameInorgpage" with value "LastName"
  Then I click on "GenericLocators.DateInorgportal"
  Then I click on "GenericLocators.DateofBirth"
  Then I scroll "GenericLocators.ScrollAddressDetail" to view using "false" parameter
  Then I enter text in "Label.CityorTownInorgpage" with value "city"
  Then I select drop down "Secret Question" with option "DropDown.Whatisyourfirstcellphone"
  Then I enter text in "Label.SecretAnswer" with value "Answer"
  Then I click on "Next" button in cite
  Then I report "Org operator can Create Customer on Orgnization Portal_Add Products on The Enter Details page"
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_TillCreationExceptionTillNumberisoutofRange!
Scenario: Till Creation_Exception_Till Number is out of Range
  Given I login to Fintech as "org" operator
  Given I generate name "TillOutOFRange" with value "10219324_RAND_9"
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I click on "GenericLocators.CreateTillOrg"
  Then I Switch tab
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I enter text in "Label.Till Number" with value "TillOutOFRange"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  When static text "The characters do not comply with the rule. The regular expression is '^([0-9A-Za-z]{4,12})$'." is visible
  Then I report "Till Number is out of Range"
  Then I wait "3"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_TillCreation_Exception_TillMSISDNisoutofRange!
Scenario: Till Creation_Exception_Till MSISDN is out of Range
  Given I login to Fintech as "org" operator
  Given I generate name "MSISDNOutOfRange" with value "8618799999999_RAND_6"
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I click on "Create" button in cite
  Then I Switch tab
  Then I enter text in "Label.MSISDN" with value "MSISDNOutOfRange"
  Then I enter text in "Label.Organization Short Code" with value ""
  When static text "Must be between 1 and 18 characters" is visible
  Then I report "The MSISDN is out of msisdn range"
  Then I wait "4"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_ExceptionTheOperatorIddoesnotexist!
Scenario: Exception_ The Operator Id does not exist
  Given I login to Fintech as "org" operator
  Given I generate name "OperatorID" with value "A12_RAND_4"
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I enter text in "Label.Operator ID Org" with value "OperatorID"
  Then I click on "Search" button in cite
  Then I wait "4"
  Then I report "The Operator Id does not exist and No records found."
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_ExceptionTheShortCodedoesnotexist!
Scenario: Exception_ The Short Code does not exist
  Given I login to Fintech as "org" operator
  Given I generate name "Shortcode" with value "02_RAND_4"
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "Shortcode"
  Then I click on "Search" button in cite
  When static text "The Organization Short Code is not existed" is visible
  Then I report "The ShortCode does not exist and No records found."
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_QueryAccountlistinMyOrganization!
Scenario: Query Account list in My Organization
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "My Organization " in org of the "Identity Center" Page
  Then I scroll "GenericLocators.ExportButton" to view using "false" parameter
  Then I report "The My Organization Account list displays normal."
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_QueryMyOrganizationInfo!
Scenario: Query My Organization Info
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "My Organization " in org of the "Identity Center" Page
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_ExceptionAutogeneratedTillNumHasexistWhenCreateTill!
Scenario: Exception_ Autogenerated Till Num Has exist When Create Till
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text for "GenericLocators.CreateTillNo" with value "Till.MpatOrgOne.TillNumber"
  Then I wait "3"
  Then I select drop down "Language" with option "DropDown.English"
  Then I check error text "till number has been used" is displayed
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_CusUnableTopUpOthers!
Scenario: CSTL-2145, 2140 Attempt that registered customer is unable to top up others Airtime, When Initiator PIN change is in pending status
  Given I generate name "NewPin" with value "RAND_6"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                         | SearchBy     | SearchValue                         | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer_Active | Label.MSISDN | Customer.Registered_Customer_Active | Status.Active |
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitResetCus"
  When static text "Reset PIN SUCCESS" is visible
  Then I logout the "sp" portal and close the browser
  Then I get the value of initial pin from "Handset.RegisteredCustomer" for sms "Messages.ResetPinGenerated" and store in "PinGenerated"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  Then I check whether the "Purchase Airtime" menu is not available in the handset
  When I select "Customer.ResetPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.ResetPinConfirmed" on "Handset.RegisteredCustomer"
  Then I replace the "Handset.RegisteredCustomer.PIN" key value with "NewPin" in the "fin_handset_testdata" json file
  Then I report "The Registered customer is unable to top up others Airtime, When Initiator PIN change is in pending status"

@TC_FINLSO_REG_SPOperatortoChangeTillProductWhenThetillisintheActivestateandthetillorganizationisintheActivestate!
Scenario:Change Till Product When The till is in the Active state and the till organization is in the Active state
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber9 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber9 | Status.Active |
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

@TC_FINLSO_REG_ServiceProviderBankAccount_EnsureDeleteBankAccount!
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

@TC_FINLSO_REG_ServiceProviderBankAccount_EnsureQueryBankAccount!
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
  Then I click on "GenericLocators.CloseViewInBank"
  Then I report "The Bank Account menu displays normally."
  Then I report "The operation options are available in the result column to query other details about the bank account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_EnsureServiceProviderCreateBankAccount!
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

@TC_FINLSO_REG_LoginTheOrganizationPortalExceptionnewpasswordandconfirmpasswordaredifferent!
Scenario: Login The Organization Portal_Exception_ new password and confirm password are different
  Given I login to Fintech as "orgSecond" operator
  Then I wait "2"
  Then I enter text in "Old Password" with value "Login.orgSecond.password"
  Then I enter text in "New Password" with value "Login.orgSecond.Newpassword"
  Then I enter text in "Confirm Password" with value "Login.orgSecond.Confirmpassword"
  Then I click on "Next" button in cite
  When static text "The two passwords are inconsistent." is visible
  Then I report "The Organization Portal Forgot new password and confirm password are different"

@TC_FINLSO_REG_LoginTheOrganizationPortalExceptionNewPasswordoutofrange!
Scenario: Login The Organization Portal_Exception_ New Password out of range
  Given I login to Fintech as "orgSecond" operator
  Then I wait "2"
  Then I enter text in "Old Password" with value "Login.orgSecond.password"
  Then I enter text in "New Password" with value "Login.orgSecond.MinimumPassword"
  Then I enter text in "Confirm Password" with value "Login.orgSecond.Confirmpassword"
  When static text "Must be between 8 and 255 characters" is visible
  Then I report "The Organization Portal Forgot New Password out of range"

@TC_FINLSO_REG_LoginTheOrganizationPortalExceptionIncorrectVerificationCode!
Scenario: Login The Organization Portal_Exception_ Incorrect Verification Code
  Given I navigate to Mpesa "org" portal
  Then I enter text in "Short Code" with value "Login.org.Shortcode"
  Then I enter text in "User Name" with value "Login.org.UserID"
  Then I enter text in "Password" with value "Login.org.password"
  Then I enter text in "Verification Code" with value "Login.orgIncorrectShortcode.Shortcode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "3"
  Then I click on " I Have Read And Agreed" button in cite
  Then I click on " Login " button in cite
  When static text "Incorrect verification code." is visible
  #Then I check error text "Incorrect verification code." is displayed
  Then I report "The organization operator login the portal failed with incorrect Verificationcode"

@TC_FINLSO_REG_LoginOrganizationPortalExceptionShortCodeDoesNotExist!
Scenario:Login The Organization Portal_Exception_The Short Code does not exist
  Given I login to Fintech as "orgIncorrectShortcode" operator
  Then I check error text "The organization does not exist." is displayed
  Then I report "The organization operator login the portal failed"

@TC_FINLSO_REG_LoginOrganizationPortalIncorrectPassword!
Scenario:Login The Organization Portal_Exception_ Incorrect Password
  Given I login to Fintech as "orgIncorrectPassword" operator
  When static text "Incorrect username, password, or status." is visible
  Then I report "The organization operator login the portal failed with incorrect password"

@TC_FINLSO_REG_SearchOrgOperatorByOrganizationShortCodeOrgOperatorInPendingActiveStatus!
# Passed
Scenario:Search OrgOperator By Organization Short Code When OrgOperator is in the Pending Active Status
  Given I login to Fintech as "sp" operator
  When I verify organization operator from Take a Call
  | ShortCode            | PassOrFail |
  | ShortCode.ShortCode3 | pass       |
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseView"
  Then I report "Search OrgOperator By Organization Short Code When OrgOperator is in the Pending Active Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SearchOrgOperatorByOrganizationShortCodeOperatorIDOrgOperatorInActiveStatus!
# Passed
Scenario:Search OrgOperator By Organization Short Code + Operator ID When OrgOperator is in the Active Status
  Given I login to Fintech as "sp" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | pass       |
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseView"
  Then I report "Sp operator Search OrgOperator By Organization Short Code + Operator ID When OrgOperator is in the Active Status is successful"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_EnsureSpCantCreateTillIfNumOutOfRange!
Scenario: till if till number out of range
  Given I login to Fintech as "sp" operator
  Given I generate name "TillNumber" with value "RAND_15"
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "Till.MpatOrgOne.ShortCode"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text in "Label.Till Number" with value "TillNumber"
  Then I select drop down "Language" with option "DropDown.English"
  When static text "The characters do not comply with the rule. The regular expression is '^([0-9A-Za-z]{4,12})$'." is visible
  Then I check error text "The characters do not comply with the rule. The regular expression is '^([0-9A-Za-z]{4,12})$'." is displayed
  Then I report "The SP operator can't create till if till number is out of range"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SpOperatorCantCreatetillIfMSISDNisoutofrange!
Scenario:Attempt SP operator can't be create till if till MSISDN is out of range
  Given I login to Fintech as "sp" operator
  Given I generate name "TillNumber" with value "ABC1234"
  Given I generate name "MSISDN" with value "8613300002001_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Till "
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode2"
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

@TC_FINLSO_REG_SPOperatortoLogintotheSPPortalandSitchtotheConfigPortal!
Scenario:Login to the SP Portal and Sitch to the Config Portal
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  Then I wait "5"
  Then I switch to previousTab
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_TopOrgBankAccEnsureDelBankAccount!
Scenario: Top Organization Bank Account - Ensure Delete Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankName" with value "Bank.HeadOffice"
  Given I generate name "AccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Given I generate name "AccName" with value "Test_RAND_4"
  Then I create top organization with below details
  | Product     | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Bank                    | Bank Branch     | Asset Type     | Currency      | Account Name | Account Number | Commission Settlement Configuration |
  | Super Agent | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | CENTRAL BANK OF LESOTHO | Bank.TopOrgBank | Bank.AssetType | Bank.Currency | AccName      | AccNo          | default settle template             |
  Then I click on " View Detail >> " to check
  Then I click on left child menu "Bank Account" in the "Home" Page
  Then I scroll "GenericLocators.Table" to view using "false" parameter
  Then I check table "Table.BankAccount" with multiple values as "TEST" and click on "Remove" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "GenericLocators.SubmitRemoveBan"
  #Post Requisite
  When I close "CloseOrganization" with below details
  | TableId                 | TableValues | SearchBy                      | SearchValue | Status        |
  | Table.CloseOrganization | ShortCode   | Label.Organization Short Code | ShortCode   | Status.Active |
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "Organization Bank Account is deleted Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_OrganizationBankAccountSetDefaultBankAccount!
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

@TC_FINLSO_REG_OrganizationBankAccountQueryBankAccount!
Scenario: Organization Bank Account_Ensure Query Bank Account
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue            | Status        |
  | Table.Organization | ShortCode.NewShortCode | Label.Organization Short Code | ShortCode.NewShortCode | Status.Active |
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I select the "bankHeadOffice" click on the "Standard Lesotho Bank"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewInBank"
  Then I report "Organization Bank Account Ensure Query Bank Account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_TopOrganizationBankAccountCreateBankAccount!
Scenario:Top Organization Bank Account_Ensure Create Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankName" with value "Bank.HeadOffice"
  Given I generate name "AccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Given I generate name "AccName" with value "Test_RAND_4"
  Then I create top organization with below details
  | Product     | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Bank                    | Bank Branch     | Asset Type     | Currency      | Account Name | Account Number | Commission Settlement Configuration |
  | Super Agent | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | CENTRAL BANK OF LESOTHO | Bank.TopOrgBank | Bank.AssetType | Bank.Currency | AccName      | AccNo          | default settle template             |
  Then I click on " View Detail >> " to check
  Then I click on left child menu "Bank Account" in the "Home" Page
  Then I scroll "GenericLocators.Table" to view using "false" parameter
  Then I check table "Table.BankAccount" with multiple values as "TEST" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewInBank"
  #Post Requisite
  When I close "CloseOrganization" with below details
  | TableId                 | TableValues | SearchBy                      | SearchValue | Status        |
  | Table.CloseOrganization | ShortCode   | Label.Organization Short Code | ShortCode   | Status.Active |
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "Organization Bank Account is Created Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorChangeTillDefaultOperatorIdviaWebOperatorStatusActive!
Scenario:SP Operator Change Till Default Operator Id via Web_ Operator Status Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code | Till Number                | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Default Operator Id with value "10022" and Remark as "Reason Description"
  Then I edit Default Operator Id with value "01000001" and Remark as "Reason Description"
  When static text "Default Operator Id edited successfully" is visible
  Then I report "SP Operator Change Till Default Operator Id via Web"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Default OperatorId" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_LoginTheOrganizationPortalExceptionEnteranincorrectanswer!
#pending need Another Login credentials
Scenario: Login The Organization Portal_Exception_ Enter an incorrect answer
  Given I navigate to Mpesa "orgFirst" portal
  Then I click on "GenericLocators.OrgPortalForgetPassword"
  Then I enter text in "Short Code" with value "Login.org.Shortcode"
  Then I enter text in "User Name" with value "Login.org.UserID"
  Then I click on "Submit" button in cite
  Then I enter text in "Answer1" with value "Login.orgIncorrectPassword.SecretQuestionAswer"
  Then I click on "Confirm" button in cite
  When static text "Incorrect answer." is visible
  Then I report "The Organization Portal Exception Incorrect answer."

@TC_FINLSO_REG_LoginTheOrganizationPortalForgotPasswordResetSuccessfully!
#pending need Another Login credentials with SecretQuestionAswer
Scenario: Login The Organization Portal_Forgot Password Reset Successfully
  Given I navigate to Mpesa "orgFirst" portal
  Then I click on "GenericLocators.OrgPortalForgetPassword"
  Then I enter text in "Short Code" with value "Login.org.Shortcode"
  Then I enter text in "User Name" with value "Login.org.UserID"
  Then I click on "Submit" button in cite
  Then I enter text in "Answer1" with value "Login.org.SecretQuestionAswer"
  Then I click on "Confirm" button in cite
  When static text "Password retrieved successfully." is visible
  Then I report "The Organization Portal_Forgot Password Reset Successfully"

@TC_FINLSO_REG_SPOperatorChangeTillLanguageviaWebTillStatusActive!
Scenario:SP Operator Change Till Language via Web_ Till Status Active
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

@TC_FINLSO_SearchCustomerByMSISDNWhenCustomerInActiveStatus!
# Passed
Scenario:Search Customer by MSISDN When Customer is in the Active Status
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  Then I report "The Sp Operator can Search Customer by MSISDN When Customer is in the Active Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorCloseTillviaWebTillStatusPendingActive!
Scenario: Exception_SP Operator Close Till via Web_Till Status Pending Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                        | Query Condition                       | SearchBy          | Organization Short Code | Till Number                        | SearchValue                        | Status                |
  | Table.Till | Till.MpatOrgOne.Till_PendingActive | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.Till_PendingActive | Till.MpatOrgOne.Till_PendingActive | Status.Pending Active |
  Then I report "The till is queried successfully and the details page is displayed"
  Then I report "Sp operator unable to close Till via web when status is pending Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_APartOfVerificationItemsArePassedAndScoreExceedsOrEqualToTotalScoreToPass!
# Passed
Scenario:A Part of Verification Items are Passed, and Score exceeds or Equal to Total Score to Pass.
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  Then I report "A Part of Verification Items are Passed, and Score exceeds or Equal to Total Score to Pass"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorChangeTillStatusviaWebTillStatusIsPendingActive!
Scenario: Exception_ SP Operator Change Till Status via Web _Till Status Is Pending Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                        | Query Condition                       | SearchBy          | Organization Short Code | Till Number                        | SearchValue                        | Status                |
  | Table.Till | Till.MpatOrgOne.Till_PendingActive | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.Till_PendingActive | Till.MpatOrgOne.Till_PendingActive | Status.Pending Active |
  Then I report "The till is queried successfully and the details page is displayed"
  Then I report "The SP Operator cannot change the Till status when the Till is in Pending Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_VerifyAllItemsAndAllVerificationItemsArePassed!
# Passed
Scenario:VerifyAllItems and All Verification Items are Passed.
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | Placeofbirth |
  Then I wait "3"
  Then I click on Generic "Pass"
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  Then I report "VerifyAllItems and All Verification Items are Passed."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorChangeStatusviaWebfromActivetoFrozen!
Scenario:SP Operator Change Till Status via Web from Active to Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The status is selected and modified successfully."
  #Post-Requisite
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SetTotalScoreToPassTo80!
# Passed
Scenario:Set Total Score to Pass to 80
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "80"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | Placeofbirth |
  Then I click on "Verify" button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  Then I report "The Set Total ScorePass to 80 and is displayed on the verification page"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_WhenTheTillInPendingActiveToChangeTillDevice!
Scenario:When The Till is in the Pending Active state To Change Till Device
  Given I login to Fintech as "sp" operator
  Given I generate name "NewMSISDN" with value "2665000_RAND_4"
  When I search for "Till" with below details
  | TableId    | TableValues                        | Query Condition                       | SearchBy          | Till Number                        | Organization Short Code | SearchValue                        | Status                |
  | Table.Till | Till.MpatOrgOne.Till_PendingActive | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.Till_PendingActive | ShortCode.ShortCode2    | Till.MpatOrgOne.Till_PendingActive | Status.Pending Active |
  Then I click on "orgpage.edit Msisdn"
  When static text "The B2C Organization\10231 receiver is in the Pending Active State which does not support the current service." is visible
  Then I report "When The Till is in the Pending Active the Sp operator can't Change Till Device"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SetTotalScoreToPassTo80OfOrganizationOperator!
# Passed
Scenario:Set Total Score to Pass to 80 Of OrganizationOperator
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "80"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | pass       |
  Then I click on "Verify" button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  Then I report "The Set Total ScorePass to 80 Of OrganizationOperator and is displayed on the verification page"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_ChangeTillDeviceWhenTillInFrozenAndTillOrganizationInFrozen!
Scenario:Change Till Device When The till is in the Frozen state and the till organization is in the Frozen state
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

@TC_FINLSO_SetTotalScoreToPassToZeroInOrganizationOperator!
# Passed
Scenario: Set Total Score to Pass to Zero OrganizationOperator
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "0"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  Then I click on left child menu "User Service" in the "Home" Page
  Then I select "Organization Operator" in UserService
  Then I enter text in "Label.Operator ID" with value "OrgOperator.DefaultOperatorId"
  Then I click on "Search" button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "OrgOperator.DefaultOperatorId" and click on "Detail" of "Operation" column
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post-Conditions
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "80"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I report "Set Total Score to Pass to Zero OrganizationOperator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_ChangeTillDeviceWhenTillInFrozenAndTillOrganizationInActive!
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

@TC_FINLSO_SetTotalScoreToPassToZero!
# Passed
Scenario: Set Total Score to Pass to Zero
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "0"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  Then I click on left child menu "User Service" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "Customer.Registered_Customer2"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "Customer.Registered_Customer2|Active" and click on "Detail" of "Operation" column
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post-Conditions
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "80"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I report "The Total score to pass is set to 80"
  Then I switch to previousTab
  Then I report "Set Total Score to Pass to Zero"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_ConfigPortalandSPPortallogoutatthesametimeviaclickSPPortalLogoutButton!
Scenario:Config Portal and SP Portal logout at the same time via click SP Portal Logout Button
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  Then I wait "3"
  Then I switch to previousTab
  Then I logout the "sp" portal and close the browser
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operation Support"
  Then I wait "3"
  Then I report "Sp portal and config portal logout when when we click sp portal logout button"

@TC_FINLSO_SetMaxVerificationAttemptsTo100DisplayedRecordsOfVerificationRemarkTo10!
# Passed
Scenario:Set Max. Verification Attempts to 100, Displayed Records of Verification Remark to 10
  Given I login to Fintech as "sp" operator
  Given I generate name "Answer" with value "Test_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "100"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on "GenericLocators.SuspendedDurationNo"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | SecretAnswer |
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post-Conditions
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on "GenericLocators.SuspendedDurationNo"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I report "Set Max. Verification Attempts to 100, Displayed Records of Verification Remark to 10"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_ConfigPortalandSPPortalLogoutattheSameTimeviaClickConfigPortalLogoutButton!
Scenario:Config Portal and SP Portal Logout at the Same Time via Click Config Portal Logout Button
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  Then I wait "3"
  Then I logout the "config" portal and close the browser
  Then I switch to previousTab
  Then I report "Config Portal and SP Portal Logout at the Same Time via Click Config Portal Logout Button"

@TC_FINLSO_SetMaxVerificationAttemptsTo100DisplayedRecordsOfVerificationRemarkTo10InOrganization!
# Passed
Scenario:Set Max. Verification Attempts to 100, Displayed Records of Verification Remark to 10 InOrganization
  Given I login to Fintech as "sp" operator
  Given I generate name "Answer" with value "Test_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "100"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | fail       |
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post-Conditions
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I report "The Sp Operator Set Max. Verification Attempts to 100, Displayed Records of Verification Remark to 10 InOrganization"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_ConfigPortalLogoutviaClickLogoutButton!
Scenario:Config Portal Logout via Click Logout Button
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  Then I logout the "config" portal and close the browser
  Then I switch to previousTab
  Then I click on left child menu "Configuration" in the "Home" Page
  Then I report "Config Portal Logout via Click Logout Button"

@TC_FINLSO_SetDisplayedRecordsOfVerificationRemarkToZero!
# Passed
Scenario:Set Displayed Records of Verification Remark to zero
  Given I login to Fintech as "sp" operator
  Given I generate name "Answer" with value "Test_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "0"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | Placeofbirth |
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  When static text "Submit Note Success!" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post-Conditions
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on "GenericLocators.SuspendedDurationNo"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I report "Set Displayed Records of Verification Remark to zero"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SetDisplayedRecordsOfVerificationRemarkToZeroInOrganization!
# Passed
Scenario:Set Displayed Records of Verification Remark to zero InOrganization
  Given I login to Fintech as "sp" operator
  Given I generate name "Answer" with value "Test_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "0"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | pass       |
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  When static text "Submit Note Success!" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post Condition
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I report "The Sp Operator Set Displayed Records of Verification Remark to zero InOrganization and The Note History displays no verification remark."

@TC_FINLSO_REG_SPOperatorChangeTillDefaultOperatorIdviaWeb_OperatorStatusSuspended!
Scenario:SP Operator Change Till Default Operator Id via Web_ Operator Status Suspended
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Default Operator Id with value "ABC1" and Remark as "Reason Description"
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
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Default Operator Id with value "ABC2" and Remark as "Reason Description"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorChangeTillDefaultOperatorIdviaWeb_OperatorStatusPendingActive!
Scenario:SP Operator Change Till Default Operator Id via Web_ Operator Status Pending Active
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                        | Query Condition                       | SearchBy          | Organization Short Code | Till Number                        | SearchValue                        | Status                |
  | Table.Till | Till.MpatOrgOne.Till_PendingActive | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.Till_PendingActive | Till.MpatOrgOne.Till_PendingActive | Status.Pending Active |
  Then I edit Default Operator Id with value "ABC123" and Remark as "Reason Description"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The Till Default Operator Id is changed to Suspended when Organization Status is Frozen"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                        | Query Condition                       | SearchBy          | Organization Short Code | Till Number                        | SearchValue                        | Status                |
  | Table.Till | Till.MpatOrgOne.Till_PendingActive | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.Till_PendingActive | Till.MpatOrgOne.Till_PendingActive | Status.Pending Active |
  Then I edit Default Operator Id with value "ABC1" and Remark as "Reason Description"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorChangeTillLanguageviaWeb_organizationStatusFrozen!
Scenario:SP Operator Change Till Language via Web_ organization Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The Till status is changed to Frozen and Change Till Language when Organization Status is Frozen"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I change Language with value "English" and Remark as "Test"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorChangeTillStatusViaWebOrganizationStatusIsFrozen!
Scenario:SP Operator Change Till Status via Web _ Organization Status Is Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code | Till Number                | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
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
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code | Till Number                | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorChangeTillLanguageviaWebTillStatusFrozen!
Scenario: SP Operator Change Till Language via Web_ Till Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "The Till status is changed to Frozen and Change Till Language when Organization Status is Frozen"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Till Number                | Organization Short Code | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | Till.MpatOrgOne.TillNumber | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I change Language with value "English" and Remark as "Test"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatorChangeStatusviaWebfromFrozentoActive!
Scenario:SP Operator Change Till Status via Web from Frozen to Active
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code | Till Number                | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  #Post-Requisite
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code | Till Number                | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I report "The Till status is changed Frozen to Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_ChildOrgBankAccEnsureDelBankAccount!
Scenario: Child Organization Bank Account - Ensure Delete Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "ChildOrg_RAND_4"
  Given I generate name "ShortCode" with value "RAND_6"
  Given I generate name "AccName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Given I generate name "BankName" with value "Bank.HeadOffice"
  Then I create child organization with below details
  | ParentShortCode      | Product                  | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Bank                    | Bank Branch     | Asset Type     | Currency      | Account Name | Account Number | Commission Settlement Configuration | Validation Mode |
  | ShortCode.ShortCode1 | Agency Independent Store | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | CENTRAL BANK OF LESOTHO | Bank.TopOrgBank | Bank.AssetType | Bank.Currency | AccName      | AccNo          | default settle template             | No Validation   |
  Then I click on " View Detail >> " to check
  Then I click on left child menu "Bank Account" in the "Home" Page
  Then I scroll "GenericLocators.Table" to view using "false" parameter
  Then I check table "Table.BankAccount" with multiple values as "TEST" and click on "Remove" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "GenericLocators.SubmitRemoveBan"
  #Post Requisite
  When I close "CloseOrganization" with below details
  | TableId                 | TableValues | SearchBy                      | SearchValue | Status        |
  | Table.CloseOrganization | ShortCode   | Label.Organization Short Code | ShortCode   | Status.Active |
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "Child Organization Bank Account is Deleted Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_ChildOrgBankAccEnsureCreateBankAccount!
Scenario: Child Organization Bank Account - Ensure Create Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "ChildOrg_RAND_4"
  Given I generate name "ShortCode" with value "RAND_6"
  Given I generate name "AccName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Given I generate name "BankName" with value "Bank.HeadOffice"
  Then I create child organization with below details
  | ParentShortCode      | Product                  | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Bank                    | Bank Branch     | Asset Type     | Currency      | Account Name | Account Number | Commission Settlement Configuration | Validation Mode |
  | ShortCode.ShortCode1 | Agency Independent Store | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | CENTRAL BANK OF LESOTHO | Bank.TopOrgBank | Bank.AssetType | Bank.Currency | AccName      | AccNo          | default settle template             | No Validation   |
  Then I click on " View Detail >> " to check
  Then I click on left child menu "Bank Account" in the "Home" Page
  Then I scroll "GenericLocators.Table" to view using "false" parameter
  Then I check table "Table.BankAccount" with multiple values as "TEST" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewInBank"
  #Post Requisite
  When I close "CloseOrganization" with below details
  | TableId                 | TableValues | SearchBy                      | SearchValue | Status        |
  | Table.CloseOrganization | ShortCode   | Label.Organization Short Code | ShortCode   | Status.Active |
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "Child Organization Bank Account is Created Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_OrganizationBankAccountViewRemoveAccountDetail!
Scenario:Organization Bank Account_Ensure View Remove Account Detail
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on left child menu "Bank Account" in the "Home" Page
  Then I scroll "GenericLocators.Table" to view using "false" parameter
  Then I click on the "Removed Account" tab
  Then I click on "GenericLocators.RemovedAccount"
  Then I click on "GenericLocators.CloseViewInRemove"
  Then I report "Organization Bank Account can View Remove Account Detail"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SetDisplayedRecordsOfVerificationRemarkToTwo!
# Passed
Scenario:Set Displayed Records of Verification Remark to two Org Operator
  Given I login to Fintech as "sp" operator
  Given I generate name "Answer" with value "Test_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "4"
  Then I enter text for "GenericLocators.DisplayRecord" with value "2"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | pass       |
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  When static text "Submit Note Success!" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post-Conditions
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on "GenericLocators.SuspendedDurationNo"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I report "Set Displayed Records of Verification Remark to two Org Operator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SetDisplayedRecordsofVerificationRemarkTo2!
# Passed
Scenario:Set Displayed Records of Verification Remark to 2
  Given I login to Fintech as "sp" operator
  Given I generate name "Answer" with value "Test_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "4"
  Then I enter text for "GenericLocators.DisplayRecord" with value "2"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | Placeofbirth |
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  When static text "Submit Note Success!" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post Condition
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I report "The Sp Operatir Set Displayed Records of Verification Remark to 2 and no record is found in Customer care Audit log"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatortoEditBankStatementTemplate!
# Passed
Scenario:Edit Bank Statement Template
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I enter text in "Label.TemplateName" with value "Bank_Template"
  Then I select drop down "Statement Type" with option "DropDown.NormalTransactions"
  Then I select drop down "Format" with option "DropDown.CSV"
  Then I click on " Search " button in cite
  Then I check table "Table.RemovedAccount" with multiple values as "Bank_Template" and click on "Detail" of "Operation" column
  Then I click on "Edit" button in cite
  Then I enter text in "Label.FileTemplateName" with value "Bank 8005"
  Then I enter text area "Description" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Editbutton"
  Then I click on "GenericLocators.Treebutton"
  Then I click on "Leaf" radio
  Then I click on "GenericLocators.AddNewElement"
  Then I click on "GenericLocators.Field"
  Then I click on "GenericLocators.Confirmbutton"
  Then I enter text for "GenericLocators.MinTimes" with value "1"
  Then I enter text for "GenericLocators.Maxtimes" with value "1"
  Then I select drop down "Data Type" with option "Regular Expression"
  Then I enter text area for "GenericLocators.RuleDefinition" with value "test"
  Then I wait "5"
  Then I report "All modifications are saved successfully."
  Then I click on "Submit" button in cite
  # pre-requisite
  Then I click on "Edit" button in cite
  Then I enter text in "Label.FileTemplateName" with value "Bank_Template"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Editbutton"
  Then I click on "GenericLocators.DeleteField"
  Then I wait "3"
  Then I click on "GenericLocators.DeleteFieldConfirm"
  Then I click on "Submit" button in cite
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorQueryCustomerKYCInfo!
# Passed
Scenario:SP Operator Query Customers KYC Info
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on the "KYC Info" tab
  Then I wait "3"
  Then I report "SP Operator Query Customers KYC Info"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_OrgOperatorQueryCustomerKYCInfo!
Scenario: Org Operator Query Customers KYC Info
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on the "KYC Info" tab
  Then I wait "3"
  Then I report "Org Operator Query Customers KYC Info"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CreateCustomerInSPPortalInputTheCombinationOfMandatoryAndOptionalKYC!
#Passed
Scenario:Create Customer in SP Portal, and Input the Combination of Mandatory and Optional KYC
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "130000_RAND_5"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "IDNumber" with value "130_RAND_3"
  Then I create customer the with below details
  | Product Name                | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Registeredcustomer | CustomerMSISDN | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  Then I report "SP Operator Created Customer with All Input Mandatory And Optional KYC Fields"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CreateCustomerInSPPortalInputAllKYCFields!
# Passed
Scenario:Create Customer in SP Portal, and Input All KYC Fields
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "130000_RAND_5"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "IDNumber" with value "130_RAND_3"
  Then I create customer the with below details
  | Product Name                | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Registeredcustomer | CustomerMSISDN | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  Then I report "SP Operator Created Customer with All Input Mandatory And Optional KYC Fields"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_APartOfVerificationItemsArePassedAndScoreExceedsOrEqualToTotalScoreToPassInOrgOperator!
# Passed
Scenario:Part of Verification Items are Passed, and Score exceeds or Equal to Total Score to Pass.
  Given I login to Fintech as "sp" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | pass       |
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  Then I report "A Part of Verification Items are Passed, and Score exceeds or Equal to Total Score to Pass in OrgOperator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_VerifyOrgOperatorAllItemsAndAllVerificationItemsArePassed!
# Passed
Scenario:VerifyOrgOperatorAllItems and All Verification Items are Passed
  Given I login to Fintech as "sp" operator
  When I verify organization operator from Take a Call
  | OperatorID                    | PassOrFail |
  | OrgOperator.DefaultOperatorId | pass       |
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I wait "3"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  Then I report "VerifyOrgOperatorAllItems and All Verification Items are Passed"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ExceptionSetMaxVerificationAttemptsToOneAndSuspendedDurationToNo!
#  Passed
Scenario:Exception_Set Max. Verification Attempts to 1, and Suspended Duration to No
  Given I login to Fintech as "sp" operator
  Given I generate name "Answer" with value "Test_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "1"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "80"
  Then I click on "GenericLocators.SuspendedDurationNo"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | SecretAnswer |
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I check error text "The number of verification attempts has reached the upper limit." is displayed
  Then I wait "5"
  Then I click on "GenericLocators.ConfirmException"
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I select "Unlock Suspend" in Operation
  # Post-Condition
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "80"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I report "Exception_Set Max. Verification Attempts to 1, and Suspended Duration to No"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ExceptionSetMaxVerificationAttemptsTo1AndSuspendedDurationToNoOfOrganization!
# PassedS
Scenario:Exception_Set Max. Verification Attempts to 1, and Suspended Duration to No
  Given I login to Fintech as "sp" operator
  Given I generate name "Answer" with value "Test_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "1"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "80"
  Then I click on "GenericLocators.SuspendedDurationNo"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | fail       |
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I check error text "The number of verification attempts has reached the upper limit." is displayed
  Then I wait "5"
  Then I click on "GenericLocators.ConfirmException"
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                   | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId | ShortCode.ShortCode1 | Status.Active |
  Then I select "Unlock Suspend" in Operation
  # Post-Condition
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "80"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I report "Exception_Set Max. Verification Attempts to 1, and Suspended Duration to No Org Optr"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SetMaxVerificationAttemptsTo3!
# Passed
Scenario:Set Max. Verification Attempts to 3
  Given I login to Fintech as "sp" operator
  Given I generate name "Answer" with value "Test_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on "GenericLocators.SuspendedDurationNo"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | SecretAnswer |
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on " Verify " button in cite
  Then I check error text "The number of verification attempts has reached the upper limit." is displayed
  Then I wait "5"
  Then I click on "GenericLocators.ConfirmException"
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post-Conditions
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I select "Unlock Suspend" in Operation
  Then I report "Set Maximum Verification Attempts to 3"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SetMaximumVerificationAttemptsToThreeInOrgOperator!
# Passed
Scenario:Set Max. Verification Attempts to 3 InOrgOperator
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Customer Care Configuration" in config
  Then I click on "GenericLocators.IdentityTypeConfig"
  Then I wait "3"
  Then I click on "GenericLocators.Organizationoperatorconfig"
  Then I wait "3"
  Then I scroll "GenericLocators.ScrollSecurityConfig" to view using "false" parameter
  Then I click on "GenericLocators.EditSecurityConfig"
  Then I enter text for "GenericLocators.MaxVerification" with value "3"
  Then I enter text for "GenericLocators.DisplayRecord" with value "10"
  Then I click on "GenericLocators.SuspendedDurationNo"
  Then I enter text for "GenericLocators.TotalScoreToPass" with value "80"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | fail       |
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I check error text "The number of verification attempts has reached the upper limit." is displayed
  Then I wait "3"
  Then I click on "GenericLocators.ConfirmException"
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetailIdentity"
  #Post Condition
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                   | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId | ShortCode.ShortCode1 | Status.Active |
  Then I select "Unlock Suspend" in Operation
  Then I report "The Sp operator Set Max. Verification Attempts to 3 of the Organization Operator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ExceptionBalanceNotEnough!
# Passed
Scenario:Exception_Balance Not Enough
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessDeposit"
  Then I select drop down "Identifier Type" with option "Short Code"
  Then I enter text in "Short Code" with value "ShortCode.ShortCode2"
  Then I enter text in "Label.Amount" with value "Amount.Limit100000"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I check error text "Failed to match a reason type because the Identity Relationship factor does not match." is displayed
  Then I click on "Confirm" button in cite
  Then I report "Exception_Balance Not Enough"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_QueryBankStatementTemplate!
# Passed
Scenario:Query Bank Statement Template
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I enter text in "Label.TemplateName" with value "Bank_Query"
  Then I select drop down "Statement Type" with option "DropDown.NormalTransactions"
  Then I select drop down "Format" with option "DropDown.MT940"
  Then I click on " Search " button in cite
  Then I check table "Table.RemovedAccount" with multiple values as "Bank_Template" and click on "Detail" of "Operation" column
  Then I wait "3"
  Then I report "Query Bank Statement Template"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_SPOperatortoQueryBankSatementTemplate!
Scenario:Create a Copy Bank Statement Template
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I enter text in "Label.TemplateName" with value "Bank 8003"
  Then I select drop down "Statement Type" with option "DropDown.NormalTransactions"
  Then I select drop down "Format" with option "DropDown.CSV"
  Then I click on " Search " button in cite
  Then I report "The Bank Statement Template page displays normal"
  Then I logout the "sp" portal and close the browser


