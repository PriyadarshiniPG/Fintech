@FINLSO_REG_MARKET!
Feature: Fintech2.0 Regression Market Web feature

@TC_FINLSO_REG_MARKET_TAC-ResetcustomerPIN!
Scenario: Take a call - Reset customer PIN
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I select "Reset PIN" in Operation
  When static text "Message.ResetPinSuccess" is visible
  Then I select "Close the Call" in Operation
  Then I report "Call center agent can reset customer Pin"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCBOResetPINsuccessfully!
Scenario: CC BO - Reset PIN successfully
  Given I login to Fintech as "spcc-bo" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I select "Reset PIN" in Operation
  When static text "Message.ResetPinSuccess" is visible
  Then I get the value of initial pin from "Handset.RegisteredCustomerThree" for sms "Messages.ResetPinGenerated" and store in "PinGenerated"
  Given I generate name "NewPin" with value "RAND_4"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.ResetPin" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.ResetPinConfirmed" on "Handset.RegisteredCustomerThree"
  Then I replace the "Handset.RegisteredCustomerThree.PIN" value with "NewPin" in the "fin_handset_testdata" json in folder "FolderLocation.Regression"
  Then I select "Close the Call" in Operation
  Then I report "Customer Care back office can reset pin successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TACViewOperatorAuditLog!
Scenario: Take a call - View Operator Audit Log
  Given I login to Fintech as "spcc" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | pass       |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I click on "GenericLocators.AuditLogInOrgOperator"
  Then I select drop down "Category" with option "DropDown.Identity Management"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|Unlock Operator Pin" and click on "Detail" of "Operation" column
  Then I wait "2"
  Then I click on "GenericLocators.CloseViewDetails"
  Then I select "Close Call" in Operation
  Then I report "Call center agent can view Operator audit log"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TACViewKYCDetails!
Scenario: Take a call - View KYC Details
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I click on the "KYC Info" tab
  Then I scroll "GenericLocators.EditKYC" to view using "true" parameter
  Then I select "Close the Call" in Operation
  Then I report "Call center agent can view Operator audit log"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCUnlockPINsuccessfully!
Scenario: CC BO - Unlock PIN successfully
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
  Then I validate message "Messages.Unlock PIN" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Customer Care back office can Unlock pin successfully"
  Then I select "Close the Call" in Operation
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TACUnlockcustomerPin!
Scenario: Take a Call - Unlock customer Pin
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
  Then I report "Call Center Agent can Unlock pin"
  Then I select "Close the Call" in Operation
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_EnableBetting!
Scenario: CC BO - Enable Betting
  Given I login to Fintech as "spcc-bo" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  And I edit KYC Info with below details
  | Betting | Reason |
  | Enable  | Test   |
  When static text "Message.Submittedsuccessfully" is visible
  #Post condition
  Then I edit KYC Info with below details
  | Betting | Reason |
  | Disable | Test   |
  Then I report "Customer Care back office can can enable or disable betting"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TakeCall-ResetOperatorPassword!
Scenario: Take a call - Reset Operator Password
  Given I login to Fintech as "spcc" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                     | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId4 | pass       |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I select "Reset Password" in Operation
  Then I click on "GenericLocators.ConfirmException"
  Then I select "Close Call" in Operation
  When MakerChecker is on "Approve" task from group task for "Approve 'Reset Organization Operator Password'"
  Then I logout the "sp" portal and close the browser
  Then I report "Operator password is successfully reset"

@TC_FINLSO_REG_MARKET_TakeCall-ResetOperatorPIN!
Scenario: Take a call - Reset Operator PIN
  Given I login to Fintech as "spcc" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                     | PassOrFail |
  | ShortCode.ShortCode2 | OrgOperator.DefaultOperatorId4 | pass       |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I select "Reset PIN" in Operation
  Then I click on "GenericLocators.ConfirmException"
  Then I select "Close Call" in Operation
  When MakerChecker is on "Approve" task from group task for "Approve 'Reset Organization Operator PIN'"
  Then I logout the "sp" portal and close the browser
  Then I report "Operator PIN is successfully reset"

@TC_FINLSO_REG_MARKET_TakeCall-UnlockOperatorPIN!
Scenario: Take a call - Unlock Operator Pin
  Given I generate name "WrongPin" with value "RAND_4"
  Given I generate name "EnterShortCode" with value "ShortCode.ShortCode1"
  Given I generate name "EnterAssistantID" with value "OrgOperator.DefaultOperatorId"
  # Locking The Pin
  When I perform "Till.BalanceEnquiryWrongPIN" Service "strMaxTimes" times for "Handset.Till" and verify message "Messages.Locked"
  Given I login to Fintech as "spcc" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | pass       |
  Then I click on " Verify " button in cite
  Then I switch to next frame
  Then I select "Unlock PIN" in Operation
  When static text "Message.UnlockSuccess" is visible
  Then I select "Close Call" in Operation
  Then I logout the "sp" portal and close the browser
  Then I report "Operator PIN is successfully unlocked"

@TC_FINLSO_REG_MARKET_TakeCall-VerifiedOperatorAuthentication!
Scenario: Take a call - Operator Authentication - Verified Operator
  Given I login to Fintech as "spcc" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | pass       |
  Then I click on " Verify " button in cite
  When static text "Message.VerifySuccess" is visible
  Then I select "Close Call" in Operation
  Then I logout the "sp" portal and close the browser
  Then I report "Operator Authentication is successfully verified"

@TC_FINLSO_REG_MARKET_TakeCall-UnverifiedOperatorAuthentication!
Scenario: Take a call - Operator Authentication - Unverified Operator
  Given I login to Fintech as "spcc" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | fail       |
  Then I click on " Verify " button in cite
  When static text "Message.Verification failed" is visible
  Then I logout the "sp" portal and close the browser
  Then I report "Operator Authentication is declined"

@TC_FINLSO_REG_MARKET_OrganizationChangestatustosuspended!
Scenario:CCH BO Operator - Organization Change status to suspended
  Given I login to Fintech as "spcc-bo" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "The status of the Organization changes to Suspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_OrganizationChangestatustoFrozen!
Scenario:CCH BO Operator - Organization Change status to Frozen
  Given I login to Fintech as "spcc-bo" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "The status of the Organization changes to Frozen."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_changecustomerstatustoactive!
#Defect:Approval is required to change status
Scenario: CCH BO Operator -change customer status to active
  Given I login to Fintech as "spcc-bo" operator
  #Prerequisite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Frozen"
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
  Then I report "The status of the customer changes to active."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_changeoperatorstatustosuspended!
Scenario:CCH BO Operator -change operator status to suspended
  Given I login to Fintech as "spcc-bo" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "The status of the changeoperatorstatustosuspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_changecustomerstatustoFrozen!
#Defect: Approval is required to change status
Scenario: CCH BO Operator -change customer status to Frozen
  Given I login to Fintech as "spcc-bo" operator
  #Prerequisite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Frozen"
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
  Then I report "The status of the customer changes to Frozen."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCHBOOperatorchangecustomerstatustosuspended!
Scenario: CCH BO Operator -change customer status to suspended
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer4 | Label.MSISDN | Customer.Registered_Customer4 | Status.Active |
  Then I edit Identity Status of customer with value "Suspended"
  Then I edit Identity Status of customer with value "Active"
  Then I report "The status of the customer changes to Suspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TakeacallInitiateReversal!
Scenario: Take a call - Initiate Reversal
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Operator successfully initiate reversal for registered customer"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TakeacallViewcustomerauditlog!
Scenario: Take a call - View customer audit log
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | pass    | chennai      |
  Then I click on " Verify " button in cite
  # Then I wait "5"
  Then I verify Portal Log with below details
  | Table                      | Log                     | Tablevalue  | Sp  |
  | Table.CustomercareIdentity | Customer Care Audit Log | Take a Call | Yes |

@TC_FINLSO_REG_MARKET_CCBOApproveReversalRequest!
Scenario: CC BO - Approve Reversal Request
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
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Operator successfully Approve reversals Transaction"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCBORejectReversalRequest!
Scenario: CC BO - Reject Reversal Request
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
  Then I report "Operator successfully Reject reversals Transaction"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCBOViewKYCdetails!
Scenario: CC BO - View KYC details
  Given I login to Fintech as "spcc-bo" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I click on the "KYC Info" tab
  Then I wait "3"
  Then I report "SP Operator Query Customers View KYC details"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TakeacallOperatorInitiateCustomerReversal!
Scenario: Take a call - Operator -Initiate Customer Reversal
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Operator successfully initiate reversal for registered customer"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCBOOperatorInitiateCustomerReversal!
Scenario: CC BO - Operator -Initiate Customer Reversal (From review transation)
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
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Operator successfully Approve reversals Transaction"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Takeacall-Operator-Viewcustomergrouplist!
Scenario:Take a call - Operator -View customer group list
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | Placeofbirth |
  Then I click on Generic "Pass"
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I click on left child menu "Group List" in the "Home" Page
  Then I select "Close the Call" in Operation
  Then I report "Take a call - Operator -View customer group list"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Takeacall-Operator-ViewOperatorauditlog!
Scenario:Take a call - Operator - View Operator audit log
  Given I login to Fintech as "sp" operator
  When I verify organization operator from Take a Call
  | ShortCode            | PassOrFail |
  | ShortCode.ShortCode1 | pass       |
  Then I click on " Verify " button in cite
  When static text "Verify Success!" is visible
  Then I click on "GenericLocators.AuditLogInOrgOperator"
  Then I select drop down "Category" with option "Customer Care"
  Then I select drop down "Event Group" with option "Take a Call"
  Then I click on "GenericLocators.Event"
  Then I click on "GenericLocators.EventDropdownvalue"
  Then I click on "Search" button in cite
  Then I select "Close Call" in Operation
  Then I report "Customer Care Operator is able to verify by Shortcode or Operator ID"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_EditBankStatementTemplate!
Scenario:FS_Edit Bank Statement Template
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
  # Post-condition
  Then I click on "Edit" button in cite
  Then I enter text in "Label.FileTemplateName" with value "Bank_Template"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Editbutton"
  Then I click on "GenericLocators.DeleteField"
  Then I wait "3"
  Then I click on "GenericLocators.DeleteFieldConfirm"
  Then I click on "Submit" button in cite
  Then I report "FS_Edit Bank Statement Template"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_QueryBankSatementTemplate!
Scenario:FS_Query Bank Satement Template
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I enter text in "Label.TemplateName" with value "Bank_Query"
  Then I click on " Search " button in cite
  Then I select drop down "Statement Type" with option "DropDown.NormalTransactions"
  Then I enter text in "Label.TemplateName" with value " "
  Then I click on " Search " button in cite
  Then I select drop down "Format" with option "DropDown.MT940"
  Then I click on "GenericLocators.BankStatementType"
  Then I click on "GenericLocators.AllTransaction"
  Then I click on " Search " button in cite
  Then I report "FS_Query Bank Satement Template"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_CreataTrustAccount!
# Pending- can not accept data more than two times
Scenario:FS_Create a Trust Account
  Given I login to Fintech as "sp" operator
  Then I create trustbank
  Given I generate name "BankName" with value "Bank_RAND_4"
  Given I generate name "Accountnumber" with value "77774444555566611111_RAND_4"
  Then I enter text for "GenericLocators.BankAccountName" with value "BankName"
  Then I enter text for "GenericLocators.AccountNumber" with value "Accountnumber"
  Then I click on "Submit" button in cite
  # Then I check error text "Duplicate finance exchange mode and currency for creating trust account." is displayed
  # Then I click on "Confirm" button in cite
  # Then I click on " Cancel " button in cite
  Then I report "FS_Create a Trust Account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_CreateaTrustBank!
Scenario:FS_Create a Trust Bank
  Given I login to Fintech as "sp" operator
  Given I generate name "shortcode" with value "12_RAND_4"
  Given I generate name "trustbankcode" with value "01_RAND_1"
  Given I generate name "bankbranch" with value "TEST_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Bank" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I wait "3"
  Then I select drop down "Bank" with option "CENTRAL BANK OF LESOTHO"
  Then I enter text for "GenericLocators.BankBranch" with value "bankbranch"
  Then I enter text for "GenericLocators.BankBranchShortcode" with value "shortcode"
  Then I click on "GenericLocators.TrustBankCheckbox"
  Then I wait "3"
  Then I scroll page to bottom
  Then I enter text for "GenericLocators.TrustBankCode" with value "trustbankcode"
  Then I click on "GenericLocators.TrustBankOffline"
  Then I click on "Next " button in cite
  Then I click on "Next " button in cite
  Then I click on "Submit " button in cite
  When static text "Bank created successfully." is visible
  Then I report "FS_Create a Trust Bank"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_CreateaCopyBankStatementTemplate!
Scenario:FS_Create a Copy Bank Statement Template
  Given I login to Fintech as "sp" operator
  Given I generate name "BankName" with value "Bank_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I click on "GenericLocators.Create"
  Then I enter text for "GenericLocators.PleaseEntertextbox" with value "BankName"
  Then I click on "GenericLocators.StatementType"
  Then I click on "GenericLocators.NormalTransactions"
  Then I click on "GenericLocators.Format"
  Then I click on "GenericLocators.CSV1"
  Then I click on "GenericLocators.CopyFrom"
  Then I click on "GenericLocators.BankCopyFormTemp"
  Then I click on " Submit" button in cite
  Then I check table "Table.Till" with multiple values as "BankName" and click on "Detail" of "Operation" column
  Then I report "FS_Create a Copy Bank Statement Template"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_Exception_CreateaBankStatementTemplatewithDuplicateName!
Scenario:FS_Exception_Create a Bank Statement Template with Duplicate Name
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I click on "GenericLocators.Create"
  Then I enter text for "GenericLocators.PleaseEntertextbox" with value "Bank6128"
  Then I click on "GenericLocators.StatementType"
  Then I click on "GenericLocators.NormalTransactions"
  Then I click on "GenericLocators.Format"
  Then I click on "GenericLocators.CSV"
  Then I click on " Submit" button in cite
  Then I check error text "Bank statement template name duplicated" is displayed
  Then I click on "Confirm" button in cite
  Then I click on "Cancel" button in cite
  Then I report "FS_Exception_Create a Bank Statement Template with Duplicate Name"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_C2BOrgPortalDownloadStatement!
Scenario:C2B OrgPortal DownloadStatement
  Given I login to Fintech as "orgC2B" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "My Organization " in org of the "Identity Center" Page
  Then I click on " View Detail " button in cite
  Then I Switch tab
  Then I click on "GenericLocators.Overview"
  Then I click on "GenericLocators.Review Transaction"
  Then I click on " Search " button in cite
  Then I scroll "GenericLocators.Itemspage" to view using "false" parameter
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.PDFExport"
  Then I check file is downloaded in "pdf" format
  Then I report "Org Account statement can be downloaded as PDF"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_CCHBOOperatorViewcustomerauditlog!
Scenario:CCH BO Operator -View customer audit log
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on "GenericLocators.CustomerAuditlog"
  Then I select drop down "Category" with option "Customer Care"
  Then I wait "5"
  Then I click on "Search" button in cite
  Then I report "Operator Can View customer audit log "
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|Unlock Operator Pin" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCHBOOperatorSearchGroupTask!
Scenario:CCH BO Operator -Search Group Task
  Given I login to Fintech as "spcc-bo" operator
  Then I click on left child menu "Task Center" in the "Home" Page
  Then I click on "GenericLocators.GroupTask"
  Then I select drop down "Task Type" with option "Transaction and Action"
  Then I click on " Search " button in cite
  Then I report "Operator Can Search Group Task "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TakeacallensurethatcallcentreagentisunabletoChangeoperatorIdentitystatus!
Scenario:Take a call - ensure that call centre agent is unable to Change operator Identity status
  Given I login to Fintech as "spcc" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | UserName         | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | Login.org.UserID | pass       |
  Then I click on " Verify " button in cite
  Then I Verify element "GenericLocators.EditIdentityStatus" not available
  Then I report "Call centre agent is unable to Change operator Identity status "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorcansuccessfullyviewAccumulator!
Scenario:SP Operator can successfully view Accumulator
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on "GenericLocators.Accumulator"
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|Unlock Operator Pin" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseView"
  Then I report "SP Operator can successfully view Accumulator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorcansuccessfullyviewcustomerbeneficiary!
Scenario:SP Operator can successfully view customer beneficiary
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on "GenericLocators.BeneficiaryList"
  Then I report "SP Operator can successfully view customer beneficiary"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorcansuccessfullyreviewcustomertransactions!
Scenario:SP Operator can successfully review customer transactions
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.ReviewTransactionBo"
  Then I click on " Search " button in cite
  Then I report "SP Operator can successfully view customer beneficiary"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TACCustomerAuthenticationVerifiedCustomer!
Scenario: Take a call - Customer Authentication - Verified Customer
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  When static text "Message.VerifySuccess" is visible
  Then I select "Close the Call" in Operation
  Then I logout the "sp" portal and close the browser
  Then I report "Customer Authentication Verified Customer"

@TC_FINLSO_REG_MARKET_TACCustomerAuthenticationUnverifiedCustomer!
Scenario: Take a call - Customer Authentication - Unverified Customer
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Fail | chennai      |
  Then I click on " Verify " button in cite
  When static text "Message.Verification failed" is visible
  Then I logout the "sp" portal and close the browser
  Then I report "Customer Authentication is declined"

@TC_FINLSO_REG_MARKET_CentrallyOwnedHOdeposittoSuperagent
Scenario: Web - Top Org _ Centrally Owned HO - deposit to Super agent
  Given I login to Fintech as "orgAHO" operator
  Then I initiate transaction with below details
  | Transaction_Services                | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessDeposit | Short Code                       | ShortCode.ShortCode7           | Amount.Minimum1 | Reason Description |
  #Verify SMS
  Then I report "Centrally Owned Top Organization is able to deposite Super Agent"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_CentrallyOwneddepositanothercentrallyownedHO!
Scenario: Web - Top Org _ Centrally Owned HO - deposit to another centrally owned HO
  Given I login to Fintech as "orgAHO" operator
  Then I initiate transaction with below details
  | Transaction_Services                | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessDeposit | Short Code                       | ShortCode.ShortCode6           | Amount.Minimum1 | Reason Description |
  #Verify SMS
  Then I report "Centrally Owned Top Organization is able to deposite to another centrally owned HO"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_FSDownloadFailedParsedBankStatementLog!
Scenario: FS_Download Failed Parsed Bank Statement Log
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank File" in the "Home" Page
  Then I click on left child menu "Bank Statement" in the "Home" Page
  Then I select drop down "Status" with option "FAILED"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.BankDownloadLog"
  Then I click on "GenericLocators.BankLog"
  Then I check file is downloaded in "log" format
  Then I report "FS Download Failed Parsed Bank Statement Log successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FSDownloadSuccessfulParsedBankStatementLog!
Scenario: FS_Download Successful Parsed Bank Statement Log
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank File" in the "Home" Page
  Then I click on left child menu "Bank Statement" in the "Home" Page
  Then I select drop down "Status" with option "SUCCEED"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.BankDownloadLog"
  Then I click on "GenericLocators.BankLog"
  Then I check file is downloaded in "log" format
  Then I report "FS_Download Successful Parsed Bank Statement Log successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FSDownloadSuccessfulParsedBankStatementFile!
Scenario: FS_Download Successful Parsed Bank Statement File
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank File" in the "Home" Page
  Then I click on left child menu "Bank Statement" in the "Home" Page
  Then I select drop down "Status" with option "SUCCEED"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.BankDownloadLog"
  Then I click on "GenericLocators.BankFile"
  Then I check file is downloaded in "txt" format
  Then I report "FS_Download Successful Parsed Bank Statement File successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-TopOrgCentrallyOwnedStore-InternaltransferM-Pesatofloatviaweb!
Scenario: Web - Top Org _ Centrally Owned Store - Internal transfer (M-Pesa to float) via web
  Given I login to Fintech as "orgAHO" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                                           | Amount          | Reason             |
  | TransactionServices.OrganizationFundsManagementMoveFunds | Agency Transfer from Working Account to Float Account | Amount.Minimum1 | Reason Description |
  Then I report "Centrally Owned Store - Internal transfer (M-Pesa to float) via web successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-TopOrgCentrallyOwnedStore-InternaltransferFloattoM-Pesa!
Scenario: Web - Top Org _ Centrally Owned Store - Internal transfer (Float to M-Pesa)
  Given I login to Fintech as "orgAHO" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                                           | Amount          | Reason             |
  | TransactionServices.OrganizationFundsManagementMoveFunds | Agency Transfer from Float Account to Working Account | Amount.Minimum1 | Reason Description |
  Then I report "Centrally Owned Store - Internal transfer (Float to M-Pesa) via web successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_C2BOrgPortalInternalTransferOfOrganizationFunds-PayMerchant!
Scenario:C2B_Org Portal-Internal Transfer of Organization Funds-Pay Merchant(M-pesa Account to Merchant Account)
  Given I login to Fintech as "orgC2B" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                                     | Amount          | Reason             |
  | TransactionServices.BusinessTransfersfromMerchantaccount | Transfer from Mpesa Account to Merchant Account | Amount.Minimum1 | Reason Description |
  Then I report "Tnternal Transfer of Organization Fund from M-pesa Account to Merchant Account is completed Successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_C2BOrgPortalInternalTransferOfOrganizationFundsPayMerchant!
Scenario:C2B_Org Portal-Internal Transfer of Organization Funds-Pay Merchant(Merchant Account to M-pesa Account)
  Given I login to Fintech as "orgC2B" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                                     | Amount          | Reason             |
  | TransactionServices.BusinessTransfersfromMerchantaccount | Transfer from Merchant Account to Mpesa Account | Amount.Minimum1 | Reason Description |
  Then I report "Tnternal Transfer of Organization Fund from Merchant Account to M-pesa Account is completed Successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_C2B_OrgPortal-MerchantBankWithdrawalOfFunds!
Scenario:C2B_Org Portal-Merchant Bank Withdrawal of Funds
  Given I login to Fintech as "orgC2B" operator
  Then I initiate transaction with below details
  | Transaction_Services                              | Amount          | Receiving_Bank_Account | Reason             |
  | TransactionServices.MerchantBankWithdrawalofFunds | Amount.Minimum1 | Bank.Rec_Bank          | Reason Description |
  Then I report "C2B_Org Portal-Merchant Bank Withdrawal of Funds is completed Successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_C2B_OrgPortal-MerchantPaysAnotherMerchantViaOrgPortal!
Scenario:C2B_Org Portal-Merchant pays another Merchant via org portal
  Given I login to Fintech as "orgC2B" operator
  Then I initiate transaction with below details
  | Transaction_Services                   | Primary_Identifier_ShortCode | Receiver_Identifier_Short_Code | Receiver_Identifier_Account_Type | Amount          | Reason             |
  | TransactionServices.MerchantToMerchant | ShortCode.ShortCode2         | ShortCode.ShortCode1           | Short Code                       | Amount.Minimum1 | Reason Description |
  Then I report "Transfer From Merchant Pay To Merchant Via WEB is Successfully Completed"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_CCBOOperator-OrganizationChangestatusFrozen!
Scenario:CC BO Operator - Organization Change status Frozen
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  #Post Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "The CCBO Sp operator can change the organization status to Frozen"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CSVBankStatementTemplate!
Scenario: FS_Create a MT940/MT942/CSV Bank Statement Template
  Given I login to Fintech as "sp" operator
  Given I generate name "BankName" with value "Bank_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I click on "GenericLocators.Create"
  Then I enter text for "GenericLocators.PleaseEntertextbox" with value "BankName"
  Then I click on "GenericLocators.StatementType"
  Then I click on "GenericLocators.NormalTransactions"
  Then I click on "GenericLocators.Format"
  Then I click on "GenericLocators.CSV"
  Then I click on " Submit" button in cite
  Then I check table "Table.RemovedAccount" with multiple values as "BankName" and click on "Detail" of "Operation" column
  Then I report "Creating of CSV Bank Statement Template is Completed"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorcansuccessfullychangecustomerdetails-FirstnameandLastname!
Scenario: SP Operator can successfully change customer details-First name and Last name
  Given I login to Fintech as "sp" operator
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "Firstname" with value "Registered"
  Given I generate name "Lastname" with value "CustomerOne"
  #Prerequisite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit KYC Info with below details
  | First_Name | Last_Name | Reason |
  | FirstName  | LastName  | Test   |
  #Post condition
  Then I edit KYC Info with below details
  | First_Name | Last_Name | Reason |
  | Firstname  | Lastname  | Test   |
  Then I report "SP Operator can successfully change customer details-First name and Last name"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorcansuccessfullyinitiatecustomerReversalfromreviewtransaction!
Scenario: SP Operator can successfully initiate customer Reversal from review transaction
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer2 | Amount.Minimum1 | Reason Description |
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Operator successfully reverse transaction with BackOffice Role"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPVerifythatSPOperatorcansuccessfullychangeOperatorstatustoclosed!
Scenario: Business OP-Verify that SP Operator can successfully change Operator status to closed
  #Pre-requisiste
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgUsername" with value "OrgOperator_RAND_4"
  Given I generate name "msisdn" with value "8613000_RAND_6"
  Given I generate name "OpeId" with value "OperId_RAND_6"
  Then I create organization operator with below details
  | ShortCode             | Language                | AccessChannel | UserName    | MSISDN | OperatorId | Role                                                                   | Gender        | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | OrgOperator.ShortCode | Language.Southern Sotho | Web           | OrgUsername | msisdn | OpeId      | OrgOperRole,B2C Operator,C2B Operator,[Open API] API Key Administrator | Gender.Female | SMS                            | 2314563243465                 | Test Email |
  #Searching and Closing the Operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.OperatorinOrg"
  Then I enter text in "Label.User Name" with value "OrgUsername"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|Unlock Operator Pin" and click on "Detail" of "Operation" column
  # Then I click on "GenericLocators.DetailOrgSp"
  Then I edit Identity Status in "Organization operator" with value "Closed"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I report "Business OP-Verify that SP Operator can successfully change Operator status to closed"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPoperatorcansuccessfullysearchclosedcustomer!
Scenario: SP operator can successfully search closed customer
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues             | SearchBy     | SearchValue             | Status        |
  | Table.CustomerInIdentity | Customer.ClosedCustomer | Label.MSISDN | Customer.ClosedCustomer | Status.Closed |
  Then I report "SP operator can successfully search closed customer"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorSuccessfullyCreateChildOrg!
Scenario: Business Op-check SP Operator can successfully create organization - child org
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "ChildOrg_RAND_4"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create child organization with below details
  | ParentShortCode      | Product                  | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | ShortCode.ShortCode1 | Agency Independent Store | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I click on " View Detail >> " to check
  Then I report "Sp operator back office can create Create Child Org - Independent Agency store Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorAbleToCreateOrganizationOperator!
Scenario: Business Op-SP Operator creates Organization Operator
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgUsername" with value "OrgOperator_RAND_4"
  Given I generate name "msisdn" with value "8613000_RAND_6"
  Given I generate name "OpeId" with value "OperId_RAND_6"
  Then I create organization operator with below details
  | ShortCode            | Language                | AccessChannel | UserName    | MSISDN | OperatorId | Role                                                                   | Gender        | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | ShortCode.ShortCode1 | Language.Southern Sotho | Web           | OrgUsername | msisdn | OpeId      | OrgOperRole,B2C Operator,C2B Operator,[Open API] API Key Administrator | Gender.Female | SMS                            | 2314563243465                 | Test Email |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorChangesCustomerIdentityStatus!
Scenario: Retail- SP Operator can successfully change customer's identity status
  Given I login to Fintech as "spBackoff" operator
  #Prerequisite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Suspended"
  #Validation
  Then I edit Identity Status in "Customer" with value "Active"
  Then I report "SP operator is successfully able to change the customer status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorSucessfullyChangeOrganizationStatus!
Scenario: Retail - SP Operator can successfully change organization status
  Given I login to Fintech as "spcc-bo" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "SP operator is successfully able to change the Organization status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-VerifySPOperatorisabletosearchtransactionbyreceiptno!
Scenario: Business Op -Verify SP Operator is able to search transaction by receipt no.
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

@TC_FINLSO_REG_MARKET_BusinessOP-VerifySPOperatorisabletoapprovegrouptask!
Scenario: Business OP-Verify SP Operator is able to approve group task
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I close tab near to home tab
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Operator approved successfully group task Transaction"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-VerifySPOperatorisabletosearchgrouptask!
Scenario: Business OP-Verify SP Operator is able to search group task
  Given I login to Fintech as "spBackoff" operator
  Then I click on left child menu "Task Center" in the "Home" Page
  Then I click on left child menu "Group Task" in the "Home" Page
  Then I click on "Search" button in cite
  Then I report "SP Operator is able to search group task successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcannotloginwithinvalidusername!
Scenario: Business Op- check SP Operator cannot login with invalid username
  Given I login to Fintech as "spBackoffIncorrectPassword" operator
  Then I wait "3"
  Then I check error text " Incorrect username, password, or status. Remaining attempts: " is displayed
  Then I report "SP Operator cannot login with invalid username"

@TC_FINLSO_REG_MARKET_BusinessOP-checkifSPOperatorcanviewcustomersAuditLog!
Scenario:Business OP- check if SP Operator can view customer's Audit Log
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I click on "GenericLocators.CustomerAuditLog"
  Then I select drop down "Category" with option "Customer Care"
  Then I click on "Search" button in cite
  Then I report "Business OP- check if SP Operator can view customer's Audit Log Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-checkifSPOperatorcanviewcustomerthroughsearchbutton!
Scenario:Business OP - check if SP Operator can view customer through search button
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I report "Business OP - check if SP Operator can view customer through search button Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-checkSPOperatorcansuccessfullycreatecustomer!
Scenario: Business OP-check SP Operator can successfully create customer
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "CustomerMSISDN" with value "130001_RAND_5"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "IDNumber" with value "1301_RAND_3"
  Then I create customer the with below details
  | Product Name                | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Registeredcustomer | CustomerMSISDN | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  Then I report "Business OP-check SP Operator can create customer  successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPoperatorcansuccessfullysearchcustomerbyID!
Scenario: SP operator can successfully search customer by ID
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | SearchValue | SearchBy | ID Type     | ID   | Status        |
  | Table.CustomerInIdentity | MSISDN      | ID       | National ID | 1234 | Status.Active |
  Then I report "SP operator can search customer by ID successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorcansuccessfullyunlockscustomersPIN!
Scenario: SP Operator can successfully unlocks customer's PIN
  Given I generate name "WrongPin" with value "RAND_4"
  When I perform "Customer.CheckBalanceWrongPin" Service "strMaxTimes" times for "Handset.RegisteredCustomerThree" and verify message "Messages.Locked"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I select "Unlock PIN" in Operation
  When static text "Message.UnlockSuccess" is visible
  Then I validate message "Messages.Unlock PIN" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  And I report "SP Operator can successfully unlock customer's Pin"
  And I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_OrgoperatorattemptstoCreateBulkTaskPlan!
Scenario: B2C - Org operator attempts to Create Bulk Task Plan
  Given I login to Fintech as "orgB2C" operator
  Then I click on "Business Center" on button in top menu
  Then I click on " Add " button in cite
  Then I enter text in "Label.Plan Name" with value "Automation Testing"
  Then I select drop down "Bulk Type" with option "DropDown.BulkPaymentInorgPortal"
  Then I select the file to upload from "B2B_BULK_PAYMENT.CSV"
  Then I scroll "GenericLocators.ScrollTimeschedule" to view using "false" parameter
  Then I select drop down "Organization Name" with option "Morolong"
  Then I select drop down "Service" with option "DropDown.B2BTransfer"
  Then I click on "Next Available Time Slot" radio
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.ConfirmException"
  Then I logout the "org" portal and close the browser
  Given I login to Fintech as "sp" operator
  When MakerChecker is on "Approve" task from group task for "Approve 'Manage Bulk Task Plan'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_InternalTransferofOrganizationFundsFromMpesaTomerchant!
Scenario: C2B_Org Portal-Internal Transfer of Organization Funds
  Given I login to Fintech as "orgC2BII" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                | Amount          | Reason                 |
  | TransactionServices.BusinessTransfersfromMerchantaccount | ReasonType.MpesaToMerchant | Amount.Minimum1 | For Automation Testing |
  Then I logout the "org" portal and close the browser
  And I report "Internal trasnfer of funds from Mpesa to Merchant is successfully"

@TC_FINLSO_REG_MARKET_InternalTransferofOrganizationFundsFromMerchantToMpesa!
Scenario: C2B_Org Portal-Internal Transfer of Organization Funds
  Given I login to Fintech as "orgC2BII" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                | Amount          | Reason                 |
  | TransactionServices.BusinessTransfersfromMerchantaccount | ReasonType.MerchantToMpesa | Amount.Minimum1 | For Automation Testing |
  Then I logout the "org" portal and close the browser
  And I report "Internal trasnfer of funds from Merchant to Mpesa is successfully"

@TC_FINLSO_REG_MARKET_RetailSPOperatorcansuccessfullychangecustomerslanguage!
Scenario:Retail- SP Operator can successfully change customer's language
  Given I login to Fintech as "retailsp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  When static text "Change Language Success." is visible
  Then I change Language with value "English" and Remark as "Test"
  When static text "Change Language Success." is visible
  Then I report "SP Operator can successfully change customer's language"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOpsSPOperatorcansuccessfullyvieworganizationtills!
Scenario:Business Ops - SP Operator can successfully view organization tills
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on left child menu "Tills" in the "Home" Page
  Then I report "SP Operator can successfully view organization tills"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_RetailSPOperatormustbeabletoviewTransactions!
Scenario:Retail-SP Operator must be able to view Transactions
  Given I login to Fintech as "retailsp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.Transactionmenu"
  Then I click on left child menu "Review Transaction" in the "Home" Page
  Then I click on " Search " button in cite
  Then I report "SP Operator must be able to view Transactions"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPVerifythatSPOperatorcansuccessfullychangeOperatorstatustofrozen!
Scenario:Business OP-Verify that SP Operator can successfully change Operator status to frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "The SP Operator can successfully change Operator status to frozen."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPVerifythatSPOperatorcansuccessfullychangeOperatorstatustosuspended!
Scenario:Business OP-Verify that SP Operator can successfully change Operator status to suspended
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "The SP Operator can successfully change Operator status to Suspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_C2B_OrgPortalInternalTransferOfOrganizationFunds-PaySchoolFees!
Scenario:C2B_Org Portal - Internal Transfer of Organization Funds-Pay School Fees
  Given I login to Fintech as "orgC2B" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                                       | Amount          | Reason             |
  | TransactionServices.BusinessTransfersfromMerchantaccount | Transfer from Commission Account to Mpesa Account | Amount.Minimum1 | Reason Description |
  Then I report "Tnternal Transfer of Organization Funds-Pay School Fees from Commission Account to Mpesa Account is completed Successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_QueryBankStatementParsingHistoryRecord!
Scenario:FS_Query Bank Statement Parsing History Record
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank File" in the "Home" Page
  Then I click on left child menu "Bank Statement" in the "Home" Page
  Then I select drop down "Bank" with option "Standard Lesotho Bank"
  Then I select drop down "Bank Branch" with option "zxk"
  Then I select drop down "Trust Account" with option "101000091000000060000"
  Then I click on " Search " button in cite
  Then I report "The Statement Parsing History Record is displayed Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorCanSuccessfullySearchOrganizationByOperator!
Scenario:SP operator can successfully search organization by Operator
  Given I login to Fintech as "sp" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                   | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId | ShortCode.ShortCode1 | Status.Active |
  When static text "Label.BasicInfoText" is visible
  Then I report "The SP operator can successfully search organization by Operator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorCanSuccessfullySearchTillMSISDN!
Scenario:SP operator can successfully search Till MSISDN
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | Query Condition | SearchValue                 | TableValues                 | MSISDN                 | Status        |
  | Table.Till | MSISDN          | Till.MpatOrgOne.TillNumber3 | Till.MpatOrgOne.TillNumber3 | Till.MpatOrgOne.MSISDN | Status.Closed |
  Then I report "Sp Operator can searches Till MSISDN successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorCanSuccessfullyResetCustomerPin!
Scenario:SP Operator can successfully reset customer pin
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I select "Reset PIN" in Operation
  Then I report "The SP Operator can successfully reset customer pin"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_WebIndependentStoreAgentInternalTransferviaWeb-fromFloattoM-Pesa!
Scenario:Web - Independent Store _Agent Internal Transfer via web - from Float to M-Pesa
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                                           | Amount          | Reason             |
  | TransactionServices.OrganizationFundsManagementMoveFunds | Agency Transfer from Float Account to Working Account | Amount.Minimum1 | Reason Description |
  Then I report "Independent Store Agent can transfer from Float to M-pesa via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_WebIndependentStoreAgentInternalTransferviawebfromM-PesatoFloat!
Scenario:Web- Independent Store_ Agent Internal Transfer via web - from M-Pesa to Float
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                                           | Amount          | Reason             |
  | TransactionServices.OrganizationFundsManagementMoveFunds | Agency Transfer from Working Account to Float Account | Amount.Minimum1 | Reason Description |
  Then I report "Independent Store Agent can transfer from M-Pesa to Float via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_WebIndependentStoreIndependentAgentwithdrawalfromtheSuperAgentviaweb!
Scenario:Web - Independent Store_Independent Agent withdrawal from the Super Agent [linked to it]-via web
  Given I login to Fintech as "orgSuperAgent" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                    | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.Organization Funds Management - Business Withdrawal | Short Code                       | ShortCode.AgencyIndep          | Amount.Minimum1 | Reason Description |
  Then I report "Independent Store_Independent Agent withdrawal from the Super Agent is successfull"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_WebIndependentStore_AgentWithdrawalfromAnotherAgentwithnegativebalance!
Scenario:Web - Independent Store_Agent Withdrawal from Another Agent with negative balance (Exception)
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                    | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount            | Reason             |
  | TransactionServices.Organization Funds Management - Business Withdrawal | Short Code                       | ShortCode.ShortCode1           | Amount.Limit10000 | Reason Description |
  Then I report "Independent Store_Agent Withdrawal from Another Agent with negative balance throughs insufficient funds Exception"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Operatorcannotclosecustomerproduct!
Scenario:CC BO - SP Operator can not close customer product
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I click on the "Product" tab
  And I Verify element "GenericLocators.EditOption" not available
  And I report "Sp Operator can not close customer Product"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_B2C-OrgoperatorInitiatetransaction-Businesstransfers-UtilityDisbursementto/fromM-PesaWorkingAccount!
Scenario: B2C - Org operator Initiate transaction - Business transfers - Utility Disbursement to/from M-Pesa Working Account
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                                   | Amount          | Reason             |
  | TransactionServices.BusinessTransfers-UtilityDisbursementto/fromM-PESA Working Account | Amount.Minimum1 | Reason Description |
  Then I report "Operator transfers funds from Utility account to Mpesa account via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_B2C-OrgoperatorattempttoinitiateBusinesspaymenttocustomer!
Scenario: B2C - Org operator attempt to initiate Business payment to customer
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I report "Org operator attempt to initiate Business payment to customer"
  Then I logout the "org" portal and close the browser
  Given I login to Fintech as "sp" operator
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_B2C-OrgoperatorInitiatetransaction-OrganizationwithdrawalfromM-Pesa!
Scenario: B2C- Org operator Initiate transaction - Organization withdrawal from M-Pesa
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                                 | Requester_Type | Requester_MSISDN              | Amount          | Receiving_Bank_Account           | Reason             |
  | TransactionServices.OrganizationWithdrawalFromM-PESA | MSISDN         | Customer.Registered_Customer1 | Amount.Minimum1 | TESTName/123454****4545/(testyy) | Reason Description |
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPOperatorcansuccessfullysearchGrouptask!
Scenario: Retail- SP Operator can successfully search Group task
  Given I login to Fintech as "retailsp" operator
  Then I click on left child menu "Task Center" in the "Home" Page
  Then I click on left child menu "Group Task" in the "Home" Page
  Then I click on "Search" button in cite
  Then I report "SP Operator is able to search group task successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_B2C-OrgoperatorInitiateTransaction-SalaryPaymenttoCustomer!
Scenario: B2C - Org operator Initiate Transaction - Salary Payment to Customer
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                        | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I report "Org operator attempt to initiate Business payment to customer"
  Then I logout the "org" portal and close the browser
  Given I login to Fintech as "sp" operator
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPOperatorcansuccessfullyrevieworganizationtransactions!
Scenario: Retail-SP Operator can successfully review organization transactions
  Given I login to Fintech as "retailsp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I click on "GenericLocators.Transactionmenu"
  Then I click on left child menu "Review Transaction" in the "Home" Page
  Then I click on " Search " button in cite
  Then I report "SP Operator can successfully review organization transactions"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TopOrg-OrgOperatorReviewTransaction-M-PesaAccount!
Scenario: Top Org - Org Operator Review Transaction - M-Pesa Account
  Given I login to Fintech as "org" operator
  Then I click on "Transaction Center" on button in top menu
  Then I click on left child menu "Account Statement " in org of the "Transaction Center" Page
  Then I click on "GenericLocators.AccountType"
  Then I click on "GenericLocators.MPESAAccount"
  Then I report "Org Operator can successfully review organization transactions  M-Pesa Account"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPOperatorcansuccessfullyapproveGrouptask!
Scenario: Retail- SP Operator can successfully approve Group task
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I close tab near to home tab
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "retailsp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Retail- SP Operator can successfully approve Group task"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPOperatorcansuccessfullyrejectGrouptask!
Scenario: Retail- SP Operator can successfully reject Group task
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I close tab near to home tab
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "retailsp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Reject" task from group task for "Transaction Confirmation"
  Then I report "Retail- SP Operator can successfully reject Group task"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPoperatorcansuccessfullyreviewgrouptransactions!
Scenario:SP operator can successfully review group transactions
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Task Center" in the "Home" Page
  Then I click on left child menu "Group Task" in the "Home" Page
  Then I select drop down "Task Type" with option "Transaction and Action"
  Then I click on "Search" button in cite
  Then I report "SP operator can successfully review group transactions successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorChangingGroupKYCInfo!
Scenario: SP operator can successsfully change group KYC
  Given I login to Fintech as "sp" operator
  Given I generate name "PostalAdd" with value "Semonkong_RAND_4"
  When I search for "Group" with below details
  | TableId            | SearchBy        | SearchValue     | Status        |
  | Table.Organization | Label.GroupName | Group.GroupName | Status.Active |
  Then I edit KYC Info with below details
  | AddressLine | Reason |
  | PostalAdd   | Test   |
  Then I report "Sp Operator successfully changed the Group KYC Info"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorLogOut_SP_Portal!
Scenario: Business Op-check SP Operator can logout of the portal
  Given I login to Fintech as "sp" operator
  Then I logout the "sp" portal and close the browser
  Then I report "SP Operator successfully logged Out of SP portal"

@TC_FINLSO_REG_MARKET_SPOperator_ResetOrgOperatorsPIN!
Scenario: Retail - SP Operator can successfully reset Org Operator's PIN
  Given I login to Fintech as "sp" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                   | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId | ShortCode.ShortCode1 | Status.Active |
  Then I select "Reset PIN" in Operation
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Reject" task from group task for "Approve 'Reset Organization Operator PIN'"
  Then I report "Organization Operator PIN is successfully reset"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_WebTopOrgCentrallyOwnedHOwithdrawfundsfromBank!
Scenario:Web -Top Org _ Centrally Owned HO - withdraw funds from Bank
  Given I login to Fintech as "orgAHO" operator
  Then I initiate transaction with below details
  | Transaction_Services                                 | Requester_Type | Requester_MSISDN              | Amount          | Receiving_Bank_Account       | Reason             |
  | TransactionServices.OrganizationWithdrawalFromM-PESA | MSISDN         | Customer.Registered_Customer1 | Amount.Minimum1 | FINTECH/123456****9123/(zxk) | Reason Description |
  Then I report "Centrally Owned HO Organization is able to withdraw funds from Bank"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_WebTopOrgCentrallyOwnedHOwithdrawfundsfromanotherCentrallyOwnedHO!
Scenario:Web - Top Org _Centrally Owned HO - withdraw funds from another Centrally Owned HO
  Given I login to Fintech as "orgAHO" operator
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessToBusinessTransfer | Short Code                       | ShortCode.ShortCode8           | Amount.Minimum1 | Reason Description |
  Then I report "Centrally Owned HO Organization is able to withdraw funds from another Centrally OwnedHO"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_WebTopOrgCentrallyOwnedHOwithdrawfundsfromSuperAgent!
Scenario:Web - Top Org _ Centrally Owned HO - withdraw funds from Super Agent
  Given I login to Fintech as "orgSuperAgent" operator
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessToBusinessTransfer | Short Code                       | ShortCode.ShortCode8           | Amount.Minimum1 | Reason Description |
  Then I report "Centrally Owned HO Organization is able to withdraw funds  from another SuperAgent"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_SPoperatorcansuccesssfullysearchOrganisationbyShortcode!
Scenario: SP operator can successsfully search Organisation by Shortcode
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Frozen |
  Then I report "SP operator can successsfully search Organisation by Shortcode successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcanloginwithcorrectcredentials!
Scenario: Business Op- check SP Operator can login with correct credentials
  Given I login to Fintech as "spBackoff" operator
  Then I report "Business Op- check SP Operator can login with correct credentials successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-VerifythatSPOperatorcansuccessfullychangeOrganizationstatus-tosuspended!
Scenario:Business OP-Verify that SP Operator can successfully change Organization status - to suspended
  Given I login to Fintech as "spBackoff" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "Business OP-Verify that SP Operator can successfully change Organization status - to suspended successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-VerifythatSPOperatorcansuccessfullychangeOrganizationstatus-toactive!
Scenario:Business OP-Verify that SP Operator can successfully change Organization status - to active
  Given I login to Fintech as "spBackoff" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  #Post-Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "Business OP-Verify that SP Operator can successfully change Organization status - to active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPVerifythatSPOperatorcanchangeOperatorKYC!
Scenario:Business OP-Verify that SP Operator can change Operator KYC
  Given I login to Fintech as "sp" operator
  Given I generate name "PhoneNo" with value "RAND_10"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.OperatorinOrg"
  Then I enter text in "Label.Operator ID" with value "OrgOperator.DefaultOperatorId5"
  Then I click on "Search" button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|ABC12" and click on "Detail" of "Operation" column
  Then I edit KYC Info with below details
  | PreferredContact_Number | Reason |
  | PhoneNo                 | Test   |
  #Approve
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator KYC'"
  Then I report "Business OP-Verify that SP Operator can change Operator KYC"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPVerifythatSPOperatorcancanResetOperatorPIN!
Scenario:Business OP-Verify that SP Operator can Reset Operator PIN
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.OperatorinOrg"
  Then I enter text in "Label.Operator ID" with value "OrgOperator.DefaultOperatorId5"
  Then I click on "Search" button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|ABC12" and click on "Detail" of "Operation" column
  Then I switch to next frame
  Then I select "Reset PIN" in Operation
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Reject" task from group task for "Approve 'Reset Organization Operator PIN'"
  Then I report "Organization Operator PIN is successfully reset"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorcansuccessfullychangecustomerTrustLevel!
Scenario:SP Operator can successfully change customer's Trust Level
  Given I login to Fintech as "sp" operator
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
  Then I report "SP Operator can successfully change customer's Trust Level"
  Then I wait "3"
  #Post condition
  Then I edit KYC Info with below details
  | Trust_Level                | Document_Received | Reason |
  | Registered Customer Tier 2 | No                | Test   |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorcansuccessfullysearchtransactionbyReceiptNo!
Scenario:SP Operator can successfully search transaction by Receipt No
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                                              | Reason_Type                                             | Primary_Identifier_Account_Type  | Receiver_Identifier_Account                  | Amount          | Reason             |
  | TransactionServices.BusinessTransfersfromUtilityCollectionAccount | ReasonType.M-PESA Account to Utility Collection Account | Default Account (M-PESA Account) | Default Account (Utility Collection Account) | Amount.Minimum1 | Reason Description |
  Then I get value from label in " Receipt No.  " and store it in "TransReceipt"
  Then I check the Transaction ReceiptNo "TransReceipt"
  Then I report "SP Operator can successfully search transaction by Receipt No"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPoperatorcansuccessfullysearchcustomerbymiddlename!
Scenario: SP operator can successfully search customer by middle name
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | SearchValue | SearchBy    | Middle Name | Status        |
  | Table.CustomerInIdentity | MSISDN      | Middle Name | Automation  | Status.Active |
  Then I report "SP operator can search customer by middle name successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPoperatorcansuccesssfullsearchcustomerbyfirstnameLastname!
Scenario: SP operator can successsfull search customer by first name + Last name
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | SearchValue | SearchBy               | First Name      | Last Name      | Status        |
  | Table.CustomerInIdentity | MSISDN      | First Name + Last Name | FirstnameActive | LastnameActive | Status.Active |
  Then I report "SP operator can search customer by first name + Last name successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_ExceptionCreateABankStatementTemplateWithDuplicateName!
Scenario:Exception_Create a Bank Statement Template with Duplicate Name
  Given I login to Fintech as "sp" operator
  Given I generate name "BankName" with value "Bank6128"
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I click on "GenericLocators.Create"
  Then I enter text for "GenericLocators.PleaseEntertextbox" with value "BankName"
  Then I click on "GenericLocators.StatementType"
  Then I click on "GenericLocators.NormalTransactions"
  Then I click on "GenericLocators.Format"
  Then I click on "GenericLocators.CSV"
  Then I click on " Submit" button in cite
  Then I wait "3"
  Then I check error text "Bank statement template name duplicated" is displayed
  Then I click on "GenericLocators.ConfirmOrg"
  Then I click on "GenericLocators.CloseView"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPoperatorcansuccessfullyviewgroupauditlog!
Scenario:SP operator can successfully view group audit log
  Given I login to Fintech as "sp" operator
  When I search for "Group" with below details
  | TableId            | SearchBy        | SearchValue     | Status        |
  | Table.Organization | Label.GroupName | Group.GroupName | Status.Active |
  Then I click on "GenericLocators.GroupAuditlog"
  Then I select drop down "Category" with option "Identity Management"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "Identity|GPTC Test Team" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "SP operator can successfully view group audit log"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPVerifythatSPOperatorcansuccessfullychangecustomerstatustosuspended!
Scenario:Business OP-Verify that SP Operator can successfully change customer status - to suspended
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer3 | Label.MSISDN | Customer.Registered_Customer3 | Status.Active |
  Then I edit Identity Status of customer with value "Suspended"
  Then I edit Identity Status of customer with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOpcheckSPOperatorcansuccessfullyEditorganizationKYCactivestate!
Scenario:Business Op-check SP Operator can successfully Edit organization KYC, active state
  Given I login to Fintech as "sp" operator
  Given I generate name "PostalAdd" with value "Semonkong_RAND_4"
  Given I generate name "PhyAdd" with value "Semonkong_RAND_4"
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | OrgOperator.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit org KYC Info with below details
  | Postal_Address | Physical_Address | Reason |
  | PostalAdd      | PhyAdd           | Test   |
  #Approve
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization KYC'"
  #Post-requsite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit org KYC Info with below details
  | Postal_Address | Physical_Address | Reason |
  | sin            | cs               | Test   |
  #Approve
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization KYC'"
  Then I report "Business Op-check SP Operator can successfully Edit organization KYC, active state"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOpcheckSPOperatorcansuccessfullychangeorgproduct!
Scenario:Business Op-check SP Operator can successfully change org product
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
  Then I click on "GenericLocators.SubmitInorgpage"
  Then I click on "GenericLocators.SubmitEcep"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Product"
  Then I report "Business Op-check SP Operator can successfully change org product"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPoperatorisabletologoutoftheportal!
Scenario: Retail-SP operator is able to logout of the portal
  Given I login to Fintech as "retailsp" operator
  Then I logout the "sp" portal and close the browser
  Then I report "Retail-SP operator is able to logout of the portal"

@TC_FINLSO_REG_MARKET_BusinessOP-VerifythatSPOperatorcansuccessfullychangecustomerstatus-toactive!
#Defect:Approval is required to change status
Scenario: Business OP-Verify that SP Operator can successfully change customer status - to active
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Suspended"
  # Then I click on "GenericLocators.Confirm"
  # When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  # When I search for "Customer" with below details
  # | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  # | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Active"
  # Then I click on "GenericLocators.Confirm"
  # When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  Then I report "Business OP-Verify that SP Operator can successfully change customer status - to active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcansuccessfullycreatetoporganization!
Scenario:Business Op-check SP Operator can successfully create top organization- Super Agent
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product     | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration |
  | Super Agent | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             |
  Then I report "Business Op-check SP Operator can successfully create top organization -Super Agent successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-SPOperatorcreatesOrganizationOperator-childorg!
Scenario: Business Op-SP Operator creates Organization Operator - child org
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgUsername" with value "OrgOperator_RAND_4"
  Given I generate name "msisdn" with value "8613000_RAND_6"
  Given I generate name "OpeId" with value "OperId_RAND_6"
  Then I create organization operator with below details
  | ShortCode             | Language                | AccessChannel | UserName    | MSISDN | OperatorId | Role                                                                   | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | ShortCode.AgencyIndep | Language.Southern Sotho | Web           | OrgUsername | msisdn | OpeId      | OrgOperRole,B2C Operator,C2B Operator,[Open API] API Key Administrator | SMS                            | 2314563243465                 | Test Email |
  Then I report "Business Op-SP Operator creates Organization Operator - child org successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-checkSPOperatorcansuccessfullycreateOrganizationTill!
Scenario:Business OP-check SP Operator can successfully create Organization Till
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "TillMSISDN" with value "2665000_RAND_4"
  Given I generate name "TillNumber" with value "30_RAND_4"
  Then I create Till with below details
  | Short_Code           | MSISDN     | Till_Number | Language | Operator_ID | Product           |
  | ShortCode.ShortCode2 | TillMSISDN | TillNumber  | English  | ABC12345    | B2C Business Till |
  Then I report "Business OP-check SP Operator can successfully create Organization Till"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-checkSPOperatorcansuccessfullychangeOrganizationTillproduct!
Scenario:Business OP-check SP Operator can successfully change Organization Till product
  Given I login to Fintech as "spBackoff" operator
  When I search for "Till" with below details
  | TableId    | TableValues                         | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                         | Till Number                         | Status                |
  | Table.Till | Till.MpatOrgOne.Till_PendingActive2 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.Till_PendingActive2 | Till.MpatOrgOne.Till_PendingActive2 | Status.Pending Active |
  Then I wait "5"
  Then I report "Query the till successfully, The till details page is displayed"
  Then I click on the "Product" tab
  Then I click on "GenericLocators.EditTillProduct"
  Then I click on "GenericLocators.DeleteTillProduct"
  Then I click on "Add Product" button in cite
  Then I click on "AddProduct.CollectionBankTill" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I enter text for "GenericLocators.EditTillRemark" with value "Test"
  Then I click on " Submit " button in cite
  When static text "Product edited successfully" is visible
  Then I report "Business OP-check SP Operator can successfully change Organization Till product"

@TC_FINLSO_REG_MARKET_Web-IndependentStoreIndependentAgentDeposittoanotherAgentDormantaccount!
Scenario: Web - Independent Store_Independent Agent Deposit to another Agent-Dormant account
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                 | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.Organization Funds Management - Business Deposit | Short Code                       | ShortCode.ShortCode10          | Amount.Minimum1 | Reason Description |
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStoreIndependentAgentDepositintoAnotherAgentviaweb-suspendedagentaccountException!
Scenario: Web - Independent Store_Independent Agent Deposit into Another Agent via web-suspended agent account( Exception)
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                 | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.Organization Funds Management - Business Deposit | Short Code                       | ShortCode.ShortCode11          | Amount.Minimum1 | Reason Description |
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStoreIndependentAgentDeposittoanactiveCustomer!
Scenario: Web - Independent Store_ Independent Agent Deposit to an active Customer
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                 | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.Customer Deposit | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStoreIndependentAgentDeposittoPendingActiveCustomer!
Scenario: Web - Independent Store_ Independent Agent Deposit to Pending Active Customer
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                 | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN | Amount          | Reason             |
  | TransactionServices.Customer Deposit | MSISDN                           | Customer.Pending_Customer  | Amount.Minimum1 | Reason Description |
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStore_IndependentAgentDeposittoCustomer-minimumamountException!
Scenario: Web - Independent Store_ Independent Agent Deposit to Customer - minimum amount(Exception)
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                 | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount         | Reason             |
  | TransactionServices.Customer Deposit | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum | Reason Description |
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcannotloginwithinvalidpassword!
Scenario: Business Op-check SP Operator cannot login with invalid password
  Given I navigate to Mpesa "sp" portal
  Then I enter text in "Account" with value "Login.spBackoffIncorrectPassword.UserID1"
  Then I enter text in "Password" with value "Login.spBackoffIncorrectPassword.password1"
  Then I enter text in "Verify Code" with value "Login.spBackoffIncorrectPassword.VerificationCode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "3"
  Then I click on " I have read and agreed" button in cite
  Then I click on "Login.LoginBtn"
  Then I wait "4"
  Then I check error text " Incorrect username, password, or status. Remaining attempts: " is displayed
  Then I report "SP Operator cannot login with invalid password"

@TC_FINLSO_REG_MARKET_Retail-SPOperatorcansuccessfullyviewOrganizationoperatorauditlog!
Scenario: Retail-SP Operator can successfully view Organization operator's audit log
  Given I login to Fintech as "retailsp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I enter text in "Label.Operator ID" with value "ShortCode.ShortCode1"
  Then I click on "Search" button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "ShortCode.ShortCode1" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.AuditLogInOrgOperator"
  # Then I select drop down "Category" with option "DropDown.Identity Management"
  Then I click on " Search " button in cite
  Then I report "SP Operator can successfully view Organization operator's audit log"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPs-SPOperatorcansuccessfullyviewauditlog!
Scenario:Business OPs-SP Operator can successfully view audit log
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I click on "GenericLocators.AuditlogCustomer"
  Then I select drop down "Category" with option "DropDown.Identity Management"
  Then I click on " Search " button in cite
  Then I report "Business OP -Business OPs-SP Operator can successfully view audit log"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPOperatorcansuccessfullyInitiateTransactionReversalfromReveiwTransactions!
Scenario: Retail-SP Operator can successfully Initiate Transaction Reversal from Reveiw Transactions
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessToBusinessTransfer | Short Code                       | ShortCode.ShortCode3           | Amount.Minimum1 | Reason Description |
  Then I logout the "sp" portal and close the browser
  #Reversing the Transaction
  Given I login to Fintech as "retailsp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reverse"
  Then I select drop down "Query Mode" with option "Transactions as Receipt No."
  Then I enter text in "Label.ReceiptNo" with value "transactionReceiptNum"
  Then I click on " Search " button in cite
  Then I report "SP Operator can successfully Initiate Transaction Reversal from Reveiw Transactions"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorCanSuccessfullyRecycleMSISDN!
Scenario: Retail-SP Operator can successfully recycle customer MSISDN
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
  #Recycling the Customer
  Then I recycle the MSISDN "CustomerMSISDN"
  When MakerChecker is on "Approve" task from group task for "Approve 'Recycle MSISDN'"
  Then I report "Operator can successfully recycle the MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_LoginSPPortalIncorrectPassword!
Scenario: Retail - SP operator is unable to login using invalid username
  Given I login to Fintech as "spIncorrectPassword" operator
  Then I wait "3"
  Then I check error text "Incorrect username, password, or status." is displayed
  Then I report "The SP portal login failed with incorrect password"

@TC_FINLSO_REG_MARKET_SPOperatorChangingGroupName!
Scenario: SP operator can successfully change group name
  Given I generate name "GroupName" with value "Semonkong_RAND_4"
  Given I generate name "GroupName_First" with value "Group.GroupName"
  Given I login to Fintech as "sp" operator
  When I search for "Group" with below details
  | TableId            | SearchBy        | SearchValue     | Status        |
  | Table.Organization | Label.GroupName | Group.GroupName | Status.Active |
  Then I edit Group name as "GroupName" and remark as "Test"
  When static text "Message.GroupNameChangedSuccess" is visible
  #PostRequisite
  Then I edit Group name as "GroupName_First" and remark as "Test"
  Then I report "SP operator successfully able to change Group name"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorChangingGroupIdentityStatus!
Scenario: SP operator can change group identity status
  Given I login to Fintech as "sp" operator
  When I search for "Group" with below details
  | TableId            | SearchBy        | SearchValue     | Status        |
  | Table.Organization | Label.GroupName | Group.GroupName | Status.Active |
  Then I edit Identity Status in "Group" with value "Suspended"
  When static text "Message.GroupIdentiyStatusSuccess" is visible
  #Post-Requisite
  Then I edit Identity Status in "Group" with value "Active"
  Then I report "SP operator successfully able to change Identity status of the Group"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_B2COrgoperatorInitiateTransactionUtilityAccountinasuspendedstate!
Scenario:B2C - Org operator Initiate Transaction -  Utility Account in a suspended state
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | OrgOperator.ShortCode9 | Label.Organization Short Code | ShortCode.ShortCode9 | Status.Active |
  Then I change the Account status to "Suspended" of the Account "Utility Disbursement Account"
  When MakerChecker is on "Approve" task from group task for "Change Organization Account Status"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I check error text "The Utility Disbursement Account(LSL) account of the debit party is in the SUSPENDED state and cannot be used to perform transactions." is displayed
  Then I report "Receive an error message that the utility Disbursement account of the debit party is in suspended state and cannot be used to perform transactions"
  Then I logout the "org" portal and close the browser
  #Post-Requisite
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues            | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | OrgOperator.ShortCode9 | Label.Organization Short Code | ShortCode.ShortCode9 | Status.Active |
  Then I change the Account status to "Active" of the Account "Utility Disbursement Account"
  When MakerChecker is on "Approve" task from group task for "Change Organization Account Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_B2COrgoperatorInitiateTransactionPromotionpaymenttocustomer!
Scenario:B2C - Org operator Initiate Transaction - Promotion payment to customer
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.PromotionPaymenttoCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I report "Org operator can Initiate Transaction to Promotion payment to customer"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_B2COrgoperatorInitiateTransactionBusinesstoBusinesstransfer!
Scenario:B2C - Org operator Initiate Transaction - Business to Business transfer
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessToBusinessTransfer | Short Code                       | ShortCode.ShortCode3           | Amount.Minimum1 | Reason Description |
  Then I report "Business to Business transfer successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_WebTopOrgAgencystorelinkedtoCentrallyOwnedHOdepositintotheIndependentAgentsaccountviaweb!
Scenario:Web - Top Org _ Agency store linked to Centrally Owned HO deposit into the Independent Agents account via web
  Given I login to Fintech as "orgAgencystore" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                 | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.Organization Funds Management - Business Deposit | Short Code                       | ShortCode.AgencyIndep          | Amount.Minimum1 | Reason Description |
  Then I report "Agency store linked to Centrally Owned HO deposit into the Independent Agents account via web transfer successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOpcheckSPOperatorcansuccessfullycreatetoporganizationPaySchoolfees!
Scenario:Business Op-check SP Operator can successfully create top organization- Pay School fees
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product         | ShortCode | OrgName | Region             | Type Of Business     | Company Registration Certificate Number | Organisation Category Code               | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | Pay School Fees | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.PLC | 1234                                    | Organisation Category Code.PaySchoolFees | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I report "Business Op-check SP Operator can successfully create top organization- Pay School fees"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TopOrgAgencyHOOrgOperator-ActivateOrgoperatorusinginvalidUsername!
Scenario: Top Org _ Agency HO Org Operator-Activate Org operator using invalid Username
  Given I navigate to Mpesa "org" portal
  Then I enter text in "Short Code" with value "Login.orgIncorrectShortcode.Shortcode"
  Then I enter text in "User Name" with value "Login.orgIncorrectShortcode.UserID1"
  Then I enter text in "Password" with value "Login.orgIncorrectShortcode.password"
  Then I enter text in "Verification Code" with value "Login.orgIncorrectShortcode.VerificationCode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "3"
  Then I click on " I Have Read And Agreed" button in cite
  Then I click on " Login " button in cite
  Then I check error text " Incorrect username, password, or status. Remaining attempts: " is displayed
  Then I report "Top Org _ Agency HO Org Operator-Activate Org operator using invalid Username successfully"

@TC_FINLSO_REG_MARKET_TopOrgAgencyHOOrgoperatorLoginusinginvalidPassword!
Scenario: Top Org _ Agency HO Org operator Login using invalid Password
  Given I navigate to Mpesa "org" portal
  Then I enter text in "Short Code" with value "Login.orgIncorrectShortcode.Shortcode"
  Then I enter text in "User Name" with value "Login.orgIncorrectShortcode.UserID1"
  Then I enter text in "Password" with value "Login.orgIncorrectShortcode.password1"
  Then I enter text in "Verification Code" with value "Login.orgIncorrectShortcode.VerificationCode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "3"
  Then I click on " I Have Read And Agreed" button in cite
  Then I click on " Login " button in cite
  Then I wait "5"
  Then I check error text " Incorrect username, password, or status. Remaining attempts: " is displayed
  Then I report "Top Org _ Agency HO Org operator Login using invalid Password successfully"

@TC_FINLSO_REG_MARKET_TopOrgAgencyHOOrgOperator-ActivateOrgoperatorusinginvalidShortcode!
Scenario: Top Org _ Agency HO Org Operator-Activate Org operator using invalid Shortcode
  Given I navigate to Mpesa "org" portal
  Then I enter text in "Short Code" with value "Login.orgIncorrectShortcode.Shortcode1"
  Then I enter text in "User Name" with value "Login.orgIncorrectShortcode.UserID"
  Then I enter text in "Password" with value "Login.orgIncorrectShortcode.password"
  Then I enter text in "Verification Code" with value "Login.orgIncorrectShortcode.VerificationCode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "3"
  Then I click on " I Have Read And Agreed" button in cite
  Then I click on " Login " button in cite
  Then I check error text "The organization does not exist." is displayed
  Then I report "Top Org _ Agency HO Org Operator-Activate Org operator using invalid Shortcode successfully"

@TC_FINLSO_REG_MARKET_TopOrgAgencyHOOrgoperatorattempttologoutoftheportalbyclickingontheLogoutIcon!
Scenario: Top Org _ Agency HO Org operator attempt to logout of the portal by clicking on the Logout Icon
  Given I login to Fintech as "orgAHO" operator
  Then I logout the "org" portal and close the browser
  Then I report "Top Org _ Agency HO Org operator attempt to logout of the portal by clicking on the Logout Icon successfully"

@TC_FINLSO_REG_MARKET_TopOrgAgencyHOOrgoperatorLoginusingallvaliddetails!
Scenario: Top Org _ Agency HO Org operator Login using all valid details
  Given I login to Fintech as "orgAHO" operator
  Then I logout the "org" portal and close the browser
  Then I report "Top Org _ Agency HO Org operator Login using all valid details successfully"

@TC_FINLSO_REG_MARKET_CreateMinorCustomerViaBackOffice!
Scenario: SP Operator can successfully create Minor customer
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "CustomerMSISDN" with value "130000_RAND_5"
  Given I generate name "Firstname" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "IDNumber" with value "130_RAND_3"
  Then I create customer the with below details
  | Product Name            | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Minorcustomers | CustomerMSISDN | Firstname  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  Then I report "SP Operator Created Minor customer successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPoperatorunabletoLoginintotheportalusinginvalidPassword!
Scenario: Retail-SP operator unable to Login into the portal using invalid Password
  Given I navigate to Mpesa "sp" portal
  Then I enter text in "Account" with value "Login.retailsp.UserID"
  Then I enter text in "Password" with value "Login.spBackoffIncorrectPassword.password1"
  Then I enter text in "Verify Code" with value "Login.spBackoffIncorrectPassword.VerificationCode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "3"
  Then I click on " I have read and agreed" button in cite
  Then I click on "Login.LoginBtn"
  Then I wait "4"
  Then I check error text " Incorrect username, password, or status. Remaining attempts: " is displayed
  Then I report "SP operator unable to Login into the portal using invalid Password"

@TC_FINLSO_REG_MARKET_B2C-OrgoperatorInitiatetransaction-DisbursefundstoBusiness!
Scenario: B2C - Org operator Initiate transaction - Disburse funds to Business
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                        | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.DisburseFundstoBusiness | Short Code                       | ShortCode.ShortCode3           | Amount.Minimum1 | Reason Description |
  Then I report "Org operator Initiate transaction - Disburse funds to Business"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_B2C-OrgoperatorInitiatetransaction-BusinessPaybill!
Scenario: B2C - Org operator Initiate Transaction - Business Pay bill
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessPayBill | Short Code                       | ShortCode.ShortCode3           | Amount.Minimum1 | Reason Description |
  Then I report "Org operator Initiate Transaction - Business Pay bill"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPOperatorcansuccessfullyinitiatecustomerReversal!
Scenario: Retail - SP Operator can successfully initiate customer Reversal
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I close tab near to home tab
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "retailsp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reversal"
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I report "Retail - SP Operator can successfully initiate customer Reversal"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_WebIndependentStore_ViewBalance-BalanceOverview!
Scenario:Web Independent Store_ View Balance - Balance Overview
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "My Organization " in org of the "Identity Center" Page
  Then I click on " View Detail " button in cite
  Then I Switch tab
  Then I click on "GenericLocators.BankOverview"
  When static text "Balance Overview" is visible
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStore_LoginusinginvalidPassword_Exception!
Scenario:Web- Independent Store_ Login using invalid Password (Exception)
  Given I login to Fintech as "orgIncorrectPassword" operator
  Then I wait "5"
  Then I check error text " Incorrect username, password, or status. Remaining attempts: " is displayed
  Then I report "The organization operator login the portal failed with incorrect password"

@TC_FINLSO_REG_MARKET_IndependentStore_AgentInternalTransfer-fromFloattoM-PesaAccount!
Scenario:Independent Store_ Agent Internal Transfer - from Float to M-Pesa Account (Insufficient Funds)(Exception)
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                                           | Amount             | Reason             |
  | TransactionServices.OrganizationFundsManagementMoveFunds | Agency Transfer from Float Account to Working Account | Amount.Limit100000 | Reason Description |
  Then I report "Independent Store_ Agent Internal Transfer - from Float to M-Pesa Account withnInsufficient Funds throws Exception"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_TopOrg_AgencyHOOrgOperator-Orgloginintotheportalwithsuspendedaccount!
Scenario:Top Org _ Agency HO Org Operator-Org login into the portal with suspended account
  Given I login to Fintech as "sp" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                    | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId6 | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization operator" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "orgAgenHO" operator
  Then I wait "3"
  Then I check error text " The Suspended operator cannot perform this operation. " is displayed
  #Post Requisite
  Given I login to Fintech as "sp" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                    | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId6 | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization operator" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_C2BOrgportalMerchantwithdrawsfundstotheirBankaccountsuccessfullyviaorgportal!
Scenario:C2B_Org portal-Merchant withdraws funds to their Bank account successfully via org portal
  Given I login to Fintech as "orgC2B" operator
  Then I initiate transaction with below details
  | Transaction_Services                                   | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.MerchantWithdrawalofFundsfromagent | Short Code                       | ShortCode.ShortCode3           | Amount.Minimum1 | Reason Description |
  Then I report "Merchant withdraws funds to their Bank account is done successfully via org portal"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_FSGenerateReconciliationReportApprove!
Scenario:FS_Generate Reconciliation Report_Approve
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank Reconciliation" in the "Home" Page
  Then I click on left child menu "Generate Reconciliation Report" in the "Home" Page
  Then I click on "Generate Summary" button in cite
  Then I click on "Confirm" button in cite
  Then I enter text area "Remark" with value "Reason Description"
  Then I wait "25"
  Then I click on "Submit" button in cite
  Then I click on left child menu "Approve Reconciliation Report" in the "Home" Page
  Then I report "Operate successfully. The status of the Reconciliation Report is Approved."
  Then I check table "Table.ApproveReconciliation" with multiple values as "Login.sp.UserID" and click on "Process" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I report "Reconciliation Report_Approve is done successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FSGenerateReconciliationReportReject!
Scenario:FS_Generate Reconciliation Report_Reject
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank Reconciliation" in the "Home" Page
  Then I click on left child menu "Generate Reconciliation Report" in the "Home" Page
  Then I click on "Generate Summary" button in cite
  Then I click on "Confirm" button in cite
  Then I enter text area "Remark" with value "Reason Description"
  Then I wait "25"
  Then I click on "Submit" button in cite
  Then I click on left child menu "Approve Reconciliation Report" in the "Home" Page
  Then I report "Operate successfully. The status of the Reconciliation Report is Approved."
  Then I check table "Table.ApproveReconciliation" with multiple values as "Login.sp.UserID" and click on "Process" of "Operation" column
  Then I click on "GenericLocators.RejectRadio"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I report "Reconciliation Report_Reject is done successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CB2COrgoperatorInitiateTransactionBusinesspaymenttocustomerwithamountexceedingcustomerdailymoneyinlimit!
Scenario:B2C - Org operator Initiate Transaction - Business payment to customer with amount exceeding customer daily money in limit
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                          | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount                             | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer1 | Amount.Exceedingcustomerdailylimit | Reason Description |
  Then I check error text "Failed to authenticate the transaction by limit rule Maximum MMF Account For Customer Balance Check." is displayed
  Then I report "Business payment to customer with amount exceeding customer daily money in limit is done successfully via org portal"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPOperatorisabletoclickonForgotPassword!
Scenario: Retail-SP Operator is able to click on Forgot Password
  Given I navigate to Mpesa "retailsp" portal
  Then I click on "GenericLocators.SPPortalForgetPassword"
  Then I enter text in "Account" with value "Login.retailsp.Account"
  Then I enter text in "First Name" with value "Login.retailsp.FirstName"
  Then I enter text in "Last Name" with value "Login.retailsp.LastName"
  Then I click on "Next" button in cite
  Then I select drop down "Question 1" with option "Your birth address"
  Then I enter text in "Answer 1" with value "chennai"
  Then I click on "GenericLocators.Return"
  When static text "Security Question" is visible
  Then I report "Retail-SP Operator is able to click on Forgot Password"


@TC_FINLSO_REG_MARKET_B2COrgoperatorInitiateTransactionSalaryPaymenttoCustomerwithdrawalchargepaid!
Scenario: B2C - Org operator Initiate Transaction -  Salary Payment to Customer withdrawal charge paid
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                                            | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomerWithdrawalChargePaid | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I report "Salary Payment To Customer Withdrawal ChargePaid"
  Then I logout the "org" portal and close the browser
  Given I login to Fintech as "sp" operator
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorcansuccessfullyResetOrgOperatorpassword!
Scenario: SP Operator can successfully Reset Org Operator's password
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.OperatorinOrg"
  Then I enter text in "Label.Operator ID" with value "OrgOperator.DefaultOperatorId5"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|ABC12" and click on "Detail" of "Operation" column
  Then I wait "6"
  Then I select "Reset Password" in Operation
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Reset Organization Operator Password'"
  Then I report "SP Operator can successfully Reset Org Operator's password"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPVerifythatSPOperatorcansuccessfullyresetorganizationOperatorPassword!
Scenario: Business OP-Verify that SP Operator can successfully reset organization Operator Password
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.OperatorinOrg"
  Then I enter text in "Label.Operator ID" with value "OrgOperator.DefaultOperatorId5"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|ABC12" and click on "Detail" of "Operation" column
  Then I wait "6"
  Then I select "Reset Password" in Operation
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Reset Organization Operator Password'"
  Then I report "SP Operator can successfully Reset Org Operator's password"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPOperatorcansuccessfullyviewlistofoperatorsforspecificorganization!
Scenario: Retail-SP Operator can successfully view list of operators for specific organization.
  Given I login to Fintech as "retailsp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.OperatorinOrg"
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|ABC12" and click on "Detail" of "Operation" column
  Then I report "Retail-SP Operator can successfully view list of operators for specific organization."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOps-SPOperatorcansuccessfullyviewcustomertasklist!
Scenario: Business Ops - SP Operator can successfully view customer task list
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer2 | Label.MSISDN | Customer.Registered_Customer2 | Status.Active |
  Then I click on "GenericLocators.TasklistCustomer"
  Then I click on " Search " button in cite
  Then I report "SP Operator can successfully view customer task list"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcannotsuccessfullyEditorganizationKYCinasuspendedstate!
Scenario: Business Op- check SP Operator cannot successfully Edit organization KYC in a suspended state
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "PostalAdd" with value "Semonkong_RAND_4"
  Given I generate name "PhyAdd" with value "Semonkong_RAND_4"
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status           |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Suspended |
  Then I edit org KYC Info with below details
  | Postal_Address | Physical_Address | Reason |
  | PostalAdd      | PhyAdd           | Test   |
  #Post-requsite
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "Business Op- check SP Operator cannot successfully Edit organization KYC in a suspended state."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcannotsuccessfullyEditorganizationKYCinafrozenstate!
Scenario: Business Op-check SP Operator cannot successfully Edit organization KYC in a frozen state
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "PostalAdd" with value "Semonkong_RAND_4"
  Given I generate name "PhyAdd" with value "Semonkong_RAND_4"
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Frozen |
  #Post-Requisite
  Then I edit org KYC Info with below details
  | Postal_Address | Physical_Address | Reason |
  | PostalAdd      | PhyAdd           | Test   |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "Business Op-check SP Operator cannot successfully Edit organization KYC in a frozen state"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-SPOperatorcansuccessfullycreateOrganizationOperator-merchant!
Scenario: Business OP-SP Operator can successfully create Organization Operator - merchant
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgUsername" with value "OrgOperator_RAND_4"
  Given I generate name "msisdn" with value "8613000_RAND_6"
  Given I generate name "OpeId" with value "OperId_RAND_6"
  Then I create organization operator with below details
  | ShortCode                           | Language                | AccessChannel | UserName    | MSISDN | OperatorId | Role        | Gender        | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | ShortCode.MerchantpayementShortCode | Language.Southern Sotho | Web           | OrgUsername | msisdn | OpeId      | C2B Manager | Gender.Female | SMS                            | 2314563243465                 | Test Email |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-SPOperatorcreatesOrganizationOperator-utilitypayment!
Scenario: Business Op-SP Operator creates Organization Operator - utility payment
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgUsername" with value "OrgOperator_RAND_4"
  Given I generate name "msisdn" with value "8613000_RAND_6"
  Given I generate name "OpeId" with value "OperId_RAND_6"
  Then I create organization operator with below details
  | ShortCode                          | Language                | AccessChannel | UserName    | MSISDN | OperatorId | Role        | Gender        | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | ShortCode.UtilitypayementShortCode | Language.Southern Sotho | Web           | OrgUsername | msisdn | OpeId      | C2B Manager | Gender.Female | SMS                            | 2314563243465                 | Test Email |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-SPOperatorcreatesOrganizationOperator-payschoolfees!
Scenario: Business Op-SP Operator creates Organization Operator - pay school fees.
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgUsername" with value "OrgOperator_RAND_4"
  Given I generate name "msisdn" with value "8613000_RAND_6"
  Given I generate name "OpeId" with value "OperId_RAND_6"
  Then I create organization operator with below details
  | ShortCode                        | Language                | AccessChannel | UserName    | MSISDN | OperatorId | Role        | Gender        | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | ShortCode.PaySchoolFeesShortCode | Language.Southern Sotho | Web           | OrgUsername | msisdn | OpeId      | C2B Manager | Gender.Female | SMS                            | 2314563243465                 | Test Email |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_0602CreateaTrustAccount!
Scenario:Create a Trust Account
  Given I login to Fintech as "sp" operator
  Then I create trustbank
  Given I generate name "BankName" with value "Bank_RAND_4"
  Given I generate name "Accountnumber" with value "77774444555566611111_RAND_4"
  Then I enter text for "GenericLocators.BankAccountName" with value "BankName"
  Then I enter text for "GenericLocators.AccountNumber" with value "Accountnumber"
  Then I click on "Submit" button in cite
  Then I report "Create a Trust Account is Created"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_0601CreateaTrustBank!
Scenario: 0601  Create a Trust Bank
  Given I login to Fintech as "sp" operator
  Given I generate name "shortcode" with value "12_RAND_4"
  Given I generate name "trustbankcode" with value "01_RAND_1"
  Given I generate name "bankbranch" with value "TEST_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Bank" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I wait "3"
  Then I select drop down "Bank" with option "CENTRAL BANK OF LESOTHO"
  Then I enter text for "GenericLocators.BankBranch" with value "bankbranch"
  Then I enter text for "GenericLocators.BankBranchShortcode" with value "shortcode"
  Then I click on "GenericLocators.TrustBankCheckbox"
  Then I wait "3"
  Then I scroll page to bottom
  Then I enter text for "GenericLocators.TrustBankCode" with value "trustbankcode"
  Then I click on "GenericLocators.TrustBankOffline"
  Then I click on "Next " button in cite
  Then I click on "Next " button in cite
  Then I click on "Submit " button in cite
  When static text "Bank created successfully." is visible
  Then I report "Create a Trust Bank"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TopORGSuperAgentwithinsufficientfundswithdrawfromAnotherSuperAgent!
Scenario: Top ORG_ Super Agent with insufficient funds withdraw from Another Super Agent
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount             | Reason             |
  | TransactionServices.BusinessToBusinessTransfer | Short Code                       | ShortCode.ShortCode3           | Amount.Limit100000 | Reason Description |
  Then I report "Super Agent with insufficient funds withdraw from Another Super Agent"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcannotchangeorgproduct-suspendedstate!
Scenario:Business Op-check SP Operator cannot change org product - suspended state
  Given I login to Fintech as "spBackoff" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode6 | Label.Organization Short Code | ShortCode.ShortCode6 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status           |
  | Table.Organization | ShortCode.ShortCode6 | Label.Organization Short Code | ShortCode.ShortCode6 | Status.Suspended |
  Then I click on the "Product" tab
  Then I click on "Edit Product" to check
  Then I click on "GenericLocators.FrozenOrgConfirm"
  Then I logout the "sp" portal and close the browser
  # Post-Requisite
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status           |
  | Table.Organization | ShortCode.ShortCode6 | Label.Organization Short Code | ShortCode.ShortCode6 | Status.Suspended |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "Business Op-check SP Operator cannot change org product - suspended state"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp_checkSPOperatorcansuccessfullychangeorgproduct_frozenstate!
Scenario:Business Op- check SP Operator can successfully change org product - frozen state
  Given I login to Fintech as "spBackoff" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode6 | Label.Organization Short Code | ShortCode.ShortCode6 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode6 | Label.Organization Short Code | ShortCode.ShortCode6 | Status.Frozen |
  Then I click on the "Product" tab
  Then I click on "Edit Product" to check
  Then I click on "GenericLocators.FrozenOrgConfirm"
  Then I logout the "sp" portal and close the browser
  # Post-Requisite
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode6 | Label.Organization Short Code | ShortCode.ShortCode6 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "Business Op- check SP Operator can successfully change org product - frozen state"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcansuccessfullycreatetoporganization-IMTorganization!
Scenario:Business Op-check SP Operator can successfully create top organization- IMT organization
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product          | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | IMT Organisation | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I report "Business Op-check SP Operator can successfully create top organization- IMT organization"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcansuccessfullycreatetoporganization-utilitypayment!
Scenario:Business Op-check SP Operator can successfully create top organization- utility payment
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product                       | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | C2B Business - Utlity Payment | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I report "Business Op-check SP Operator can successfully create top organization- utility payment"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcansuccessfullycreatetoporganization-MNO!
Scenario:Business Op-check SP Operator can successfully create top organization- MNO
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | MNO     | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I report "Business Op-check SP Operator can successfully create top organization- MNO"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcansuccessfullycreatetoporganization-merchantaccount!
Scenario:Business Op-check SP Operator can successfully create top organization- merchant account
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product                | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode |
  | Pay Merchant Hierarchy | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | No Validation   |
  Then I report "Business Op-check SP Operator can successfully create top organization- merchant account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TopOrgAgencyHOOperatorattempttoviewOperatorstoseelistofoperatorsintheorganization!
Scenario:Top Org_ Agency HO Operator attempt to view Operators to see list of operators in the organization
  Given I login to Fintech as "orgAgenHO" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I enter text for "GenericLocators.Operatorid" with value "OperatorID"
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  Then I wait "5"
  Then I scroll page to bottom
  Then I report "Agency HO Operator attempt to view Operators to see list of operators in the organization"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_TopOrgAgencyHeadHOOperatortovieworganizationbankAccount!
Scenario:Top Org_ Agency Head HO Operator to view organization bank Account
  Given I login to Fintech as "orgAgenHO" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on the "Bank Account" tab
  Then I scroll page to bottom
  Then I report "Agency Head HO Operator to view organization bank Account"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_WebIndependentStoreDownloadStatement!
Scenario:Web- Independent Store_ Download Statement
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I click on "Transaction Center" on button in top menu
  Then I click on left child menu "Account Statement" in org of the "Transaction Center" Page
  Then I select drop down "Account Type" with option "M-PESA Account/10110015000100030900400010011426"
  Then I click on " Search " button in cite
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.CSVexport"
  Then I check file is downloaded in "csv" format
  Then I report "Org Account statement can be downloaded via CSV"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Retail-SPOperatorcansuccessfullychangeorganizationoperatoridentitystatus!
Scenario: Retail-SP Operator can successfully change organization operator's identity status
  Given I login to Fintech as "retailsp" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                    | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId5 | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization operator" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I logout the "sp" portal and close the browser
  #Post Requisite
  Given I login to Fintech as "retailsp" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                    | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId5 | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization operator" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_B2COrgoperatorInitiateTransactionBusinessPaymenttoCustomerwithdrawalchargepaid!
Scenario: B2C - Org operator Initiate Transaction -  business payment to customer withdrawal charge paid
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                                              | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomerWithdrawalChargePaid | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I report "Business Payment To Customer Withdrawal Charge Paid"
  Then I logout the "org" portal and close the browser
  Given I login to Fintech as "sp" operator
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"

@TC_FINLSO_REG_MARKET_EditBankStatementTemplate!
Scenario:0608 Edit Bank Statement Template
  Given I login to Fintech as "sp" operator
  Given I generate name "bankname" with value "Bank_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I enter text in "Label.TemplateName" with value "Bank6128"
  Then I click on " Search " button in cite
  Then I check table "Table.RemovedAccount" with multiple values as "Bank6128" and click on "Detail" of "Operation" column
  Then I click on "Edit" button in cite
  Then I enter text in "Label.FileTemplateName" with value "bankname"
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
  # Post-condition
  Then I click on "Edit" button in cite
  Then I enter text in "Label.FileTemplateName" with value "Bank6128"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Editbutton"
  Then I click on "GenericLocators.DeleteField"
  Then I wait "3"
  Then I click on "GenericLocators.DeleteFieldConfirm"
  Then I click on "Submit" button in cite
  Then I report "Bank Statement Template is edited Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FSExceptionBalanceNotEnoughDeriveTransactionFailed!
Scenario:FS_Exception_Balance Not Enough_Derive Transaction Failed
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "E-money Withdrawal" in the "Home" Page
  Then I enter text in "Label.Amount($)" with value "Amount.Limit100000"
  Then I select drop down "From" with option "M-PESA Account \ 1010000800000100010011426"
  Then I select drop down "To" with option "dcacc \ 1134567"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I wait "3"
  Then I check error text "The maximum amount cannot exceed available balance." is displayed
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FSExceptionCancelAndNotReverseOriginalTransactionAfterApprove!
Scenario:FS_Exception_Cancel and Not Reverse Original Transaction After Approve
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
  Then I report "The sp operator can cancel Finance withrawals Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-VerifySPOperatorIsAbleToRecycleCustomermsisdn!
Scenario:Business OP-Verify SP Operator is able to recycle customer msisdn
  #Create customer
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "CustomerMSISDN" with value "266585_RAND_5"
  Given I generate name "IDNumber" with value "130_RAND_3"
  Then I create customer the with below details
  | Product Name                | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Registeredcustomer | CustomerMSISDN | TestAUTO   | FintechAUTO | AutoTest  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  #Recycling the Customer
  Then I recycle the MSISDN "CustomerMSISDN"
  When MakerChecker is on "Approve" task from group task for "Approve 'Recycle MSISDN'"
  Then I report "Operator can successfully recycle the MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FSQuerycommissionallocationorder!
Scenario:FS_Query commission allocation order
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "Commission" in the "Home" Page
  Then I click on " Search " button in cite
  Then I report "FS Query commission allocation order is done successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCBOViewGroupList!
Scenario:CC BO - View Group List
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on left child menu "Group List" in the "Home" Page
  Then I report "View GroupList done successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TakeacallSuspendCustomeraccount!
Scenario: Take a call - Suspend Customer account
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I change the Account status to "Suspended" of the Account "M-PESA Account"
  When MakerChecker is on "Approve" task from group task for "Change Customer Account Status"
  Then I report "Suspend Customer account is done successfully"
  Then I logout the "sp" portal and close the browser
  #Post-Requisite
  Given I login to Fintech as "sp" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer2 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I change the Account status to "Active" of the Account "M-PESA Account"
  When MakerChecker is on "Approve" task from group task for "Change Customer Account Status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_OrgRevenueSettlmentManuallyBySpOperator!
Scenario:FS_Org Revenue Settlment Manually By Sp Operator
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "Revenue Settlement" in the "Home" Page
  Then I click on left child menu "Organization Revenue Settlement" in the "Home" Page
  Then I click on "GenericLocators.InitiateCreate"
  Then I click on "Add " button in cite
  Then I click on "2" checkbox in dialog window
  Then I click on " Confirm " button in cite
  Then I enter text for "GenericLocators.ExpectedNetRevenue" with value "10"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.ConfirmMakerchecker"
  Then I close tab near to home tab
  Then I click on left child menu "Revenue Settlement" in the "Home" Page
  Then I click on left child menu "Organization Revenue Settlement" in the "Home" Page
  Then I wait "4"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ProcessButton"
  Then I click on "GenericLocators.ContinueButton"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit " button in cite
  Then I click on "GenericLocators.History"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.DetailHistory"
  Then I wait "3"
  Then I report "Org Revenue Settlment Manually By Sp Operator is completed Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_Exception_RejectRevenuePlan!
Scenario: FS_Exception_Reject Revenue Plan
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "Revenue Settlement" in the "Home" Page
  Then I click on left child menu "Organization Revenue Settlement" in the "Home" Page
  Then I click on "GenericLocators.InitiateCreate"
  Then I click on "Add " button in cite
  Then I enter text in "Short Code" with value "010002"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.Addcheckbox"
  Then I click on " Confirm " button in cite
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.ConfirmMakerchecker"
  Then I wait "4"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ProcessButton"
  Then I click on "GenericLocators.TerminateButton"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.History"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.DetailHistory"
  Then I report "FS_Exception_Reject Revenue Plan"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Takeacall-Viewcustomeraccumulator!
Scenario: Take a call - View customer accumulator
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I click on "GenericLocators.Accumulator"
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseView"
  Then I report "Take a call - View customer accumulator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Takeacall-Activatecustomerstatus!
Scenario: Take a call - Activate customer status
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I report "Take a call - Activate customer status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcannotsuccessfullyEditorganizationKYCinadormantstate!
Scenario: Business Op-check SP Operator cannot successfully Edit organization KYC in a dormant state
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "PostalAdd" with value "Semonkong_RAND_4"
  Given I generate name "PhyAdd" with value "Semonkong_RAND_4"
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.ShortCode10 | Label.Organization Short Code | ShortCode.ShortCode10 | Status.Frozen |
  #Post-Requisite
  Then I edit org KYC Info with below details
  | Postal_Address | Physical_Address | Reason |
  | PostalAdd      | PhyAdd           | Test   |
  Then I report "Business Op-check SP Operator cannot successfully Edit organization KYC in a dormant state"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_DownloadOrganizationRevenueSettlementReport!
Scenario: FS_Download Organization Revenue Settlement Report
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "Revenue Settlement" in the "Home" Page
  Then I click on left child menu "Organization Revenue Settlement" in the "Home" Page
  Then I click on "GenericLocators.History"
  Then I click on " Search " button in cite
  Then I wait "10"
  Then I click on "GenericLocators.Download"
  Then I check file is downloaded in "excel" format
  Then I report "FS_Download Organization Revenue Settlement Report successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_ViewOrgRevenueSettlementProfileDetails!
Scenario: FS_View Org Revenue Settlement Profile Details
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Settlement" in the "Home" Page
  Then I click on "GenericLocators.ConfigurationRevenueSettlement"
  Then I click on left child menu "Organization Revenue Settlement Profile" in the "Home" Page
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.DetailHistoryProfile"
  Then I report "FS_View Org Revenue Settlement Profile Details successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-checkSPOperatorcannotchangeorgproduct-dormantstate!
Scenario:Business Op-check SP Operator cannot change org product - dormant state.
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status         |
  | Table.Organization | ShortCode.ShortCode10 | Label.Organization Short Code | ShortCode.ShortCode10 | Status.Dormant |
  Then I click on the "Product" tab
  Then I click on "Edit Product" to check
  Then I click on "Add Product" button in cite
  Then I click on "AddProduct.C2BBusiness-UtlityPaymentTill" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I enter text for "GenericLocators.DormantRemark" with value "Test"
  Then I click on "GenericLocators.DormantProductSubmit"
  Then I wait "3"
  Then I check error text "The 010121 - orgyyyy receiver is in the Dormant state which does not support the current service." is displayed
  Then I click on "GenericLocators.ConfirmException"
  Then I report "Business Op-check SP Operator cannot change org product - dormant state."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TopOrg_AgencyStoreOperatorlinkedtoCentrallyownedTopOrganizationtocheckbalanceOverview!
Scenario:Top Org_ Agency Store Operator linked to Centrally owned Top Organization to check balance Overview
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.Organizationleftchild"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I click on "Search" button in cite
  Then I check table "Table.Organization1" with multiple values as "ShortCode.ShortCode1" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I click on "GenericLocators.BankOverview"
  When static text "Balance Overview" is visible
  Then I select drop down "Account Type" with option "M-PESA Account"
  Then I click on " Search " button in cite
  Then I wait "3"
  Then I select drop down "Account Type" with option "Utility Disbursement Account"
  Then I click on " Search " button in cite
  Then I report "Top Org_ Agency Store Operator linked to Centrally owned Top Organization to check balance Overview"
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_ViewBankStatementTemplateDetail!
Scenario:View Bank Statement Template Detail
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I enter text in "Label.TemplateName" with value "Bank_Template"
  Then I select drop down "Statement Type" with option "DropDown.NormalTransactions"
  Then I select drop down "Format" with option "DropDown.CSV"
  Then I click on " Search " button in cite
  Then I check table "Table.RemovedAccount" with multiple values as "Bank_Template" and click on "Detail" of "Operation" column
  When static text "Basic Info" is visible
  Then I report "View Bank Statement Template Detail"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_SearchCommissionPaymentHistoryByOrganizationShortCode!
Scenario:FS_Search Commission Payment History By Organization Short Code
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in org of the "Home" Page
  Then I click on left child menu "Commission" in org of the "Home" Page
  Then I click on "GenericLocators.CommissionPaymentTaskClick"
  Then I click on "GenericLocators.CommissionPaymentHistory"
  Then I enter text for "GenericLocators.CommissionPaymentShortCode" with value "ShortCode.ShortCode1"
  Then I click on " Search " button in cite
  Then I report "FS_Search Commission Payment History By Organization Short Code Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPVerifySPOperatorisabletocancel/completeauthorizedmpesatransactions!
Scenario:Business OP-Verify SP Operator is able to cancel/complete authorized mpesa transactions
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                          | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.BusinessPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I logout the "sp" portal and close the browser
  #Reject the Transaction
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reject"
  When static text "Transaction rejected successfully." is visible
  Then I report "SP Operator is able to cancel/complete authorized mpesa transactions with BackOffice Role"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FSExporttheTransactionMT101!
Scenario:FS_Export the Transaction_MT101
  Given I login to Fintech as "sp" operator
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
  Then I click on left child menu "Bank File" in the "Home" Page
  Then I click on left child menu "EFT" in the "Home" Page
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.CheckboxforTill"
  Then I click on "GenericLocators.ExportFinaceButton"
  Then static text "EFT files exported successfully." is visible
  Then I report "Export MT101 successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPoperatorcansearchforrefund!
Scenario:SP operator can search for refund
  Given I login to Fintech as "sp" operator
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
  Then I report "SP operator can search for refund"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_ExportCommissionPaymentHistory!
Scenario:FS_Export Commission Payment History
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "Commission" in the "Home" Page
  Then I click on left child menu "Commission Payment Task" in the "Home" Page
  Then I wait "10"
  Then I click on "GenericLocators.HisTory"
  Then I enter text for "GenericLocators.Organization Short Code" with value "ShortCode.ShortCode9"
  Then I click on " Search " button in cite
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.Excel"
  Then I check file is downloaded in "excel" format
  Then I report "Exporting an Excel file is done successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_RetailSPOperatorcansuccessfullycreateregisteredcustomer!
Scenario:Retail-SP Operator can successfully create registered customer
  Given I login to Fintech as "retailsp" operator
  Then I click on "Create" button in cite
  Then I click on "GenericLocators.Create_Identity"
  When static text " Create Customer " is not visible
  Then I click on "GenericLocators.Create_Group"
  Then I report "Retail-SP Operator can't successfully create registered customer"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCHBOOPeratorEnsureBOisunabletoCloseOrganizationstatus!
Scenario:CCH BO OPerator - Ensure BO is unable to Close Organization status
  Given I login to Fintech as "retailsp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I click on "GenericLocators.EditIdentityStatus"
  Then I click on "GenericLocators.statusdropdown"
  When static text "Closed" is not visible
  When static text "Suspended" is visible
  When static text "Frozen" is visible
  Then I click on "GenericLocators.Closebutton"
  Then I report "CCH BO OPerator - Ensure BO is unable to Close Organization status"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_RetailSPoperatorisunableLoginintotheportalusinginvalidusername!
Scenario:Retail-SP operator is unable Login into the portal using invalid username
  Given I login to Fintech as "retailspInvalid" operator
  When static text "Incorrect username, password, or status" is visible
  Then I report "Retail-SP operator is unable Login into the portal using invalid username"

@TC_FINLSO_REG_MARKET_FS_CreateOrgRevenueSettlmentProfile!
Scenario: FS_Create Org Revenue Settlment Profile
  Given I login to Fintech as "sp" operator
  Given I generate name "RevenueSettlementProfileName" with value "RSP_RAND_3"
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Settlement" in the "Home" Page
  Then I click on "GenericLocators.ConfigurationRevenueSettlement"
  Then I click on left child menu "Organization Revenue Settlement Profile" in the "Home" Page
  Then I click on "GenericLocators.CreateConfigurationRevenueSettlement"
  Then I enter text in "Revenue Settlement Profile Name" with value "RevenueSettlementProfileName"
  Then I scroll "GenericLocators.MakerCheckerSwitch" to view using "false" parameter
  Then I click on "GenericLocators.CreateConfigurationRevenueSettlement1"
  Then I click on "GenericLocators.CreateOwner"
  Then I click on "GenericLocators.Transactionservices"
  Then I click on "GenericLocators.SelectCommissionHeldAccount"
  Then I enter text in "Settlement Account Minimum Balance" with value "1"
  Then I select drop down "Currency" with option "USD"
  Then I click on "GenericLocators.AccountType1"
  Then I click on "GenericLocators.SelectCommissionHeldAccount"
  Then I enter text for "GenericLocators.Tragetvalue" with value "1"
  Then I click on "GenericLocators.AccountType2"
  Then I click on "GenericLocators.SelectCommissionPayableAccount"
  Then I enter text for "GenericLocators.Tragetvalue1" with value "1"
  Then I select drop down "Organization Operator Role" with option "Super Agent Operator"
  Then I scroll "GenericLocators.orgNotificationTypeName" to view using "false" parameter
  Then I click on "GenericLocators.orgNotificationTypeName"
  Then I click on "GenericLocators.radioLabel"
  Then I click on "GenericLocators.ConfigurationRevenueSettlementConfirm"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.ConfigurationRevenueSettlement"
  Then I report "FS_Create Org Revenue Settlment Profile"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_EditOrgRevenueSettlementProfile!
Scenario: FS_Edit Org Revenue Settlement Profile
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Settlement" in the "Home" Page
  Then I click on "GenericLocators.ConfigurationRevenueSettlement"
  Then I click on left child menu "Organization Revenue Settlement Profile" in the "Home" Page
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.EditHistoryProfile"
  Then I enter text area "Description" with value "Test"
  Then I click on "Submit" button in cite
  Then I report "FS_Edit Org Revenue Settlement Profile"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_Exception_Insufficientbalanceofsettlementaccount!
Scenario: FS_Exception_Insufficient balance of settlement account
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "Revenue Settlement" in the "Home" Page
  Then I click on left child menu "Organization Revenue Settlement" in the "Home" Page
  Then I click on "GenericLocators.InitiateCreate"
  Then I click on "Add " button in cite
  Then I click on "GenericLocators.Checkbox4"
  Then I click on "GenericLocators.ConfirmButton1"
  Then I enter text for "GenericLocators.ExpectedNetRevenueAmount" with value "10000"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.ConfirmMakerchecker"
  Then I close tab near to home tab
  Then I click on left child menu "Revenue Settlement" in the "Home" Page
  Then I click on left child menu "Organization Revenue Settlement" in the "Home" Page
  Then I wait "4"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ProcessButton"
  Then I click on "GenericLocators.ApproveContinueButton"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ProcessButton"
  Then I click on "GenericLocators.ApproveContinueButton"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I report "FS_Exception_Insufficient balance of settlement account successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_ViewCommissionPaymentHistory!
Scenario:FS_View Commission Payment History
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "Commission" in the "Home" Page
  Then I click on left child menu "Commission Payment Task" in the "Home" Page
  Then I wait "10"
  Then I click on "GenericLocators.HisTory"
  Then I enter text for "GenericLocators.Organization Short Code" with value "ShortCode.ShortCode5"
  Then I click on " Search " button in cite
  Then I check table "Table.CustomerInUserService" with multiple values as "ShortCode.ShortCode5" and click on "Detail" of "Operation" column
  Then I report " View of Commission Payment History is done successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_B2COrgoperatorInitiateTransactionUtilityAccountwithInsufficientfunds!
Scenario: B2C - Org Operator Initiate Transaction - Utility Account with Insufficient funds
  Given I login to Fintech as "orgB2C" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                                   | Amount              | Reason             |
  | TransactionServices.BusinessTransfers-UtilityDisbursementto/fromM-PESA Working Account | Amount.Limit1300000 | Reason Description |
  Then I check error text "The balance in account 10110025000100030401300010011426(LSL) of account type M-PESA Account of identity 010204 - Morolong is insufficient for the transaction." is displayed
  Then I report "Operator transfers funds from Utility account to Mpesa account with Insufficient funds is Done successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_TopOrgAgencyHOOperatorattempttotobrowseorganizationtoviewOrganizationdetails!
Scenario:Top Org_ Agency HO Operator attempt to browse organization to view Organization details
  Given I login to Fintech as "orgAgenHO" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.Organizationleftchild"
  Then I enter text in "Label.Organization Short Code" with value "Login.orgAgenHO.Shortcode"
  Then I click on "Search" button in cite
  Then I check table "Table.Organization1" with multiple values as "Login.orgAgenHO.Shortcode" and click on "Detail" of "Operation" column
  Then I wait "5"
  Then I close the current tab
  Then I report "Agency HO Operator attempt  to browse organization to view Organization details"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_Link1EntryonOutstandingEntryPage!
Scenario:FS_Link 1 Entry on Outstanding Entry Page
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Control Account Transfer" in the "Home" Page
  Then I enter text for "GenericLocators.Amounttransfer" with value "Amount.Minimum"
  Then I select drop down "From" with option "Control Account \ 1010000800000100010001426"
  Then I click on "GenericLocators.Todropdown"
  Then I wait "10"
  Then I click on "GenericLocators.Control Account"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on " Submit " button in cite
  When static text "Control account transfer submitted successfully" is visible
  #Approve The Transaction
  Then I click on left child menu "Approve Finance Transactions" in the "Home" Page
  Then I select drop down "Transaction Type" with option "Transfer to M-PESA Control Account"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ApproveCheckbox"
  Then I click on "Confirm" radio
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Finance transaction approved successfully." is visible
  Then I report "The sp operator can cancel Finance withrawals Successfully"
  Then I click on left child menu "Bank File" in the "Home" Page
  Then I click on left child menu "EFT" in the "Home" Page
  Then I click on " Search " button in cite
  Then I click on " Export " button in cite
  Then I click on "GenericLocators.CheckboxforTill"
  Then I click on "GenericLocators.ExportFinaceButton"
  Then static text "EFT files exported successfully." is visible
  Then I report "FS_Link 1 Entry on Outstanding Entry Page is done successsfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_OrganizationPortalForgotPasswordResetSuccessfully!
Scenario: Top Org_ Agency Store Operator Forgot Password
  Given I navigate to Mpesa "orgnew" portal
  Then I click on "GenericLocators.OrgPortalForgetPassword"
  Then I enter text in "Short Code" with value "Login.orgnew.Shortcode"
  Then I enter text in "User Name" with value "Login.orgnew.UserID"
  Then I click on "Submit" button in cite
  Then I enter text in "Answer1" with value "chennai"
  Then I click on "Confirm" button in cite
  When static text "Password retrieved successfully." is visible
  Then I report "The Organization Portal_Forgot Password Reset Successfully"

@TC_FINLSO_REG_MARKET_Takeacall-EnsureAgentcannotaccessGroupTask!
Scenario: Take a call - Ensure Agent cannot access Group Task
  Given I login to Fintech as "spcc" operator
  When I verify customer from Take a Call
  | Query Condition | MSISDN                        | btnName     | SecretAnswer |
  | MSISDN          | Customer.Registered_Customer1 | Button.Pass | chennai      |
  Then I click on " Verify " button in cite
  Then I report "Ensure Agent cannot access Group Task successsfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_WebTopOrgSuperAgentwithdrawalfromAnotherSuperAgent!
Scenario: Web - Top Org _ Super Agent withdrawal from Another Super Agent
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                           | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.BusinessToBusinessTransfer | Short Code                       | ShortCode.ShortCode3           | Amount.Minimum1 | Reason Description |
  Then I report "Super Agent withdrawal from Another Super Agent successsfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-TopOrgStandAloneSuperAgentdepositintoanindependentstorelinkedtoanothersuperAgent!
Scenario: Web - Top Org _ Stand Alone Super Agent deposit into an independent store [linked to another super Agent]
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                | Receiver_Identifier_Account_Type | Receiver_Identifier_Till_MSISDN | Amount          | Reason             |
  | TransactionServices.BusinessDeposit | Till MSISDN                      | Till.MpatOrgOne.MSISDN2         | Amount.Minimum1 | Reason Description |
  Then I report "Stand Alone Super Agent deposit into an independent store [linked to another super Agent] successsfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStore_Agentdeposittoanotheragent-success!
Scenario:Web - Independent Store_Agent deposit to another agent - success
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                   | Receiver_Identifier_Account_Type | Receiver_Identifier_Till_MSISDN | Amount          | Reason             |
  | TransactionServices.MerchantToMerchant | Till MSISDN                      | Till.MpatOrgOne.MSISDN2         | Amount.Minimum1 | Reason Description |
  Then I report "Web - Independent Store_Agent deposit to another agent - successsfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_DailyCommissionSubtotalAutomatically!
Scenario: FS_Daily Commission Subtotal Automatically
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "Commission" in the "Home" Page
  Then I click on left child menu "Daily Commission Subtotal" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "Shortcode.Shortcode1"
  Then I click on " Search " button in cite
  Then I report "FS_Daily Commission Subtotal Automatically successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-VerifythatSPOperatorcansuccessfullychangeOperatorstatustosuspended!
# Steps completed but failed due to system error
Scenario:Business OP-Verify that SP Operator can successfully change Operator status to suspended
  Given I login to Fintech as "spBackoff" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I click on left child menu "Operators" in the "Home" Page
  Then I check table "Table.OrganizationOperator" with multiple values as "101100230001000304000" and click on "Detail" of "Operation" column
  Then I edit Identity Status in "Organization operator" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  #Post-requisite
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I click on left child menu "Operators" in the "Home" Page
  Then I check table "Table.OrganizationOperator" with multiple values as "101100230001000304000" and click on "Detail" of "Operation" column
  Then I edit Identity Status in "Organization operator" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I report "Business OP-Verify that SP Operator can successfully change Operator status to suspended"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-VerifythatSPOperatorcansuccessfullychangeOperatorstatustoactive!
# Steps completed but failed due to system error
Scenario:Business OP-Verify that SP Operator can successfully change Operator status to active
  Given I login to Fintech as "spBackoff" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I click on left child menu "Operators" in the "Home" Page
  Then I check table "Table.OrganizationOperator" with multiple values as "101100230001000304000" and click on "Detail" of "Operation" column
  Then I edit Identity Status in "Organization operator" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  #Post-requisite
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I click on left child menu "Operators" in the "Home" Page
  Then I check table "Table.OrganizationOperator" with multiple values as "101100230001000304000" and click on "Detail" of "Operation" column
  Then I edit Identity Status in "Organization operator" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I report "Business OP-Verify that SP Operator can successfully change Operator status to active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCBO_Viewaccumulator!
Scenario:CC BO - View accumulator
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on "GenericLocators.Accumulator"
  Then I check table "Table.CustomerInUserService" with multiple values as "SP Operator|Unlock Operator Pin" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseView"
  Then I report "CC BO - View accumulator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-VerifythatSPOperatorcansuccessfullychangecustomerstatus-tofrozen!
#Defect:Approval is required to change status
Scenario: Business OP-Verify that SP Operator can successfully change customer status - to frozen
  Given I login to Fintech as "spBackoff" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Frozen"
  # Then I click on "GenericLocators.Confirm"
  # When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  # When I search for "Customer" with below details
  # | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  # | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Active"
  # Then I click on "GenericLocators.Confirm"
  # When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status"
  Then I report "Business OP-Verify that SP Operator can successfully change customer status - to frozen"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStoreLoginusinginvalidShortcode_Exception!
Scenario:Web- Independent Store_ Login using invalid Short code (Exception)
  Given I navigate to Mpesa "org" portal
  Then I enter text in "Short Code" with value "Login.orgIncorrectShortcode.Shortcode"
  Then I enter text in "User Name" with value "Login.orgAgencyIndep.UserID"
  Then I enter text in "Password" with value "Login.orgAgencyIndep.password"
  Then I enter text in "Verification Code" with value "Login.orgIncorrectShortcode.VerificationCode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "5"
  Then I click on " I Have Read And Agreed" button in cite
  Then I click on " Login " button in cite
  Then I wait "4"
  Then I check error text " Incorrect username, password, or status. Remaining attempts: " is displayed
  Then I report "Web- Independent Store_ Login using invalid Short code throws Exception"

@TC_FINLSO_REG_MARKET_CCBO-EnsurethatoperatorcannotUpgradeCustomerTrustLevel!
Scenario: CC BO - Ensure that operator cannot Upgrade Customer Trust Level
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer3 | Label.MSISDN | Customer.Registered_Customer3 | Status.Active |
  Then I click on the "KYC Info" tab
  Then I click on "Edit" button in cite
  Then I select drop down "Trust Level" with option "Registered Customer Tier 3"
  Then I enter text area "Remark" with value "Test"
  Then I click on "GenericLocators.Submiteditkyc"
  When static text "There is no modification." is visible
  Then I click on "Confirm" button in cite
  Then I report "CC BO cannot Upgrade Customer Trust Level"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_CCBO-CancelAuthorizedtransaction!
Scenario:CC BO - Cancel Authorized transaction
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I get value from label in " Receipt No.  " and store it in "transactionReceiptNum"
  Then I logout the "sp" portal and close the browser
  #Reject the Transaction
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reject"
  When static text "Transaction rejected successfully." is visible
  Then I report "CC BO - Cancel Authorized transaction Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStoreIndependentAgentDeposittoDormantCustomer!
Scenario:Web - Independent Store_ Independent Agent Deposit to Dormant Customer
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                 | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN | Amount          | Reason             |
  | TransactionServices.Customer Deposit | MSISDN                           | Customer.DormantCustomer   | Amount.Minimum1 | Reason Description |
  Then I report "Web-Independent Store Agent Deposit to Dormant Customer Successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_RetailSPoperatorisabletoLogintotheportalusingallValidcredentials!
Scenario: Retail-SP operator is able to Login to the portal using all Valid credentials
  Given I login to Fintech as "retailsp" operator
  Then I report "Retail-SP operator is able to Login to the portal using all Valid credentials"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_TakeacallEnsurethatcallcenteragentcannotactivateOrgOperatorstatus!
Scenario: Take a call - Ensure that call center agent cannot activate Org Operator status
  Given I login to Fintech as "spcc" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | fail       |
  Then I click on " Verify " button in cite
  When static text "Verify Failed!" is visible
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I click on Generic "Fail"
  Then I click on " Verify " button in cite
  Then I wait "3"
  Then I check error text "The number of verification attempts has reached the upper limit." is displayed
  Then I wait "5"
  Then I click on "GenericLocators.ConfirmException"
  Then I report "I cant find Org Operator in left child menu thus call center cant change org operator status to active"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "sp" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                   | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId | ShortCode.ShortCode1 | Status.Active |
  Then I select "Unlock Suspend" in Operation
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Takeacall-EnsurethatcallcenteragentcannotsuspendOrgOperator!
Scenario: Take a call - Ensure that call center agent cannot suspend Org Operator
  Given I login to Fintech as "spcc" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I report "Ensure that call center agent cannot suspend Org Operator "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStore_LoginusinginvalidUsernameException!
Scenario: Web - Independent Store_ Login using invalid Username (Exception)
  Given I navigate to Mpesa "org" portal
  Then I enter text in "Short Code" with value "Login.orgAgencyIndep.Shortcode"
  Then I enter text in "User Name" with value "Login.orgAgencyIndep.UserID"
  Then I enter text in "Password" with value "Login.orgIncorrectShortcode.password1"
  Then I enter text in "Verification Code" with value "Login.orgIncorrectShortcode.VerificationCode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "3"
  Then I click on " I Have Read And Agreed" button in cite
  Then I click on " Login " button in cite
  Then I wait "4"
  Then I check error text "Incorrect username, password, or status." is displayed
  Then I report "Web - Independent Store_ Login using invalid Username (Exception) is done Successfully"

@TC_FINLSO_REG_MARKET_BusinessOP-VerifySPOperatorisabletoreversetransactionwithsufficientfunds!
Scenario:Business OP-Verify SP Operator is able to reverse transaction with sufficient funds
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
  Then I report "Business OP-Verify SP Operator is able to reverse transaction with sufficient funds"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_C2B_OrgPortal-MerchantwithdrawfundsfromAgentviaorgportal!
Scenario: C2B_Org Portal-Merchant withdraw funds from Agent via org portal
  Given I login to Fintech as "orgC2BII" operator
  Then I initiate transaction with below details
  | Transaction_Services                                   | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.MerchantWithdrawalofFundsfromagent | Short Code                       | ShortCode.ShortCode1           | Amount.Minimum1 | Reason Description |
  Then I report "Merchant Withdraw funds from agent via org portal"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_C2B_OrgPortal-MerchantPaysforgood/servicestoanothermerchantorgportalsuccessfully!
Scenario: C2B_Org Portal-Merchant Pays for good/services to another merchant via org portal successfully
  Given I login to Fintech as "orgC2BII" operator
  Then I initiate transaction with below details
  | Transaction_Services                   | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.MerchantToMerchant | Short Code                       | ShortCode.ShortCode1           | Amount.Minimum1 | Reason Description |
  Then I report "Merchant Withdraw funds from agent via org portal"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorSuccessfullyAddCustomerProduct!
Scenario: SP Operator can successfully Add customer product
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "266585_RAND_5"
  Given I generate name "IDNumber" with value "130_RAND_3"
  Then I create customer the with below details
  | Product Name                | MSISDN         | First Name | Middle Name | Last Name     | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Registeredcustomer | CustomerMSISDN | TestKYC    | FintechTest | AutomationKYC | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  When I search for "Customer" with below details
  | TableId                  | TableValues    | SearchBy     | SearchValue    | Status        |
  | Table.CustomerInIdentity | CustomerMSISDN | Label.MSISDN | CustomerMSISDN | Status.Active |
  And I click on the "Product" tab
  And I click on " Edit " button in cite
  And I Add product "Minor Customers" in the organization of Sp portal
  And I enter text area "Remark" with value "For Automation Testing Purpose"
  Then I click on "GenericLocators.Submitbuttonincustomer"
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Product'"
  When I search for "Customer" with below details
  | TableId                  | TableValues    | SearchBy     | SearchValue    | Status        | CloseTheSearch |
  | Table.CustomerInIdentity | CustomerMSISDN | Label.MSISDN | CustomerMSISDN | Status.Active | Yes            |
  Then I report "SP Operator successfully added customer product"

@TC_FINLSO_REG_MARKET_SPOperatorSuccessfullyAbleToReverseTransactionInBulk!
Scenario: Business OP-Verify SP Operator is able to reverse transactions in a bulk
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Bulk" in the "Home" Page
  Then I click on menu "Bulk Task Plan"
  Then I wait "5"
  Then I click on "GenericLocators.CreateBulk"
  Then I wait "5"
  Then I select drop down "Bulk Type" with option "Bulk Transaction Reversal"
  Then I enter text in "Label.Plan Name" with value "BTR"
  Then I select the file to upload from "BULK_TRANSACTION_REVERSAL.CSV"
  Then I wait "30"
  Then I scroll "GenericLocators.ScrollTimeschedule" to view using "false" parameter
  Then I enter text area "Description" with value "Reason Description"
  Then I click on "Next Available Time Slot" radio
  Then I click on "Submit" button in cite
  Then I wait "2"
  When static text " View Detail >> " is visible
  Then I report "Task plan created successfully"
  Then I scroll page to top
  Then I click on " View Detail >> " to check
  Then I wait "3"
  Then I logout the "sp" portal and close the browser
  Then I report "SP Operator Successfully created Reverse Transaction Bulk Task plan"

@TC_FINLSO_REG_MARKET_BusinessOp-checkSSPOperatorcansuccessfullychangeorgproduct-whenthereisapendingbusinessoperationtaskagainsttheorg!
Scenario:Business Op-check SSP Operator can successfully change org product - when there is a pending business operation task against the org
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
  Then I Add product "B2C Business" in the organization of Sp portal
  Then I enter text area "Remark" with value "Test"
  Then I click on "GenericLocators.SubmitInorgpage"
  Then I click on "GenericLocators.SubmitEcep"
  Then I click on the "Product" tab
  Then I click on "Edit Product" button in cite
  Then I Add product "Stand Alone Agent" in the organization of Sp portal
  Then I enter text area "Remark" with value "Test"
  Then I click on "GenericLocators.SubmitInorgpage"
  Then I click on "GenericLocators.SubmitEcep"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Product"
  Then I report "Business Op-check SSP Operator can successfully change org product - when there is a pending business operation task against the org successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_WEB-Independantstore-OrganizationoperatorOverviewAccount!
Scenario: WEB - Independant store - Organization operator Overview Account
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on " View Detail " button in cite
  Then I close the current tab
  Then I report "WEB - Independant store - Organization operator Overview Account successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_CCBO-CompleteAuthorizedtransaction!
Scenario:CC BO - Complete Authorized Transaction
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I get value from label in " Receipt No.  " and store it in "transactionReceiptNum"
  Then I logout the "sp" portal and close the browser
  #Approve the Transaction
  Given I login to Fintech as "spcc-bo" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Approve"
  When static text "Transaction approved successfully." is visible
  Then I report "CC BO - approved Authorized transaction Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_Web-IndependentStore_IndependentAgentDeposittoSuspendedCustomer!
Scenario:Web - Independent Store_ Independent Agent Deposit to Suspended Customer
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer3 | Label.MSISDN | Customer.Registered_Customer3 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Suspended"
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "orgAgencyIndep" operator
  Then I initiate transaction with below details
  | Transaction_Services                 | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount        | Reason             |
  | TransactionServices.Customer Deposit | MSISDN                           | Customer.Registered_Customer3 | Amount.Normal | Reason Description |
  Then I report "Web - Independent Store Is Able to deposit Independent Agent  to Suspended Customer"
  Then I logout the "org" portal and close the browser
  #Post-Requisite
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer3 | Label.MSISDN | Customer.Registered_Customer3 | Status.Active |
  Then I edit Identity Status in "Customer" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_Exception_CancelTransactionWhenApprove!
Scenario:FS_Exception_Cancel Transaction When Approve
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Control Account Transfer" in the "Home" Page
  Then I enter text in "Label.Amount($)" with value "Amount.Minimum"
  Then I select drop down "From" with option "Control Account \ 1010000800000100010001426"
  Then I click on "GenericLocators.operationValue"
  Then I wait "10"
  Then I click on "GenericLocators.Control Account"
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Control account transfer submitted successfully." is visible
  #Approve The Transaction
  Then I click on left child menu "Approve Finance Transactions" in the "Home" Page
  Then I select drop down "Transaction Type" with option "Control Account Transfer"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ApproveCheckbox"
  Then I click on "Cancel" radio
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Finance transaction cancelled successfully." is visible
  # Then I verify Portal Log with below details
  # | Table                      | Log                      | Tablevalue  | Sp  |
  # | Table.CustomercareIdentity | Reconciliation Audit Log | Take a Call | Yes |
  Then I report "FS_Exception_Cancel Transaction When Approve Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FSExceptionCancelAndReverseOriginalTransactionAfterApprove!
#Issuse With Cancel Finance Transactions
Scenario:FS_Exception_Cancel and Reverse Original Transaction After Approve
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
  #Cancel The Transaction
  Then I click on left child menu "Cancel Finance Transactions" in the "Home" Page
  Then I select drop down "Transaction Type" with option "Transfer to M-PESA Control Account"
  Then I click on " Search " button in cite
  Then I click on "GenericLocators.ApproveCheckbox"
  Then I click on "Reverse Trade Order(Original Transaction)" radio
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Finance transaction cancelled successfully." is visible
  # Then I verify Portal Log with below details
  # | Table                      | Log                      | Tablevalue  | Sp  |
  # | Table.CustomercareIdentity | Reconciliation Audit Log | Take a Call | Yes |
  Then I report "FS_Exception_Cancel and Reverse Original Transaction After Approve Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_Exception_CancelandReverseOriginalTransactionWhenApprove!
Scenario:FS_Exception_Cancel and Reverse Original Transaction When Approve
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
  Then I click on "Cancel" radio
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Finance transaction cancelled successfully." is visible
  # Then I verify Portal Log with below details
  # | Table                      | Log                      | Tablevalue  | Sp  |
  # | Table.CustomercareIdentity | Reconciliation Audit Log | Take a Call | Yes |
  Then I report "FS_Exception_Cancel and Reverse Original Transaction When Approve Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_FS_Exception_CancelandNotReverseOriginalTransactionWhenApprove!
Scenario:FS_Exception_Cancel and Not Reverse Original Transaction When Approve
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
  # Then I verify Portal Log with below details
  # | Table                      | Log                      | Tablevalue  | Sp  |
  # | Table.CustomercareIdentity | Reconciliation Audit Log | Take a Call | Yes |
  Then I report "FS_Exception_Cancel and Not Reverse Original Transaction When Approve Successfully "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_SPOperatorCloseOrganizationWhichHasFunds-Exception!
Scenario: Business OP-Verify that SP Operator can successfully change Organization status - to closed when account has funds
  Given I login to Fintech as "sp" operator
  When I close "CloseOrganization" with below details
  | TableId                 | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.CloseOrganization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I click on "GenericLocators.SubmitChangeStatusCustomer"
  When static text "Message.CloseOrganizationWithFundsErrorMessage" is visible
  Then I click on "GenericLocators.Confirm"
  Then I click on "GenericLocators.CancelButton"
  Then I logout the "sp" portal and close the browser
  Then I report "Successfully received error message when SP Operator Closes Organization which has funds"

@TC_FINLSO_REG_MARKET_BusinessOp-SPOperatorcansuccessfullycreateGroup!
Scenario: Business Op-SP Operator can successfully create Group
  Given I login to Fintech as "sp" operator
  Given I generate name "GroupName" with value "Group_RAND_3"
  Given I generate name "FirstName" with value "Auto"
  Given I generate name "LasttName" with value "Test"
  Given I generate name "Address" with value "RAND_10"
  Given I generate name "ContactMSISDN" with value "RAND_11"
  Given I generate name "GroupContactIDNumber" with value "RAND_6"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Group "
  Then I Add product "Child Group Saving Product" in the organization of Sp portal
  Then I enter text for "GenericLocators.GroupName" with value "GroupName"
  Then I scroll "GenericLocators.LastName1" to view using "false" parameter
  Then I enter text for "GenericLocators.FirstName" with value "FirstName"
  Then I enter text for "GenericLocators.LastName1" with value "LasttName"
  Then I select drop down "Group Category" with option "Large"
  Then I enter text for "GenericLocators.AddressLine1" with value "Address"
  Then I enter text for "GenericLocators.FirstName1" with value "FirstName"
  Then I enter text for "GenericLocators.LastName2" with value "LasttName"
  Then I click on "GenericLocators.operationValue"
  Then I click on "GenericLocators.GroupContactIDOption"
  Then I enter text for "GenericLocators.GroupContactIDNumber" with value "GroupContactIDNumber"
  Then I enter text for "GenericLocators.ContactMSISDN" with value "ContactMSISDN"
  Then I enter text for "GenericLocators.FirstName2" with value "FirstName"
  Then I enter text for "GenericLocators.LastName3" with value "LasttName"
  Then I click on "GenericLocators.SubAgentExpansionModel"
  Then I click on "GenericLocators.GroupContactIDOption1"
  Then I enter text for "GenericLocators.GroupContactIDNumber1" with value "GroupContactIDNumber"
  Then I enter text for "GenericLocators.ContactMSISDN1" with value "ContactMSISDN"
  Then I enter text for "GenericLocators.FirstName3" with value "FirstName"
  Then I enter text for "GenericLocators.LastName4" with value "LasttName"
  Then I click on "GenericLocators.GroupContactID"
  Then I click on "GenericLocators.GroupContactIDOption2"
  Then I enter text for "GenericLocators.GroupContactIDNumber2" with value "GroupContactIDNumber"
  Then I enter text for "GenericLocators.ContactMSISDN2" with value "ContactMSISDN"
  Then I click on "Next" button in cite
  Then I enter text for "GenericLocators.MSISDN1" with value "Customer.Registered_Customer1"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  Then I click on "View Detail" to check
  Then I report "SP Operator successfully create Group via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOp-SPOperatorcansuccessfullycreategroupsavingsforcustomer!
Scenario: Business Op-SP Operator can successfully create group savings for customer
  Given I login to Fintech as "sp" operator
  Given I generate name "GroupName" with value "Group_RAND_3"
  Given I generate name "FirstName" with value "Auto"
  Given I generate name "LasttName" with value "Test"
  Given I generate name "Address" with value "RAND_10"
  Given I generate name "ContactMSISDN" with value "RAND_11"
  Given I generate name "GroupContactIDNumber" with value "RAND_6"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Group "
  Then I Add product "Group Saving Product" in the organization of Sp portal
  Then I enter text for "GenericLocators.GroupName" with value "GroupName"
  Then I scroll "GenericLocators.LastName1" to view using "false" parameter
  Then I enter text for "GenericLocators.FirstName" with value "FirstName"
  Then I enter text for "GenericLocators.LastName1" with value "LasttName"
  Then I select drop down "Group Category" with option "Large"
  Then I enter text for "GenericLocators.AddressLine1" with value "Address"
  Then I enter text for "GenericLocators.FirstName1" with value "FirstName"
  Then I enter text for "GenericLocators.LastName2" with value "LasttName"
  Then I click on "GenericLocators.operationValue"
  Then I click on "GenericLocators.GroupContactIDOption"
  Then I enter text for "GenericLocators.GroupContactIDNumber" with value "GroupContactIDNumber"
  Then I enter text for "GenericLocators.ContactMSISDN" with value "ContactMSISDN"
  Then I enter text for "GenericLocators.FirstName2" with value "FirstName"
  Then I enter text for "GenericLocators.LastName3" with value "LasttName"
  Then I click on "GenericLocators.SubAgentExpansionModel"
  Then I click on "GenericLocators.GroupContactIDOption1"
  Then I enter text for "GenericLocators.GroupContactIDNumber1" with value "GroupContactIDNumber"
  Then I enter text for "GenericLocators.ContactMSISDN1" with value "ContactMSISDN"
  Then I enter text for "GenericLocators.FirstName3" with value "FirstName"
  Then I enter text for "GenericLocators.LastName4" with value "LasttName"
  Then I click on "GenericLocators.GroupContactID"
  Then I click on "GenericLocators.GroupContactIDOption2"
  Then I enter text for "GenericLocators.GroupContactIDNumber2" with value "GroupContactIDNumber"
  Then I enter text for "GenericLocators.ContactMSISDN2" with value "ContactMSISDN"
  Then I click on "Next" button in cite
  Then I enter text for "GenericLocators.MSISDN1" with value "Customer.Registered_Customer1"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  Then I click on "View Detail" to check
  Then I report "SP Operator successfully create group savings for customer via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_WebTopOrg_AgencyStorelinkedToItsOwnToporg,depositIntoTheIndependentAgentAccountViaWeb!
Scenario:Web - Top Org_Agency store linked to its own top org, deposit into the independent Agent Account via web
  Given I login to Fintech as "orgAgencystore" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                 | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.Organization Funds Management - Business Deposit | Short Code                       | ShortCode.AgencyIndep          | Amount.Minimum1 | Reason Description |
  Then I report "Web-Top Org_Agency store linked to its own top org, deposit into the independent Agent Account via web Successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_WebTopOrgAgencyStorelinkedToCentrallyOwnedHOdepositToCustomerViaWebSuccess!
Scenario:Web -Top Org _ Agency Store linked to Centrally Owned HO deposit to customer via web- success
  Given I login to Fintech as "orgAgencystore" operator
  Then I initiate transaction with below details
  | Transaction_Services                 | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount         | Reason             |
  | TransactionServices.Customer Deposit | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum | Reason Description |
  Then I report "Web -Top Org _ Agency Store linked to Centrally Owned HO can deposit to customer via web Successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-VerifySPOperatorIsUnableToReverseTransactionWithInsufficientFunds!
Scenario:Business OP-Verify SP Operator is unable to reverse transaction with insufficient funds
  Given I login to Fintech as "org" operator
  Given I generate name "Amount" with value "Amount.Maximum"
  Given I generate name "TillNumber" with value "Handset.Till.Number"
  Given I generate name "ReferenceId" with value "TEST"
  #Initiating Transaction from Customer to organization
  Then I initiate transaction with below details
  | Transaction_Services                                         | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount         | Reason             |
  | TransactionServices.Organization Advance Payment to Customer | MSISDN                           | Customer.Registered_Customer1 | Amount.Maximum | Reason Description |
  Then I get value from label in " Receipt No.  " and store it in "transactionReceiptNum"
  Then I click on "Approve" radio
  Then I enter text area for "GenericLocators.Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I wait "5"
  Then I logout the "org" portal and close the browser
  #Customer Pay Merchant
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Merchant" Service for "Handset.RegisteredCustomerThree"
  #Reverse the Transaction using Back office Role
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer3 | Label.MSISDN | Customer.Registered_Customer3 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Reverse"
  Then I logout the "sp" portal and close the browser
  #Post condition
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                                     | Reason_Type                                     | Amount          | Reason             |
  | TransactionServices.BusinessTransfersfromMerchantaccount | Transfer from Merchant Account to Mpesa Account | Amount.Minimum1 | Reason Description |
  Then I logout the "org" portal and close the browser

@TC_FINLSO_REG_MARKET_SearchIMTtransactionviaOrganizationPage!
Scenario: Search IMT transaction via Organization Page
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "TransactionServices.InternationalMoneyTransfertoCustomer"
  Then I report "Search IMT transaction via Organization Page web Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_IMTtoregisteredcustomer-successful!
#Pending Issuse
Scenario: IMT to registered customer - successful.
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                                     | Primary_Identifier_Account_Type                | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.InternationalMoneyTransfertoCustomer | Default Account (Utility Disbursement Account) | MSISDN                           | Customer.Registered_Customer2 | Amount.Minimum1 | Reason Description |
  Then I get value from label in " Receipt No.  " and store it in "transactionReceiptNum"
  Then I report "IMT to registered customer - successful"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOPVerifythatSPOperatorcansuccessfullychangeOrganizationstatustoclosed!
Scenario:Business OP-Verify that SP Operator can successfully change Organization status - to closed
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product     | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration |
  | Super Agent | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             |
  When I close "CloseOrganization" with below details
  | TableId                 | TableValues | SearchBy                      | SearchValue | Status        |
  | Table.CloseOrganization | ShortCode   | Label.Organization Short Code | ShortCode   | Status.Active |
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "Business OP-Verify that SP Operator can successfully change Organization status to closed "
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_BusinessOP-VerifythatSPOperatorcansuccessfullychangeOrganizationstatus-tofrozen!
Scenario: Business OP-Verify that SP Operator can successfully change Organization status - to frozen
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser
  #Post Requisite
  Given I login to Fintech as "spBackoff" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I report "Business OP-Verify that SP Operator can successfully change Organization status - to frozen"
  Then I logout the "sp" portal and close the browser