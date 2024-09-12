@FINLSO_GPTC_WEB!
Feature: Fintech2.0 Gptc Test case Web Only

@TC_FINLSO_GPTC_SPCanCreateToOrganization-SuperAgentBackOfficeRole!
Scenario:Create Top Organization - Super Agent
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product     | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration |
  | Super Agent | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             |
  Then I report "Sp operator back office can create Top Organization - Super Agent account successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_SPCanCreateToOrganization-CentrallyOwnedBackOfficeRole!
Scenario:Create Top Organization - Centrally Owned
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product                              | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | Agency Head Office - Centrally Owned | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I report "Sp operator back office can create Top Organization - Centrally Owned successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_SPCanCreateToOrganization-B2COrganisation!
Scenario:Create Top Organization -  B2C Organisation
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product      | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | B2C Business | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I report "Sp operator back office can create Top Organization - B2C Organisation successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_BusinessOp-VerifySPOperatorisabletosearchtransactionbyreceiptno!
Scenario:Business Op -Verify SP Operator is able to search transaction by receipt no
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                                              | Reason_Type                                             | Primary_Identifier_Account_Type  | Receiver_Identifier_Account                  | Amount          | Reason             |
  | TransactionServices.BusinessTransfersfromUtilityCollectionAccount | ReasonType.M-PESA Account to Utility Collection Account | Default Account (M-PESA Account) | Default Account (Utility Collection Account) | Amount.Minimum1 | Reason Description |
  Then I get value from label in " Receipt No.  " and store it in "TransReceipt"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "spBackoff" operator
  Then I check the Transaction ReceiptNo "TransReceipt"
  Then I report "Transfer From Merchant Pay To Merchant Via WEB is Successfully Completed"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_CreateTopOrganizationSingleMerchantAccountViaBackOffice!
Scenario:Create Top Organization - Single merchant account
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product                       | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | C2B – Single Account Merchant | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I report "Sp operator back office can create Top Organization - Single merchant account successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_CreateChildOrgIndependentAgencystoreViaBackOffice!
Scenario:Create Child Org - Independent Agency store
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "ChildOrg_RAND_4"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create child organization with below details
  | ParentShortCode      | Product                  | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | ShortCode.ShortCode1 | Agency Independent Store | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I click on " View Detail >> " to check
  Then I report "Sp operator back office can create Create Child Org - Independent Agency store Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_SPOperatorRejectTheWEBTransactionViaBackOffice!
Scenario:SP Operator Reject the WEB Transaction Confirmation workflow
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I logout the "sp" portal and close the browser
  #Reject the Transaction
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reject"
  When static text "Transaction rejected successfully." is visible
  Then I report "Operator successfully approves transaction with BackOffice Role"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_OperatorSuccessfullyApprovesTransactionViaBackOffice!
Scenario:Operator successfully approves transaction
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I logout the "sp" portal and close the browser
  #Approving the Transaction
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Approve"
  Then I report "Operator successfully approves transaction with BackOffice Role"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_OperatorSuccessfullyReverseTransactionViaBackOffice!
Scenario:Operator successfully reverse transaction
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessToBusinessTransfer | Label.Short Code                 | ShortCode.ShortCode3           | Amount.Minimum1 | Reason Description |
  Then I close tab near to home tab
  Then I logout the "sp" portal and close the browser
  #Reversing the Transaction
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reverse"
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Operator successfully reverse transaction with BackOffice Role"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_AttemptToRecycleMSISDNViaBackOffice!
Scenario:Attempt to recycle MSISDN
  #Create customer
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "266585_RAND_5"
  Given I generate name "FirstName" with value "TestKYC"
  Given I generate name "LastName" with value "AutomationKYC"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "IDNumber" with value "130_RAND_3"
  Then I create customer the with below details
  | Product Name                | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Registeredcustomer | CustomerMSISDN | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  Then I logout the "sp" portal and close the browser
  #Recycling the Customer
  Given I login to Fintech as "spBackoff" operator
  Then I recycle the MSISDN "CustomerMSISDN"
  When MakerChecker is on "Approve" task from group task for "Approve 'Recycle MSISDN'"
  Then I report "Operator can successfully recycle the MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifyingthatOperatorcanviewtheCustomerRuleProfile!
Scenario:  Verifying that Operator can view the Customer Rule Profile
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on " Default Customer Rule Profile " link
  When static text "Limit Rule" is visible
  Then I report "Operator successfully can view the Customer Rule Profile."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_CreateMinorCustomerViaBackOffice!
Scenario: Create Minor Customer
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "CustomerMSISDN" with value "130000_RAND_5"
  Given I generate name "Firstname" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "IDNumber" with value "130_RAND_3"
  Then I create customer the with below details
  | Product Name            | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Minorcustomers | CustomerMSISDN | Firstname  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  # Then I click on " View Detail >> " to check
  Then I report "SP Operator Created Customer with All Input Mandatory And Optional KYC Fields"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ChangecustomerKYC!
Scenario:SP Operator Edit Customer KYC
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "PostalAdd" with value "Semonkong_RAND_4"
  Given I generate name "PhyAdd" with value "Semonkong_RAND_4"
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit KYC Info with below details
  | Postal_Address | Physical_Address | Reason |
  | PostalAdd      | PhyAdd           | Test   |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_SPOperatorcansuccessfullyviewcustomerbeneficiary!
Scenario:SP Operator can successfully view customer beneficiary.
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on "GenericLocators.BeneficiaryList"
  Then I report "SP can view the list of beneficiaries of a customer."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ChangecustomerStatusViaBackOffice!
Scenario: Change customer Status
  Given I login to Fintech as "spBackoff" operator
  #Prerequisite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Suspended"
  #Then I click on "GenericLocators.ConfirmException"
  #When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  #Post-Requisite
  # Then I click on left child menu "Identity" in the "Home" Page
  # When I search for "Customer" with below details
  # | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  # | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Active"
  #Then I click on "GenericLocators.ConfirmException"
  # When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  Then I report "The status of the customer changes to Suspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_CreateCustomerViaBackOffice!
Scenario: Create Customer
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "CustomerMSISDN" with value "130001_RAND_5"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "IDNumber" with value "1301_RAND_3"
  Then I create customer the with below details
  | Product Name                | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Registeredcustomer | CustomerMSISDN | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  Then I report "SP Operator Created Customer with All Input Mandatory And Optional KYC Fields"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_CreateaTillOfAnIndependentStore!
Scenario:Create a Till of an Independent Store
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "TillMSISDN" with value "2665000_RAND_4"
  Given I generate name "TillNumber" with value "20_RAND_3"
  Then I create Till with below details
  | Short_Code           | MSISDN     | Till_Number | Language | Operator_ID | Product                       |
  | ShortCode.ShortCode1 | TillMSISDN | TillNumber  | English  | ABC1        | Agency Independent Store Till |
  Then I report "SP Operator Created Till IndependentStore successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifyingthatOperatorcansearchesdevicesTillattachedtoanOrganization!
Scenario:Verifying that Operator can searches devices (Till) attached to an Organization
  Given I login to Fintech as "spBackoff" operator
  When I search for "Till" with below details
  | TableId    | Query Condition | SearchValue                 | TableValues                 | MSISDN                  | Status        |
  | Table.Till | MSISDN          | Till.MpatOrgOne.TillNumber1 | Till.MpatOrgOne.TillNumber1 | Till.MpatOrgOne.MSISDN1 | Status.Active |
  Then I report "Operator can searches devices (Till) attached to an Organization"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_BeneficiaryLookup_VerifythatM-pesasystemretrievethebeneficiarynamebyMSISDNwhileaddinganewbeneficiarycustomer!
Scenario:Beneficiary Lookup_Verify that M-pesa system retrieve the beneficiary name by MSISDN while adding a new beneficiary customer
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "CustomerMSISDN" with value "130000_RAND_5"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "IDNumber" with value "130_RAND_3"
  Then I create customer the with below details
  | Product Name                | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Registeredcustomer | CustomerMSISDN | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|LookUp Beneficiary" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_TakeACallVerifyingThatOperatorCanInitiateCustomerReversalForRegisteredCustomer!
Scenario:Take a call - Verifying that Operator can initiate customer reversal for registered customer
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  When static text "Message.VerifySuccess" is visible
  Then I refresh the page
  Then I close tab near to home tab
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I logout the "sp" portal and close the browser
  #Approving the Transaction
  Given I login to Fintech as "sp_generic" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Operator successfully reverse transaction via Backoffice Role"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Takeacall-CustomerCareOperatorisabletoverifyacustomerbyNames!
Scenario: Take a call - Customer Care Operator is able to verify a customer by Names
  Given I login to Fintech as "sp" operator
  Given I generate name "Firstname" with value "Registered"
  Given I generate name "Lastname" with value "CustomerTwo"
  When I verify customer from Take a Call
  | Query Condition            | First Name | Last Name | btnName | SecretAnswer |
  | DropDown.FirstNameLastName | Firstname  | Lastname  | pass    | chennai      |
  Then I click on " Verify " button in cite
  #When static text "Message.VerifySuccess" is visible
  # Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  # Then I enter text area "Note" with value "Reason Description"
  # Then I click on " Submit " button in cite
  # When static text "Message.SubmitSuccess" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I select drop down "Event" with option "Take a Call"
  Then I click on "Search" button in cite
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseView"
  Then I report "Customer Care Operator is able to verify by MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Takeacall-CustomerCareOperatorisabletoverifyOrgOperatorbyShortcodeorOperatorID!
Scenario: Take a call - Customer Care Operator is able to verify Org Operator by Shortcode or Operator ID
  Given I login to Fintech as "spcc" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | pass       |
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I select drop down "Category" with option "Customer Care"
  Then I select drop down "Event Group" with option "Take a Call"
  Then I click on "GenericLocators.Event"
  Then I click on "GenericLocators.EventDropdownvalue"
  Then I click on "Search" button in cite
  Then I click on "GenericLocators.Detail"
  Then I click on "GenericLocators.CloseViewDetail"
  Then I report "Customer Care Operator is able to verify by Shortcode or Operator ID"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Takeacall-CustomerCareOperatorisabletoverifyacustomerbyMSISDNIDNAMES!
Scenario: Take a call - Customer Care Operator is able to verify a customer by MSISDN, ID, NAMES e.t.c
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | pass    | chennai      |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I wait "3"
  Then I report "Customer Care Operator is able to verify by MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Takeacall-Operatorcanchangecustomerstatus!
Scenario: Verify that SP Operator can successfully change customer status - to suspended
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | pass    | chennai      |
  Then I click on " Verify " button in cite
  Then I wait "5"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status of customer with value "Suspended"
  Then I edit Identity Status of customer with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_TakeaCall-Operatorcansuspendacustomer!
Scenario: Verify that SP Operator can TakeaCall-Operator can suspend a customer!
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Fail | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I click on "GenericLocators.ConfirmException"
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I select "Unlock Suspend" in Operation
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_WithdrawalfromBankviaportal!
Scenario:Withdrawal fromBank via portal
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                                 | Requester_Type | Requester_MSISDN              | Amount          | Receiving_Bank_Account            | Reason             |
  | TransactionServices.OrganizationWithdrawalFromM-PESA | MSISDN         | Customer.Registered_Customer1 | Amount.Minimum1 | Autotesting/987654****7456/(TEST) | Reason Description |
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_WithdrawalfromAgentviaportal!
Scenario:Withdrawal from Agent via portal
  Given I login to Fintech as "orgC2B" operator
  Then I initiate transaction with below details
  | Transaction_Services                                   | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.MerchantWithdrawalofFundsfromagent | Short Code                       | ShortCode.ShortCode1           | Amount.Minimum1 | Reason Description |
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_OperatortransfersfundsfromUtilityaccounttoMpesaaccountviaweb!
Scenario: B2C Operator transfers funds from Utility account to Mpesa account via web
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                                   | Amount          | Reason             |
  | TransactionServices.BusinessTransfers-UtilityDisbursementto/fromM-PESA Working Account | Amount.Minimum1 | Reason Description |
  Then I report "Operator transfers funds from Utility account to Mpesa account via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_OperatorTransfersFundsFromMpesaAccountToUtilityaccount!
Scenario:Operator transfers funds from Mpesa account to Utility account
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                                              | Amount          | Reason             |
  | TransactionServices.BusinessTransfersfromUtilityCollectionAccount | Amount.Minimum1 | Reason Description |
  Then I report "The Org Operator transfers funds from Mpesa account to Utility account"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_TakeACallVerifyingThatOperatorCanResetCustomerPIN!
Scenario:Take a call - Verifying that Operator can reset customer PIN
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | pass    | chennai      |
  Then I click on " Verify " button in cite
  Then I wait "6"
  Then I select "Reset PIN" in Operation
  Then I report "Sp operater can Take a call - Verifying that Operator can reset customer PIN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_WithdrawalofFundsFromAnAgentToAnotherAgentViaPortal!
Scenario:Withdrawal of Funds from an Agent to another Agent via portal
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                                   | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.MerchantWithdrawalofFundsfromagent | Short Code                       | ShortCode.ShortCode2           | Amount.Minimum1 | Reason Description |
  Then I report "Sp operator can Withdrawal of Funds from an Agent to another Agent via portal"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_BusinessPaymentsRegisteredFromB2COrganisationViaWeb!
Scenario:Business Payments - registered from B2C Organisation via web
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I report "The Org operator transfer Business Payments - registered from B2C Organisation via web"
  Then I logout the "org" portal and close the browser
  Given I login to Fintech as "sp" operator
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ExportCustomerStatementviaCSVandPDF
Scenario:Export Customer Statement via CSV and PDF
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I wait "5"
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.Review Account Statement"
  Then I select drop down "Account Type" with option "M-PESA Account/10110021000100030101000010011426"
  Then I click on " Search " button in cite
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.CSVexport"
  Then I check file is downloaded in "csv" format
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.PDFExport"
  Then I check file is downloaded in "pdf" format
  Then I report "Customer Can download account statment in csv and pdf format"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ExportOrgAccountStatementViaCSVandPDF!
Scenario:Export  Org Account Statement Via CSV and PDF
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | OrgOperator.ShortCode | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I wait "5"
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.Review Account Statement"
  Then I select drop down "Account Type" with option "M-PESA Account"
  Then I click on " Search " button in cite
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.CSVexport"
  Then I check file is downloaded in "csv" format
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.PDFExport"
  Then I check file is downloaded in "pdf" format
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ExportOrAccountStatementViaCSVandPDFviaportal!
Scenario:Export Org Account Statement Via CSV and PDF via portal
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "My Organization " in org of the "Identity Center" Page
  Then I click on " View Detail " button in cite
  Then I Switch tab
  Then I click on "GenericLocators.Overview"
  Then I click on "GenericLocators.Review Transaction"
  Then I click on " Search " button in cite
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.CSVexport"
  Then I check file is downloaded in "csv" format
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.PDFExport"
  Then I check file is downloaded in "pdf" format
  Then I report "Org Account statement can be downloaded via CSV and PDF"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_ChangeOrgKYC!
Scenario:Change Org KYC
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "PostalAdd" with value "Semonkong_RAND_4"
  Given I generate name "PhyAdd" with value "Semonkong_RAND_4"
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | OrgOperator.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit org KYC Info with below details
  | Postal_Address | Physical_Address | Reason |
  | PostalAdd      | PhyAdd           | Test   |
  #Approve
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization KYC'"
  Then I report "Organization KYC changed successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_OperatorcannotchangeCustomerdetailsasverificationfails!
Scenario:Take a call - Operator can not change Customer details as verification fails
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | fail    | test         |
  Then I click on " Verify " button in cite
  When static text "Message.Verification failed" is visible
  Then I wait "5"
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Message.SubmitSuccess" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseView"
  Then I report "Search Customer by LastName When Customer is in the Active Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_SpOperatorSearchOrganizationOperatorUsingShortCode!
Scenario:Verifying that Operator is able to confirm identity of an Organisation Operator searched by Operator ID or Organisation short code
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                   | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId | ShortCode.ShortCode1 | Status.Active |
  When static text "Label.BasicInfoText" is visible
  Then I report "Operator is able to comfirm identity of an Organization operator searched by Organisation ShortCode"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ChangeagentaccountStatus!
Scenario:Change agent account Status
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | OrgOperator.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I change the Account status to "Frozen" of the Account "Float Account"
  When MakerChecker is on "Approve" task from group task for "Change Organization Account Status"
  #Post Condition
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | OrgOperator.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I change the Account status to "Active" of the Account "Float Account"
  When MakerChecker is on "Approve" task from group task for "Change Organization Account Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_OperatorcansuccessfullyAddProduct!
Scenario:Operator can successfully Add Product
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product     | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration |
  | Super Agent | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             |
  When I search for "Organization" with below details
  | TableId            | TableValues | SearchBy                      | SearchValue | Status        |
  | Table.Organization | ShortCode   | Label.Organization Short Code | ShortCode   | Status.Active |
  Then I click on the "Product" tab
  Then I click on "Edit Product" button in cite
  Then I Add product "C2B – Single Account Merchant" in the organization of Sp portal
  Then I Add product "Stand Alone Agent" in the organization of Sp portal
  Then I enter text area "Remark" with value "Test"
  #Then I click on "Submit" button in cite
  Then I click on "GenericLocators.SubmitInorgpage"
  Then I click on "GenericLocators.SubmitEcep"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Product"
  Then I report "Operator can successfully add Product"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_OperatorattemptstoreversealreadyreversedtransactionViaBackOffice!
Scenario: Operator attempts to reverse already reversed transaction
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessToBusinessTransfer | Short Code                       | ShortCode.ShortCode3           | Amount.Minimum1 | Reason Description |
  Then I logout the "sp" portal and close the browser
  #Reversing the Transaction
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reverse"
  Then I select drop down "Query Mode" with option "Transactions as Receipt No."
  Then I enter text in "Label.ReceiptNo" with value "transactionReceiptNum"
  Then I click on " Search " button in cite
  Then I report "Operator successfully reverse already reversed transaction via Backoffice Role"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_BusinesstoBusinesstransafer!
Scenario: Business to Business transafer
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessToBusinessTransfer | Short Code                       | ShortCode.ShortCode3           | Amount.Minimum1 | Reason Description |
  Then I report "Business to Business transfer successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_CreateOperatorViaBackOffice!
Scenario:Create Operator
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgUsername" with value "OrgOperator_RAND_4"
  Given I generate name "msisdn" with value "8613000_RAND_6"
  Given I generate name "OpeId" with value "OperId_RAND_6"
  Then I create organization operator with below details
  | ShortCode            | Language                | AccessChannel | UserName    | MSISDN | OperatorId | Role                                                                   | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | ShortCode.ShortCode1 | Language.Southern Sotho | Web           | OrgUsername | msisdn | OpeId      | OrgOperRole,B2C Operator,C2B Operator,[Open API] API Key Administrator | SMS                            | 2314563243465                 | Test Email |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ChangeagentOperatorStatus!
Scenario:Back Office - Change agent Operator Status
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                    | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId3 | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization operator" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Organization Operator Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  #Post-requsite
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                    | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId3 | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization operator" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifyingthatOperatorcanresetcustomerPIN!
Scenario: CC-BO Verifying that Operator can reset customer PIN
  Given I login to Fintech as "spcc-bo" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I wait "6"
  Then I select "Reset PIN" in Operation
  Then I report "Sp operater can CC-BO - Verifying that Operator can reset customer PIN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifythatOperatorcanRejectandApprovereversals!
Scenario:CC BO - Verify that Operator can Reject and Approve reversals
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I close tab near to home tab
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "spcc-bo" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Reject" task from group task for "Transaction Confirmation"
  Then I report "Operator successfully Reject and Approved reversals Transaction"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_TakeacallVerifyingthatOperatorcaninitiatecustomerreversalforregisteredcustomer!
Scenario:Take a call-Verifying that Operator can initiate customer reversal for registered customer
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Operator successfully initiate reversalfor registered customer"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ChangecustomerStatusViacustomercareBackOffice!
Scenario: Back Office -Change customer Status
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Suspended"
  # Then I click on "GenericLocators.Confirm"
  # When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Active"
  # Then I click on "GenericLocators.Confirm"
  # When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  Then I report "The status of the customer changes to Suspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifyingThatOperatorCanMigrateRegisteredCustomerToTier3!
Scenario: Verifying that Operator can Migrate Registered Customer to Tier 3
  Given I login to Fintech as "spBackoff" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer3 | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer3 | Label.MSISDN | Customer.Registered_Customer3 | Status.Active |
  Then I get value from label "Trust Level" and store it in "strExistingTrustLevel"
  Then I check value of "strExistingTrustLevel" is "3:Registered Customer Tier 2"
  Then I edit KYC Info with below details
  | Trust_Level                | Document_Received | Sourceof_Funds         | Reason |
  | Registered Customer Tier 3 | Yes               | Employers pension fund | Test   |
  Then I scroll "GenericLocators.serviceCode" to view using "true" parameter
  Then I wait "3"
  Then I get value from label "Trust Level" and store it in "strExistingTrustLevel1"
  Then I check value of "strExistingTrustLevel1" is "4:Registered Customer Tier 3"
  Then I report "The Sp operator can migrate Migrate Registered Customer to Tier 3 via BackOffice Role"
  Then I wait "3"
  #Post condition
  Then I edit KYC Info with below details
  | Trust_Level                | Document_Received | Reason |
  | Registered Customer Tier 2 | No                | Test   |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifyingThatOperatorCanMigrateRegisteredCustomerToTier2!
Scenario: Verifying that Operator can Migrate Registered Customer to Tier 2
  Given I login to Fintech as "spBackoff" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | Placeofbirth |
  Then I click on " Verify " button in cite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I get value from label "Trust Level" and store it in "strExistingTrustLevel"
  Then I check value of "strExistingTrustLevel" is "4:Registered Customer Tier 3"
  Then I edit KYC Info with below details
  | Trust_Level                | Document_Received | Sourceof_Funds         | Reason |
  | Registered Customer Tier 2 | No                | Employers pension fund | Test   |
  Then I scroll "GenericLocators.serviceCode" to view using "true" parameter
  Then I wait "3"
  Then I get value from label "Trust Level" and store it in "strExistingTrustLevel1"
  Then I check value of "strExistingTrustLevel1" is "3:Registered Customer Tier 2"
  Then I report "The Sp operator can migrate Migrate Registered Customer to Tier 3 via BackOffice Role"
  Then I wait "3"
  #Post condition
  Then I edit KYC Info with below details
  | Trust_Level                | Document_Received | Reason |
  | Registered Customer Tier 3 | Yes               | Test   |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_TakeaCall-OperatorcansuspendacustomerViacustomercareBackOffice!
Scenario:Back Office - Verify that SP Operator can TakeaCall-Operator can suspend a customer!
  Given I login to Fintech as "spcc-bo" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Fail | Placeofbirth |
  Then I click on " Verify " button in cite
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I click on "GenericLocators.ConfirmException"
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I select "Unlock Suspend" in Operation
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_verifyoperatorcanenableordisablebetting!
Scenario: verify operator can enable or disable betting
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues        2          | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I edit KYC Info with below details
  | Betting | Reason |
  | Enable  | Test   |
  When static text "Message.Submittedsuccessfully" is visible
  #Post condition
  Then I edit KYC Info with below details
  | Betting | Reason |
  | Disable | Test   |
  Then I report "Operator can enable or disable betting "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ClosedaccountSearch!
Scenario: Back Office - Closed account Search
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue             | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.ClosedCustomer | Status.Closed |
  Then I report "Operator can search "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_-VerifythatOperatorcanRejectandApproveaccountstatuses!
Scenario: CC BO - Verify that Operator can Reject and Approve account statuses
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "spcc-bo" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I wait "5"
  Then I scroll page to bottom
  #Pre-requsite
  Then I check table "Table.ReviewTransaction" with values as "M-PESA Account Fin" and click on "Change Status" for Status "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Account Status'"
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  # Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Reject" task from group task for "Transaction Confirmation"
  #Post-requsite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I check table "Table.ReviewTransaction" with values as "M-PESA Account Fin" and click on "Change Status" for Status "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Account Status'"
  Then I report "Operator successfully Reject and Approved reversals Transaction"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Operatorcansuccessfullyexportstatements!
Scenario: Operator can successfully export statements
  Given I login to Fintech as "orgB2C" operator
  Then I click on "Transaction Center" on button in top menu
  Then I click on left child menu "Account Statement " in org of the "Transaction Center" Page
  Then I select drop down "Account Type" with option "Utility Disbursement Account"
  Then I click on " Search " button in cite
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.CSVexport"
  Then I check file is downloaded in "csv" format
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.PDFExport"
  Then I check file is downloaded in "pdf" format
  Then I report "Operator can successfully Export statement"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_BusinessPaymentviaBulk!
Scenario: Business Payment via Bulk.
  Given I login to Fintech as "orgB2C" operator
  Given I generate name "BPB" with value "BPB_RAND_2"
  Then I click on "Business Center" on button in top menu
  Then I click on " Add " button in cite
  Then I enter text in "Label.Plan Name" with value "BPB"
  Then I click on "GenericLocators.Bulkpaymenmtdrop"
  Then I click on "GenericLocators.Bulkpaymenmtdrop1"
  Then I select the file to upload from "Bulk Task Payment Template xml.xml"
  Then I scroll "GenericLocators.ScrollTimeschedule" to view using "false" parameter
  Then I select drop down "Organization Name" with option "Morolong"
  Then I select drop down "Service" with option "BusinessPaymentBulk"
  Then I scroll "GenericLocators.ScrollTimeschedule" to view using "false" parameter
  Then I click on "Next Available Time Slot" radio
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.ConfirmException"
  Then I logout the "org" portal and close the browser
  Given I login to Fintech as "sp" operator
  When MakerChecker is on "Approve" task from group task for "Approve 'Manage Bulk Task Plan'"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "orgB2C" operator
  Then I click on "Business Center" on button in top menu
  Then I click on "Search" button in cite
  Then I check table "Table.Bulk" with multiple values as "BPB" and click on "Detail" of "Operation" column
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_ApproveWithdrawals!
Scenario:Approve withdrawals
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "E-money Withdrawal" in the "Home" Page
  Then I enter text in "Label.Amount($)" with value "Amount.Minimum"
  Then I select drop down "From" with option "M-PESA Account \ 1010000800000100010011426"
  Then I select drop down "To" with option "dcacc \ 1134567"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "E-money withdrawal submitted successfully." is visible
  Then I click on left child menu "Approve Finance Transactions" in the "Home" Page
  Then I select drop down "Transaction Type" with option "Transfer to M-PESA Control Account"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ApproveCheckbox"
  Then I click on "Confirm" radio
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Finance transaction approved successfully." is visible
  Then I report "The sp operator can approve Finance withrawals Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_CancelWithdrawals!
Scenario:Cancel withdrawals
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "E-money Withdrawal" in the "Home" Page
  Then I enter text in "Label.Amount($)" with value "Amount.Minimum"
  Then I select drop down "From" with option "M-PESA Account \ 1010000800000100010011426"
  Then I select drop down "To" with option "dcacc \ 1134567"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "E-money withdrawal submitted successfully." is visible
  #Approve The Transaction
  Then I click on left child menu "Approve Finance Transactions" in the "Home" Page
  Then I select drop down "Transaction Type" with option "Transfer to M-PESA Control Account"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ApproveCheckbox"
  Then I click on "Confirm" radio
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Finance transaction approved successfully." is visible
  #Cancel the Transaction
  Then I click on left child menu "Cancel Finance Transactions" in the "Home" Page
  Then I select drop down "Transaction Type" with option "Transfer to M-PESA Control Account"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ApproveCheckbox"
  Then I click on "Reverse Trade Order(Original Transaction)" radio
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Finance transaction cancelled successfully." is visible
  Then I report "The sp operator can cancel Finance withrawals Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ControlAccounttransfer!
Scenario:Control Account transfer
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Control Account Transfer" in the "Home" Page
  Then I enter text for "GenericLocators.Amounttransfer" with value "Amount.Minimum"
  Then I select drop down "From" with option "Control Account \ 1010000800000100010001426"
  Then I click on "GenericLocators.Todropdown"
  Then I wait "5"
  Then I click on "GenericLocators.Dropdownvalue"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on " Submit " button in cite
  When static text "Control account transfer submitted successfully" is visible
  Then I report "The sp operator can Control account transfer submitted successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_E-Moneywithdrawal!
Scenario:E-Money withdrawal
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "E-money Withdrawal" in the "Home" Page
  Then I enter text in "Label.Amount($)" with value "Amount.Minimum"
  Then I select drop down "From" with option "M-PESA Account \ 1010000800000100010011426"
  Then I select drop down "To" with option "dcacc \ 1134567"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "E-money withdrawal submitted successfully." is visible
  Then I report "The sp operator can do E-money withdrawal submitted successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_FinanceBankStatementexport!
Scenario: Bank Statement export
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank File" in the "Home" Page
  Then I click on left child menu "EFT" in the "Home" Page
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.CheckboxforTill"
  Then I click on "GenericLocators.ExportFinaceButton"
  When static text "EFT files exported successfully." is visible
  Then I report "Bank Statement export successfully"

@TC_FINLSO_GPTC_BankStatementImport!
Scenario:Bank Statement import
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank File" in the "Home" Page
  Then I click on left child menu "Bank Statement" in the "Home" Page
  Then I click on " Import " button in cite
  Then I click on "GenericLocators.ImportBank"
  Then I click on "GenericLocators.PostBankOption"
  Then I click on "GenericLocators.FinanceBankBranch"
  Then I click on "GenericLocators.SgBank"
  Then I click on "GenericLocators.TrustAccountFin"
  Then I click on "GenericLocators.TrustBankAcc"
  Then I select the file to upload from "VODAmpesa_MT940_LS_sp_deposit2_manual.txt"
  Then I wait "10"
  Then I click on "GenericLocators.ImportButton"
  When static text "Import success" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Searchforrefund!
Scenario:Search for refund
  Given I login to Fintech as "spBackoff" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "Search for Refund" in the "Home" Page
  Then I enter text in "Label.MSISDN" with value "%%"
  Then I click on " Search " button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "" and click on "Refund" of "Operation" column
  Then I enter text for "GenericLocators.MsisdninRefund" with value "Customer.Registered_Customer1"
  Then I click on "GenericLocators.Verify"
  Then I enter text area "Remark" with value "Test"
  Then I click on " Submit " button in cite
  Then I click on "GenericLocators.Confirm"
  When MakerChecker is on "Approve" task from group task for "Approve 'Dormant Identity Refund"
  Then I report "Search for refund"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Verifyoperatorcansuccessfullyeditsettlementnumberformerchants!
Scenario: Verify operator can successfully edit settlement number for merchants
  Given I login to Fintech as "sp" operator
  Given I generate name "settlement number1" with value "26656183910"
  Given I generate name "settlement number" with value "26656183915"
  #Pre-requsite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode4 | Label.Organization Short Code | ShortCode.ShortCode4 | Status.Active |
  Then I edit org KYC Info with below details
  | Settlementnumber   | Reason |
  | settlement number1 | Test   |
  #Approve
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization KYC'"
  #Post-requsite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode4 | Label.Organization Short Code | ShortCode.ShortCode4 | Status.Active |
  Then I edit org KYC Info with below details
  | Settlementnumber  | Reason |
  | settlement number | Test   |
  #Approve
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization KYC'"
  Then I report "Organization KYC changed successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_ExportMT101!
Scenario: Export MT101
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank File" in the "Home" Page
  Then I click on left child menu "EFT" in the "Home" Page
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.CheckboxforTill"
  Then I click on "GenericLocators.ExportFinaceButton"
  Then static text "EFT files exported successfully." is visible
  Then I report "Export MT101 successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_BulkMSISDNrecycle!
Scenario: Back Office Role - Bulk MSISDN recycle
  #Creating customers
  Given I login to Fintech as "sp" operator
  Given I generate name "FirstName" with value "TestKYC"
  Given I generate name "LastName" with value "AutomationKYC"
  Given I generate name "MiddleName" with value "FintechTest"
  Then I create customer the with below details
  | Product Name                | MSISDN      | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number     | Document Received |
  | DropDown.Registeredcustomer | 26650045000 | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | 1300456256268 | Label.Yes         |
  Then I create customer the with below details
  | Product Name                | MSISDN      | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number     | Document Received |
  | DropDown.Registeredcustomer | 26650046000 | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | 1300446256268 | Label.Yes         |
  Then I create customer the with below details
  | Product Name                | MSISDN      | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number     | Document Received |
  | DropDown.Registeredcustomer | 26650047000 | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | 1300456736268 | Label.Yes         |
  Then I logout the "sp" portal and close the browser

  #Process For bulk recycling the msisdn
  Given I login to Fintech as "spBackoff" operator
  Then I click on left child menu "Bulk" in the "Home" Page
  Then I click on menu "Bulk Task Plan"
  Then I click on "GenericLocators.CreateBulk"
  Then I enter text in "Label.Plan Name" with value "AUTOMATION TESTING PURPOSE"
  Then I select drop down "Bulk Type" with option "Recycle MSISDN"
  Then I select the file to upload from "RECYCLE_MSISDN.XML"
  Then I wait "10"
  Then I scroll "GenericLocators.ScrollTimeschedule" to view using "false" parameter
  Then I click on "Next Available Time Slot" radio
  Then I enter text area "Description" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I click on " View Detail >> " to check
  Then I wait "10"
  Then I report "Bulk Recycle MSISDN via Back Portal"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_InitiateE-money!
Scenario:Initiate e-money
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank Reconciliation" in the "Home" Page
  Then I click on left child menu "Reconciliation Process" in the "Home" Page
  Then I click on "GenericLocators.OutsatandingEntry"
  Then I wait "3"
  Then I click on "GenericLocators.CheckboxForOutstanding"
  Then I click on menu " Lock "
  When static text "Message.EntriesLocked" is visible
  Then I check table "Table.EntryLocked" with multiple values as "test001" and click on "Process" of "Operation" column
  Then I select drop down "Transaction Type" with option "Business Deposit2"
  Then I select drop down "Reason Type" with option "Organisation Deposit of Funds"
  Then I click on "GenericLocators.CreditPartyType"
  Then I click on "GenericLocators.Organization"
  Then I enter text for "GenericLocators.CreditParty" with value "ShortCode.ShortCode1"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit " button in cite
  Then I report "The Sp operator can Initiate e-money"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Approvependingtransactions!
Scenario: Approve pending transactions
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank Reconciliation" in the "Home" Page
  Then I click on left child menu "Reconciliation Process" in the "Home" Page
  Then I click on "GenericLocators.PendingApprove"
  Then I check table "Table.CustomerInUserService" with multiple values as "" and click on "Process" of "Operation" column
  Then I click on "Approved" radio
  Then I enter text area "Remark" with value "Test"
  Then I click on " Submit " button in cite
  # When static text "Message.Entriesprocesssubmittedsuccessfully" is visible
  Then I report "Approve pending transactions successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Linktransactionsasignored!
Scenario: Link transactions as ignored
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank Reconciliation" in the "Home" Page
  Then I click on left child menu "Reconciliation Process" in the "Home" Page
  Then I click on "GenericLocators.Outsatanding"
  Then I click on "GenericLocators.CheckboxOutstanding"
  Then I click on menu " Lock "
  Then I check table "Table.CustomerInUserService" with multiple values as "" and click on "Process" of "Operation" column
  Then I select drop down "Entry Type" with option "Ignore Entry"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit " button in cite
  When static text "Message.Entriesprocesssubmittedsuccessfully" is visible
  Then I report "Link transactions as ignored successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Linktransactionsasduplicate!
Scenario: Link transactions as duplicate
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank Reconciliation" in the "Home" Page
  Then I click on left child menu "Reconciliation Process" in the "Home" Page
  Then I click on "GenericLocators.Outsatanding"
  Then I click on "GenericLocators.CheckboxOutstanding"
  Then I click on menu " Lock "
  Then I check table "Table.CustomerInUserService" with multiple values as "" and click on "Process" of "Operation" column
  Then I select drop down "Entry Type" with option "Duplicate Entry"
  Then I enter text in "Duplicate Entry Id" with value "Reason Description"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit " button in cite
  When static text "Entries process submitted successfully." is visible
  Then I report "The Sp operator can Link transactions as duplicate successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifythatoperatorcanunlockcustomerPIN!
Scenario:Take a call - Verify that operator can unlock customer PIN
  Given I generate name "WrongPin" with value "RAND_4"
  When I perform "Customer.CheckBalanceWrongPin" Service "strMaxTimes" times for "Handset.RegisteredCustomerThree" and verify message "Messages.Locked"
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I select "Unlock PIN" in Operation
  When static text "Message.UnlockSuccess" is visible
  Then I select "Close the Call" in Operation
  When static text "Message.closeCall" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifythatoperatorcanunlockcustomerPINinCCBO!
Scenario: CCBO - Verify that operator can unlock customer PIN
  Given I generate name "WrongPin" with value "RAND_4"
  When I perform "Customer.CheckBalanceWrongPin" Service "strMaxTimes" times for "Handset.RegisteredCustomerThree" and verify message "Messages.Locked"
  Given I login to Fintech as "spcc-bo" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I select "Unlock PIN" in Operation
  When static text "Message.UnlockSuccess" is visible
  Then I select "Close the Call" in Operation
  When static text "Message.closeCall" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifyingSPOperatorcanunlockPINandconfirmationrecievedonactiveCustomerphone!
Scenario: Verifying SP Operator can unlock PIN and confirmation recieved on active Customer phone
  Given I generate name "WrongPin" with value "RAND_4"
  When I perform "Customer.CheckBalanceWrongPin" Service "strMaxTimes" times for "Handset.RegisteredCustomerThree" and verify message "Messages.Locked"
  Given I login to Fintech as "spBackoff" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I select "Unlock PIN" in Operation
  When static text "Message.UnlockSuccess" is visible
  Then I validate message "Messages.Unlock PIN" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I select "Close the Call" in Operation
  When static text "Message.closeCall" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_VerifyingthatOperatorcanviewsearchAUDITlogforUNLOCKPIN!
Scenario: Verifying that  Operator can view search AUDIT log for UNLOCK PIN
  Given I generate name "WrongPin" with value "RAND_4"
  # Locking The Pin
  When I perform "Customer.CheckBalanceWrongPin" Service "strMaxTimes" times for "Handset.RegisteredCustomerThree" and verify message "Messages.Locked"
  # unlocking the PIN
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I select "Unlock PIN" in Operation
  When static text "Message.UnlockSuccess" is visible
  #Viewing the Aduit Log
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select drop down "Event" with option "DropDown.UnlockPIN"
  Then I click on " Search " button in cite
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Unlock PIN" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  #Verifying the message
  Then I validate message "Messages.Unlock PIN" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Operator can view search AUDIT log for UNLOCK PIN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_UnlockPINcorrectlyonOrganizationOperatorAuditLog!
Scenario: Verifying that Operator can unlock PIN and reflects correctly on Organization Operator Audit Log
  Given I generate name "WrongPin" with value "RAND_4"
  Given I generate name "EnterShortCode" with value "ShortCode.ShortCode1"
  Given I generate name "EnterAssistantID" with value "OrgOperator.DefaultOperatorId"
  # Locking The Pin
  When I perform "Till.BalanceEnquiryWrongPIN" Service "strMaxTimes" times for "Handset.Till" and verify message "Messages.Locked"
  # unlocking the PIN
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                   | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId | ShortCode.ShortCode1 | Status.Active |
  Then I select "Unlock PIN" in Operation
  When static text "Message.UnlockSuccess" is visible
  # Viewing the Aduit Log
  Then I click on "GenericLocators.AuditLogInOrgOperator"
  Then I select drop down "Category" with option "DropDown.Identity Management"
  Then I select drop down "Event Group" with option "DropDown.OrgOpeOptionInAuditLog"
  Then I click on "GenericLocators.Event"
  Then I click on "GenericLocators.UnlockOperatorPin"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|Unlock Operator Pin" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I wait "2"
  Then I report "Organization Operator can view AUDIT log for UNLOCK PIN"
  Then I logout the "sp" portal and close the browser