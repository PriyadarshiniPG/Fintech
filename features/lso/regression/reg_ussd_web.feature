@FINLSO_GP_USSDWEB
Feature: Fintech2.0 Gptc USSD Web feature

@TC_FINLSO_SuspendedCustomerDeleteBeneficiary!
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
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status'"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerRejectedSuspended" on "Handset.RegisteredCustomer"
  Then I edit Identity Status of customer with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status'"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" on "Handset.RegisteredCustomer"
  Then I report "The Suspended Customer can't delete beneficiary"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CustomerDeleteRegCustomerBeneficiary!
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

@TC_FINLSO_ExceptionTheMaxBeneficiaryNumberReached!
# Pending - Execution
Scenario: Exception - The Max Beneficiary Number Reached
  Given I generate name "BeneficiaryTopOrg" with value "Beneiciary.TopOrganization.ShortCode"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerException" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select drop down "Initiator Type" with option "DropDown.Customer"
  Then I enter text in "Label.Customer" with value "Customer.Registered_Customer_Active"
  Then I select drop down "Event" with option "DropDown.AddBeneficiary"
  Then I click on a "Search"
  Then I report "Customer can't add beneficiary more than the Maximum limit"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_TheOrganizationNotActive!
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

@TC_FINLSO_ExceptionTheShortCodeNotExist!
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

@TC_FINLSO_SendMoneyToUnregCustomer!
# Pending - Execution
Scenario: Send Money to Unregister Customer
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.SendMoneyToUnregCustWithCorrectPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.SendMoneyCompleted" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Transactions" in the "Home" Page
  Then I click on left child menu "Search by Receipt No" in the "Home" Page
  Then I enter text in "Label.ReceiptNo" with value "Customer.Registered_Customer_Active"
  Then I click on a "Search"
  Then I check table "Table.ReceiptNo" with multiple values as "Customer.Registered_Customer_Active" and store "TableList.ReceiptNo.StatusColNum" column value in "receiptStatus"
  Then I check value of "receiptStatus" is "Completed"
  Then I report "E-money is debited from the initiator customer account and credited to the receiver customer account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SendMoneyToRegCustomer!
# Pending - Execution
Scenario: Send Money to Register Customer
  Given I generate name "ReceipientMobNo" with value "Receipient.MobileNumber"
  Given I generate name "SendMoneyAmount" with value "Handset.SendMoneyTransactionAmount"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.SendMoneyToRegCustWithCorrectPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.SendMoneyCompleted" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Transactions" in the "Home" Page
  Then I click on left child menu "Search by Receipt No" in the "Home" Page
  Then I enter text in "Label.ReceiptNo" with value "Customer.Registered_Customer_Active"
  Then I click on a "Search"
  Then I check table "Table.ReceiptNo" with multiple values as "Customer.Registered_Customer_Active" and store "TableList.ReceiptNo.StatusColNum" column value in "receiptStatus"
  Then I check value of "receiptStatus" is "Completed"
  Then I report "E-money is debited from the initiator customer account and credited to the receiver customer account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CustAddOrgBeneficiaryViaUSSD!
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

@TC_FINLSO_ExceptionReceiverAlreadyExistInBeneficiaryList!
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

@TC_FINLSO_AddUnregCustomerBeneficiary!
# Pending - Can't able to create unregistered customer, since unregistered product is not available
Scenario: Add Unregistered Customer Beneficiary
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddUnregCustomer" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddUnregCustomerAccepted" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select drop down "Initiator Type" with option "DropDown.Customer"
  Then I enter text in "Label.Customer" with value "Customer.Registered_Customer_Active"
  Then I select drop down "Event" with option "DropDown.AddBeneficiary"
  Then I click on a "Search"
  Then I report "Customer can add Unregistered Customer Beneficiary"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CustAddRegCustBeneficiaryViaUSSD!
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

@TC_FINLSO_CusUnableTopUpOthers!
Scenario: CSTL-2145, 2140 Attempt that registered customer is unable to top up others Airtime, When Initiator PIN change is in pending status
  Given I generate name "NewPin" with value "RAND_6"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                         | SearchBy     | SearchValue                         | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer_Active | Label.MSISDN | Customer.Registered_Customer_Active | Status.Active |
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitResetForCustomer"
  When static text "Reset PIN SUCCESS" is visible
  Then I logout the "sp" portal and close the browser
  Then I get the value of initial pin from "Handset.RegisteredCustomer" for sms "Messages.ResetPinGenerated" and store in "PinGenerated"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  Then I check whether the "Purchase Airtime" menu is not available in the handset
  When I select "Customer.ResetPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.ResetPinConfirmed" on "Handset.RegisteredCustomer"
  Then I replace the "Handset.RegisteredCustomer.PIN" key value with "NewPin" in the "fin_handset_testdata" json file
  Then I report "The Registered customer is unable to top up others Airtime, When Initiator PIN change is in pending status"

@TC_FINLSO_CusUnableToBuyAirTimeForSelfCredLocked!
Scenario: CSTL-2035 Customer Airtime Top-up - Attempt that registered user is unable to top up his/her Airtime self, When Initiator PIN is Locked
  Given I generate name "WrongPin" with value "RAND_5"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I generate name "NewPin" with value "RAND_6"
  Given I generate name "AirtimeAmount" with value "Handset.TransactionAmount"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CheckBalanceWrongPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.CredentialLockFirstWarning" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CheckBalanceWrongPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.CredentialLockSecondWarning" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CheckBalanceWrongPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.CredentialLockedConfirmed" on "Handset.RegisteredCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.BuyAirTimeForSelf" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.CredentialLockedConfirmed" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                         | SearchBy     | SearchValue                         | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer_Active | Label.MSISDN | Customer.Registered_Customer_Active | Status.Active |
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.UnlockPin"
  Then I enter text area "Reason" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitUnlockForCustomer"
  Then I logout the "sp" portal and close the browser
  Then I get the value of initial pin from "Handset.RegisteredCustomer" for sms "Messages.ResetPinGenerated" and store in "PinGenerated"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.ResetPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.ResetPinConfirmed" on "Handset.RegisteredCustomer"
  Then I replace the "Handset.RegisteredCustomer.PIN" key value with "NewPin" in the "fin_handset_testdata" json file
  Then I report "The Registered user is unable to top up his/her Airtime self, When Initiator PIN is Locked"

@TC_FINLSO_CusUnableBuyAirTimeOthersRecIdStatusInvalid!
Scenario: CSTL-2029 Customer Airtime Top-up - Attempt that registered user is unable to top-up his/her Airtime self, when Receiver Identity Status is Invalid
  # Pending - sms not coming
  Given I generate name "TillMsisdn" with value "Handset.Till.MSISDN"
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues         | Query Condition | SearchBy     | SearchValue         | Status        |
  | Table.Till | Handset.Till.MSISDN | MSISDN          | Label.MSISDN | Handset.Till.MSISDN | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I logout the "sp" portal and close the browser
  Given I generate name "AirtimeAmount" with value "Handset.TransactionAmount"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.BuyAirTimeForOthers" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.BuyAirTimeForOthersRecInvalid" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues         | Query Condition | SearchBy     | SearchValue         | Status        |
  | Table.Till | Handset.Till.MSISDN | MSISDN          | Label.MSISDN | Handset.Till.MSISDN | Status.Active |
  Then I edit Identity Status in "Till" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CusUnableBuyAirTimeSelfInitiatorStatusInvalid!
Scenario: CSTL-2027 Customer Airtime Top-up - Attempt that registered user is unable to top-up his/her Airtime self, when Initiator Identity Status is Invalid
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                       | Query Condition | SearchBy     | SearchValue                       | Status        |
  | Table.CustomerInIdentity | Handset.RegisteredCustomer.MSISDN | Label.MSISDN    | Label.MSISDN | Handset.RegisteredCustomer.MSISDN | Status.Active |
  Then I edit Identity Status in "Customer" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status'"
  Then I logout the "sp" portal and close the browser
  Given I generate name "AirtimeAmount" with value "Handset.TransactionAmount"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.BuyAirTimeForSelf" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.BuyAirTimeForSelfRecInvalid" on "Handset.RegisteredCustomer"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                       | Query Condition | SearchBy     | SearchValue                       | Status           |
  | Table.CustomerInIdentity | Handset.RegisteredCustomer.MSISDN | Label.MSISDN    | Label.MSISDN | Handset.RegisteredCustomer.MSISDN | Status.Suspended |
  Then I edit Identity Status in "Customer" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Customer Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CustomerChangePIN!
Scenario: Customer Change PIN
  Given I generate name "NewPin" with value "RAND_6"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                         | SearchBy     | SearchValue                         | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer_Active | Label.MSISDN | Customer.Registered_Customer_Active | Status.Active |
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitResetForCustomer"
  When static text "Reset PIN SUCCESS" is visible
  Then I logout the "sp" portal and close the browser
  Then I get the value of initial pin from "Handset.RegisteredCustomer" for sms "Messages.ResetPinGenerated" and store in "PinGenerated"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.ResetPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.ResetPinConfirmed" on "Handset.RegisteredCustomer"
  Then I replace the "Handset.RegisteredCustomer.PIN" key value with "NewPin" in the "fin_handset_testdata" json file
  Then I report "The Registered customer pin is been changed."

@TC_FINLSO_CustomerViewMiniStatement!
Scenario: Customer View Mini Statement