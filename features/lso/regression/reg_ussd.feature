@FINLSO_GP_USSD


Feature: Fintech2.0 Gptc USSD feature

@TC_FINLSO_ExceptionPINIncorrectToDeleteBeneficiary!
Scenario: Registered customers to delete the beneficiary from list using their own handsets. But if the validation is failed, the operation will be cancelled.
  Given I generate name "BeneficiaryMSISDN" with value "Beneficiary.RegisteredCustomer.MSISDN"
  Given I generate name "WrongPin" with value "RAND_5"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.DeleteBeneficiary" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerRejected" on "Handset.RegisteredCustomer"
  Then I report "The operation will be cancelled and Registered customer can't delete the beneficiary from list using their own handsets, if the wrong pin is been entered."

@TC_FINLSO_CustomerDeleteOrganizationBeneficiary!
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

@TC_FINLSO_ExceptionPINIncorrectToAddBeneficiary!
Scenario: Customer Can't Add Beneficiary using Incorrect PIN
  Given I generate name "BeneficiaryMSISDN" with value "Beneficiary.RegisteredCustomer.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "Beneficiary.RegisteredCustomer.Name"
  Given I generate name "WrongPin" with value "RAND_5"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AddBeneficiaryCustomerWrongPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerRejected" on "Handset.RegisteredCustomer"
  Then I report "Customer Can't Add Beneficiary using Incorrect PIN"

@TC_FINLSO_CustomerDeleteUnregCusBeneficiary!
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

@TC_FINLSO_ExceptionPINIncorrect!
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

@TC_FINLSO_ChangeTillLangExpIncorrectPin!
# Pending - Message is not coming in handset and record not found in audit log also
Scenario: Exception - Change Till Language via USSD Incorrect PIN
  Given I generate name "LanguagePrefered" with value "Handset.Till.LanguagePrefered"
  Given I generate name "WrongPin" with value "RAND_5"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.ChangeTillLanguageIncorrectPin" Service for "Handset.Till"
  Then I validate message "Messages.ChangeTillLanguageRejected" on "Handset.Till"
  Then I report "The Till Language can't be changed via USSD using Incorrect PIN"

@TC_FINLSO_AirtimeToMpesaFromBankEnterAllDetails!
# Pending - Execution
Scenario: Premium Card to Wallet - To Perform airtime to M-pesa by entering all valid details
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AirtimeToMpesaFromBank" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AirtimeToMpesaFromBankAccepted" on "Handset.RegisteredCustomer"

@TC_FINLSO_AirtimeToMpesaEnterAllDetails!
# Pending - Execution
Scenario: Premium Airtime To M-pesa - To Perform airtime to M-pesa by entering all valid details
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.AirtimeToMpesa" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AirtimeToMpesaAccepted" on "Handset.RegisteredCustomer"

@TC_FINLSO_CusPayMerchantPendingActiveAccExp!
# Pending - Required Customer Pay Bill product and funding not available
Scenario: Premium Exception - Customer Pay Merchant of Pending Active Account
  Given I generate name "TillNumber" with value "Handset.Till.Number"
  Given I generate name "Amount" with value "Handset.TransactionAmount"
  Given I generate name "ReferenceName" with value "Handset.Till.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CustomerPayMerchantPendingActive" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AirtimeToMpesaAccepted" on "Handset.RegisteredCustomer"

@TC_FINLSO_CusPayMerchantClosedAccExp!
# Pending - Required Customer Pay Bill product and funding not available
Scenario: Premium Exception - Customer Pay Merchant of closed account
  Given I generate name "TillNumber" with value "Handset.Till.Number"
  Given I generate name "Amount" with value "Handset.TransactionAmount"
  Given I generate name "ReferenceName" with value "Handset.Till.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CustomerPayMerchantClosed" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AirtimeToMpesaAccepted" on "Handset.RegisteredCustomer"

@TC_FINLSO_CusPayMerchantDormantAccExp!
# Pending - Required Customer Pay Bill product and funding not available
Scenario: Premium Exception - Customer Pay Merchant of closed account
  Given I generate name "TillNumber" with value "Handset.Till.Number"
  Given I generate name "Amount" with value "Handset.TransactionAmount"
  Given I generate name "ReferenceName" with value "Handset.Till.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CustomerPayMerchantDormant" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.AirtimeToMpesaAccepted" on "Handset.RegisteredCustomer"

@TC_FINLSO_CusAbleToBuyAirTimeOthers!
# Pending - Top up for others is under process
Scenario: CSTL-2134 Customer Airtime Top-up - Ensure that as a registered customer is able to buy Airtime for other's Via USSD successfully
  Given I generate name "TillMsisdn" with value "Handset.Till.MSISDN"
  Given I generate name "AirtimeAmount" with value "Handset.TransactionAmount"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.BuyAirTimeForOthers" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.BuyAirTimeForOthersConfirmed" on "Handset.RegisteredCustomer"

@TC_FINLSO_CusUnableBuyAirTimeSelf!
# Pending - Top up for self is under process
Scenario: CSTL-2129 Customer Airtime Top-up - Ensure that registered Customer is able to buy Airtime for self via USSD successfully
  Given I generate name "AirtimeAmount" with value "Handset.TransactionAmount"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.BuyAirTimeForSelf" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.BuyAirTimeForSelfConfirmed" on "Handset.RegisteredCustomer"

@TC_FINLSO_CusUnableBuyAirTimeSelfIncorrectPin!
# Pending - sms content is wrong
Scenario: CSTL-2033 Customer Airtime Top-up - Attempt that registered user is unable to top-up his/her Airtime top-up self, when Initiator tries with Incorrect PIN
  Given I generate name "AirtimeAmount" with value "Handset.TransactionAmount"
  Given I generate name "WrongPin" with value "RAND_5"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.BuyAirTimeForSelfWrongPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.CredentialLockFirstWarning" on "Handset.RegisteredCustomer"

@TC_FINLSO_CusUnableBuyAirTimeSelfInsufficientBal!
Scenario: CSTL-2031 Customer Airtime Top-up - Attempt that registered user is unable to top-up his/her Airtime self, When Initiator Account Balance is Insufficient
  Given I generate name "AirtimeAmount" with value "Handset.MaxTransactionAmount"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.BuyAirTimeForSelf" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.BuyAirTimeForSelfInsuffBal" on "Handset.RegisteredCustomer"

@TC_FINLSO_CusCantDepCashIfOrgInsuffBal!
Scenario: CSTL-2212 - Attempt that registered customer cannot deposits cash to E-Money account of customer through an agent via USSD, If the organization has insufficient balance

@TC_FINLSO_CusCantDepCashIfOrgEntersAmtWrongFormat!
# Pending - no deposit menu are available
Scenario: CSTL-2211 - Attempt that registered customer cannot deposits cash to E-Money account of customer through an agent via USSD, If initiator tries with the No formatted amount
  Given I generate name "Amount" with value "!@#$%^"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CustomerDepositCashToItsAccountThroughOrganization" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.CustomerDepositCashToItsAccountThroughOrganizationNotAccepted" on "Handset.RegisteredCustomer"

@TC_FINLSO_CustomerViewBalance!
Scenario: CSTL-2417 - Verify that the customer can view their balance
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CustomerViewBalance" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.CustomerBalance" on "Handset.RegisteredCustomer"

@TC_FINLSO_CustomerViewMiniStatement!
Scenario: CSTL-2418 - Customer View Mini Statement
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CustomerViewMiniStatement" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.MiniStatement" on "Handset.RegisteredCustomer"

@TC_FINLSO_SendMoneyToInvalidMsisdn!
Scenario: CSTL-2419 - Send Money to Invalid MSISDN
  Given I generate name "ReceipientMobNo" with value "266585_RAND_5"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"
  Given I generate name "SendMoneyAmount" with value "RAND_2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.SendMoneyToRegCustWithCorrectPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.SendMoneyToInvalidMsisdn" on "Handset.RegisteredCustomer"

@TC_FINLSO_SendMoneyToRegCusInsuffFunds!
# Pending - Need to complete
Scenario: Send Money to Registered MSISDN with insufficient funds
  Given I generate name "ReceipientMobNo" with value "Receipient.MobileNumber"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomer.PIN"

  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.CustomerViewBalance" Service for "Handset.RegisteredCustomer"
  Then I get the balance from "Handset.RegisteredCustomer" for sms "Messages.ResetPinGenerated" and store in "PinGenerated"

  Given I generate name "SendMoneyAmount" with value "RAND_2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomer"
  When I select "Customer.SendMoneyToRegCustWithCorrectPin" Service for "Handset.RegisteredCustomer"
  Then I validate message "Messages.SendMoneyToInvalidMsisdn" on "Handset.RegisteredCustomer"