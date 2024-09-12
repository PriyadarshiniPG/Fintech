@FINLSO_REG_MARKET_USSD!
Feature: Fintech2.0 Regression Market USSD feature

@TC_FINLSO_REG_MARKET_USSD_SuperAgentInternalTransfer_MPesa-Float_SufficientFunds!
Scenario: Top ORG_ Super Agent Internal Transfer - from M-Pesa to Float (sufficient Funds)
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.TransferFromWorkingToFloat" Service for "Handset.Till"
  Then I validate message "Messages.InternalTransfer_MpesaToFloat" from "USSD.Sender" on "Handset.Till"
  Then I report "SUCCESS : Super agent Organisation transfer funds from M-pesa account to Float account"

@TC_FINLSO_REG_MARKET_USSD_SuperAgentInternalTransfer_MPesa-Float_InsufficientFunds!
Scenario: Top ORG_ Super Agent Internal Transfer - from M-Pesa to Float (Insufficient Funds)
  Given I generate name "EnterAmount" with value "Amount.Limit10000"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.TransferFromWorkingToFloat" Service for "Handset.Till"
  Then I validate message "Messages.InsufficientFund_InternalTransfer" from "USSD.Sender" on "Handset.Till"
  Then I report "SUCCESS : Super agent Organisation not able to transfer funds with Insufficient funds"

@TC_FINLSO_REG_MARKET_USSD_SuperAgentMoveMoneyFromFloatToWorkingAccount!
Scenario: Top ORG_ Internal Transfer - Super Agent move money from Float to M-Pesa successfully
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.InternalTransfer_FloatToMpesa" Service for "Handset.Till"
  Then I validate message "Messages.InternalTransfer_FloatToMpesa" from "USSD.Sender" on "Handset.Till"
  Then I report "SUCCESS : Super Agent move money from Float to M-Pesa successfully"

@TC_FINLSO_REG_MARKET_USSD_SuperAgentMoveMoneyFromFloatToWorkingAccount_InsufficientFunds!
Scenario: Top ORG_ Super Agent Internal Transfer - from Float to M-Pesa (Insufficient Funds)
  Given I generate name "EnterAmount" with value "Amount.Limit10000"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.InternalTransfer_FloatToMpesa" Service for "Handset.Till"
  Then I validate message "Messages.InsufficientFund_InternalTransfer" from "USSD.Sender" on "Handset.Till"
  Then I report "SUCCESS : Super Agent not able to move money from Float to M-Pesa with Insufficient funds"

@TC_FINLSO_REG_MARKET_USSD_SuperAgentSuccessfullyDepositToCustomer_Exception!
Scenario: Top ORG_ Super Agent successfully Deposit to Customer (Exception)
  Given I generate name "ReceipientMobNo" with value "EXclude266"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit to customer" Service for "Handset.Till"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues | SearchBy     | SearchValue | Status        |
  | Table.CustomerInIdentity | EXclude266  | Label.MSISDN | EXclude266  | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Complete"
  #Verify SMS
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "Super Agent Successfully Deposit To Customer"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_USSD_AgentAbleToBalanceEnquiry_FloatAccount!
Scenario: Top ORG_Super Agent View Balance - (Float Account)
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_FloatAccount" Service for "Handset.Till"
  Then I validate message "Messages.BalanceEnquiry_FloatAccount" from "USSD.Sender" on "Handset.Till"

@TC_FINLSO_REG_MARKET_USSD_AgentAbleToBalanceEnquiry_MPesaAccount!
Scenario: Top ORG_ Super Agent View Balance - (M-Pesa Account)
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_MPesaAccount" Service for "Handset.Till"
  Then I validate message "Messages.BalanceEnquiry_MPesaAccount" from "USSD.Sender" on "Handset.Till"

@TC_FINLSO_REG_MARKET_USSD_PremiumPayWascotoSecondarywalletSuccess!
Scenario: Premium_Pay for WASCO with a valid account number and all systems connected Through Secondary Wallet_Pay for WASCO using valid account number and all other prerequisites available
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAccountNumber" with value "WASCO Service Fees Disconnection Penalty"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Bill WASCO to Secondary Wallet" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Paid" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium Pay WASCO to a valid account munber thorugh secondary wallet was successful"

@TC_FINLSO_REG_MARKET_USSD_PremiumPayWascoSuccess!
Scenario:Premium_Pay for WASCO with a valid account number and all systems connected _Pay for WASCO using valid account number and all other prerequisites available
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAccountNumber" with value "WASCO Service Fees Disconnection Penalty"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Bill WASCO" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Paid" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium Pay WASCO to a valid account munber thorugh was successful"

@TC_FINLSO_REG_MARKET_USSD_PremiumPayWascotoSecondarywalletinvalidaccountnumber!
Scenario: Premium_Pay for WASCO with an Invalid Account Number through Secondary Wallet_Pay for WASCO using an invalid account Number
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAccountNumber" with value "WaterBill"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.WASCoSecondaryWalletWaterBill" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.IssueMessage" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.ShortCodeDoesNotExist" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium Pay WASCO to a invalid account munber thorugh secondary wallet Was successful by giving us a invalid error message"

@TC_FINLSO_REG_MARKET_USSD_PremiumPayWascotoinvalidaccountnumber!
Scenario: Premium_Pay for WASCO with an Invalid Account Number_Pay for WASCO using an invalid account Number
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAccountNumber" with value "WaterBill"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.PayBillWASCO_WATERBill" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.IssueMessage" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.ShortCodeDoesNotExist" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium Pay WASCO to a invalid account munber was successful by giving us a invalid error message"

@TC_FINLSO_REG_MARKET_USSD_IndependentStore_AgentDepositToAnotherAgent-Success!
Scenario:Independent Store_ Agent deposit to another agent - success
  Given I generate name "ShortCode" with value "ShortCode.AgencyIndep"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit To Another Agent" Service for "Handset.Till"
  Then I validate message "Messages.Deposit To Another Agent" from "USSD.Sender" on "Handset.Till"
  Then I report "Agent successfully deposited to another agent and verified notification."

@TC_FINLSO_REG_MARKET_USSD_IndependentStore_IndependentAgentDepositToAnotherAgentInsufficientFunds!
Scenario:Independent Store_ Independent Agent Deposit to another Agent (Insufficient Funds)(Exception)
  Given I generate name "ShortCode" with value "ShortCode.AgencyIndep"
  Given I generate name "Amount" with value "Amount.Limit100000"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit To Another Agent" Service for "Handset.Till"
  Then I validate message "Messages.InsufficientFund_InternalTransfer" from "USSD.Sender" on "Handset.Till"
  Then I report "Independent Agent deposited to another agent with insufficient funds throughs exception"

@TC_FINLSO_REG_MARKET_USSD_IndependentStore_IndependentAgentDepositToAnotherDormantAgent!
Scenario:Independent Store_ Independent Agent Deposit to another Dormant Agent(Exception)
  Given I generate name "ShortCode" with value "ShortCode.ShortCode10"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit To Another Agent" Service for "Handset.Till"
  Then I validate message "Messages.Deposit To Another Agent" from "USSD.Sender" on "Handset.Till"
  Then I report "Independent Agent deposited to another Dormant agent is Successful"

@TC_FINLSO_REG_MARKET_USSD_IndependantStoreOperatorisAbleToViewMiniStatement!
Scenario:Independant Store - Operator is able to view mini statement
  Given I generate name "EnterShortCode" with value "ShortCode.ShortCode1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Show Mini Statement" Service for "Handset.Till"
  Then I validate message "Messages.MiniStatement" from "USSD.Sender" on "Handset.Till"
  Then I report "Independant Store - Operator is able to view mini statement Successfully"

@TC_FINLSO_REG_MARKET_USSD_IndependentStore_AgentWithdrawalwithSufficientfunds-fromAnotherAgentSuccessfully!
Scenario:Independent Store_ Agent Withdrawal with sufficient funds - from Another Agent successfully
  Given I generate name "ShortCode" with value "ShortCode.AgencyIndep"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit To Another Agent" Service for "Handset.Till"
  Then I validate message "Messages.Deposit To Another Agent" from "USSD.Sender" on "Handset.Till"
  Then I report "Independent Store_ Agent Withdrawal with sufficient funds - from Another Agent successfully"

@TC_FINLSO_REG_MARKET_USSD_PremiumPayBusinesscustomerpayschoolfeesviaussd!
Scenario: Premium_Pay Business_customer pay school fees via ussd
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "TillNumber" with value "InsuranceTypes.PayschoolFee"
  Given I generate name "ReferenceId" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.PaySchoolFees" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaySchoolFees" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium Business Pay school fees is Completed Successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium_Bettingcustomerpaybettingviaussd!
Scenario: Premium_Betting_customer pay betting via ussd
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterMerchantShortCode" with value "InsuranceTypes.BettingShortCode"
  Given I generate name "Reference" with value "Automation Testing Purpose"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.CustomerPayBetting" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Customer is able to do betting transaction"

@TC_FINLSO_REG_MARKET_USSD_premium_LAA_payforLAAwithvalidleasenumber!
Scenario: premium_LAA_pay for LAA with valid lease number
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterLeaseNumber" with value "LAALeaseNumber"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Bill LAA" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Pay Bill LAA"

@TC_FINLSO_REG_MARKET_USSD_WASCOEnsurethesuccessfulpaymentofWASCOwhenallvaliddataisavailable!
Scenario: WASCO - Ensure the successful payment of WASCO when all valid data is available
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAccountNumber" with value "WASCO Service Fees Disconnection Penalty"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Bill WASCO" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Paid" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium Pay WASCO to a valid account munber thorugh was successful"

@TC_FINLSO_REG_MARKET_USSD_Premium_BuyAirtimeforSelfBuyAirtimeforself!
Scenario: Premium_Buy Airtime for Self_Buy Airtime for self
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.BuyAirTimeForSelf" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.BuyAirTimeForSelfConfirmed" on "Handset.RegisteredCustomerThree"
  Then I report "Permium Pay Buy Airtime for Self"

@TC_FINLSO_REG_MARKET_USSD_Premium_SendMoneytoFrozenMSISDNperformsendmoneybyenteringFrozenMSISDN!
Scenario: Premium_Send Money to a Frozen MSISDN_To perform send money by entering Frozen MSISDN
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer5"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.FrozenMessage" on "Handset.RegisteredCustomerThree"
  Then I report "Permium Pay Send Money to a Frozen MSISDN successful"

@TC_FINLSO_REG_MARKET_USSD_Premium_SendMoneytoClosedMSISDNperformsendmoneybyentering!
Scenario: Premium_Send Money to Closed MSISDN_To perform send money by entering Closed MSISDN
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.ClosedCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.ClosedMessage" on "Handset.RegisteredCustomerThree"
  Then I report "Permium Pay Send Money to a Closed MSISDN successful"

@TC_FINLSO_REG_MARKET_USSD_Premium_ChangePINChangingtheAlreadyregisteredPIN!
Scenario: Premium Change PIN Changing the Already registered PIN
  Given I generate name "NewPin" with value "RAND_4"
  Given I generate name "PinGenerated" with value "Handset.RegisteredCustomerThree.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.ResetPin" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.ResetPinConfirmed" on "Handset.RegisteredCustomerThree"
  Then I replace the "Handset.RegisteredCustomerThree.PIN" value with "NewPin" in the "fin_handset_testdata" json in folder "FolderLocation.Regression"
  Then I report "Premium customer can change its PIN"

@TC_FINLSO_REG_MARKET_USSD_TopORG_SuperAgentViewBalanceCommissionAccount!
Scenario:Top ORG_ Super Agent View Balance - (Commission Account)
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_CommissionAccount" Service for "Handset.Till"
  Then I validate message "Messages.BalanceEnquiry_CommissionAccount" from "USSD.Sender" on "Handset.Till"
  Then I report "Super Agent is able to View Balance - (Commission Account)"

@TC_FINLSO_REG_MARKET_USSD_Premium_MyAccountServices_Toperformchangelanguagetransactionsuccessfully!
Scenario: Premium_My Account Services_To perform change language transaction successfully.
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Change Language To Southern Sotho" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Kopo ea hao e netefalitsoe" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Change Language To English" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_My Account Services_To perform change language transaction successfully"

@TC_FINLSO_REG_MARKET_USSD_VerifyAddIndividualBeneficiaries!
Scenario: Premium_My Account Services_Add Individual beneficiaries
  #Add beneficiary from USSD
  Given I generate name "BeneficiaryMSISDN" with value "Handset.RegisteredCustomerThree.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.AddBeneficiaryCustomerAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  #Delete beneficiary from USSD
  Then I join two values "BeneficiaryMSISDN" and "BeneficiaryMSISDNName" with separator " " store in "BeneficiaryMSISDNName"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Customer add registered customer as beneficary Successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium_ViewingMiniStatementWithRelevantDetails!
Scenario: Premium_View MINI Statement_Viewing the mini statement with relevant details
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomerThree.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.CustomerViewMiniStatement" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.MiniStatement" on "Handset.RegisteredCustomerThree"

@TC_FINLSO_REG_MARKET_USSD_SendingMoneyToInvalidMSISDN!
Scenario: Premium_Send Money to Invalid MSISDN_Sending money to MSISDN that does not exist
  Given I generate name "IncorrectMSISDN" with value "123456789"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.SendMoney_IncorrectMSISDN" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.SendMoneyToInvalidMsisdn" on "Handset.RegisteredCustomerThree"
  Then I report "Successfully received error message for IncorrectMSISDN"

@TC_FINLSO_REG_MARKET_USSD_C2BUSSDExceptionMerchanttriestochangePINusingblacklistedPINS!
Scenario: C2B_USSD- Exception -Merchant tries to change PIN using blacklisted PINS e.g. 0000,1111,1234,etc
  Given I generate name "EnterBlackListedPin" with value "1111"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.ChangePin" Service for "Handset.Till"
  Then I validate message "Messages.Blacklisted" on "Handset.Till"
  Then I report "Merchant can not change PIN using blacklisted PINS"

@TC_FINLSO_REG_MARKET_USSD_Premium-Exception-CustomerPayMerchantinvalidtillnumber!
Scenario: Premium-Exception-Customer Pay Merchant invalid till number
  Given I generate name "EnterTillNumber" with value "10_RAND_3"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.PayBussiness" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.NotFoundError" on "Handset.RegisteredCustomerThree"
  Then I report "Exception-Customer Pay Merchant invalid till number"

@TC_FINLSO_REG_MARKET_USSD_Premium_WithdrawalatanAgentToperformwithdrawalbyenteringvalidTill!
Scenario: Premium_Withdrawal at an Agent_To perform withdrawal by entering valid Till
  Given I generate name "EnterTillNo" with value "10007"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Customer Withdraw Cash" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" on "Handset.RegisteredCustomerThree"
  Then I report "Withdrawal at an Agent_To perform withdrawal by entering valid Till"

@TC_FINLSO_REG_MARKET_USSD_EntrylevelSendMoneytoInvalidMSISDNSendingMoneytoinvalidMSISDN!
Scenario: Entry level_Send Money to Invalid MSISDN_Sending money to invalid MSISDN
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "RAND_10"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.InvalidReceiver" on "Handset.RegisteredCustomerThree"
  Then I report "Entry level_Send Money to Invalid MSISDN_Sending money to invalid MSISDN"

@TC_FINLSO_REG_MARKET_USSD_SuperAgentWithInsufficientFundDepositToCustomer_Exception!
Scenario: Top ORG _ Super Agent with insufficient funds Deposit to Customer (Exception)
  Given I generate name "ReceipientMobNo" with value "Include266"
  Given I generate name "Amount" with value "Amount.Limit100000"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit to customer" Service for "Handset.Till"
  Then I validate message "Messages.InsufficientFund_SuperAgentToCustomer" from "USSD.Sender" on "Handset.Till"
  Then I report "Successfully received error mesage - Super Agent with insufficient fund Deposit to customer"

@TC_FINLSO_REG_MARKET_USSD_CustomerAbleToBalanceEnquiry_M-PesaAccount!
Scenario: Premium_Balance Enquiry_Checking the current balance in the M-Pesa Account
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Balance Enquiry" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.CustomerBalance" from "USSD.Sender" on "Handset.RegisteredCustomerThree"

@TC_FINLSO_REG_MARKET_USSD_C2BUSSDMerchantChangePINSuccessfully!
Scenario: C2B_USSD-Merchant change PIN successfully
  Given I generate name "NewPin" with value "RAND_4"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.ChangePinSuccessfully" Service for "Handset.Till"
  Then I validate message "Messages.ResetPinConfirmed" on "Handset.Till"
  Then I replace the "Handset.Till.PIN" value with "NewPin" in the "fin_handset_testdata" json in folder "FolderLocation.Regression"
  Then I report "The Merchant pin has been changed."

@TC_FINLSO_REG_MARKET_USSD_C2BUSSDMerchantCallHelpDeskSuccessfully!
Scenario: C2B_USSD-Merchant is able to call Help desk
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.ContactHelpDesk" Service for "Handset.Till"
  Then I report "The Merchant is successfully able to get Help desk number"

@TC_FINLSO_REG_MARKET_USSD_C2B_USSD-MerchantViewBalancetransactionbyenteringcorrectPIN!
Scenario:C2B_USSD-Merchant View Balance transaction by entering correct PIN.
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_MerchantAccount" Service for "Handset.Till"
  Then I validate message "Messages.BalanceEnquiry_MerchantAccount" from "USSD.Sender" on "Handset.Till"
  Then I report "C2B_USSD-Merchant View Balance transaction by entering correct PIN."

@TC_FINLSO_REG_MARKET_USSD_PremiumExceptionCustomerPayMerchantofPendingActiveAccount!
Scenario: Premium_ Exception-Customer Pay Merchant of Pending Active Account
  Given I generate name "TillNumber" with value "Till.MpatOrgOne.TillPendingActive"
  Given I generate name "Amount" with value "Handset.TransactionAmount"
  Given I generate name "ReferenceName" with value "Handset.Till.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomerThree.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.CustomerPayMerchantPendingActive" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_ Exception-Customer Pay Merchant of Pending Active Account is successfull"

@TC_FINLSO_REG_MARKET_USSD_PremiumExceptionCustomerPayMerchantofclosedaccount!
Scenario: Premium_Exception Customer Pay Merchant of closed account
  Given I generate name "TillNumber" with value "Till.MpatOrgOne.TillNumber_Closed"
  Given I generate name "Amount" with value "Handset.TransactionAmount"
  Given I generate name "ReferenceName" with value "Handset.Till.Name"
  Given I generate name "CorrectPin" with value "Handset.RegisteredCustomerThree.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.CustomerPayMerchantClosed" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.NotFoundError" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_Exception-Customer Pay Merchant of closed account is successfull"

@TC_FINLSO_REG_MARKET_USSD_Premium_SendMoneytoDormantMSISDNperformsendmoneybyenteringdormantMSISDN!
Scenario: Premium_Send Money to Dormant MSISDN_To perform send money by entering dormant MSISDN
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.DormantCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" on "Handset.RegisteredCustomerThree"
  Then I report "Permium Pay Send Money to a Dormant MSISDN successful"

@TC_FINLSO_REG_MARKET_USSD_Premium_SendMoneytoSuspendedMSISDN_ToperformsendmoneybyenteringsuspendedMSISDN!
Scenario: Premium_Send Money to a Suspended MSISDN_To perform send money by entering a suspended MSISDN.
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.SuspendedCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" on "Handset.RegisteredCustomerThree"
  Then I report "Permium Pay Send Money to a suspended MSISDN successful"

@TC_FINLSO_REG_MARKET_USSD_TopORG_SuperAgentdepositintotheindependentstore!
Scenario:Top ORG_Super Agent deposit into the independent store
  Given I generate name "ShortCode" with value "ShortCode.AgencyIndep"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit To Another Agent" Service for "Handset.Till"
  Then I validate message "Messages.Deposit To Another Agent" from "USSD.Sender" on "Handset.Till"
  Then I report "Top ORG_Super Agent deposit into the independent store"

@TC_FINLSO_REG_MARKET_USSD_TopORG_CentrallyownedHODeposittoSuperAgent!
Scenario:Top ORG_ Centrally owned HO Deposit to Super Agent
  Given I generate name "ShortCode" with value "ShortCode.ShortCode5"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit To Another Agent" Service for "Handset.Till"
  Then I validate message "Messages.Deposit To Another Agent" from "USSD.Sender" on "Handset.Till"
  Then I report "Top ORG_ Centrally owned HO Deposit to Super Agent Successfully"

@TC_FINLSO_REG_MARKET_USSD_TopORGAgencyStorelinkedtoCentrallyOwnedHOViewBalanceCommissionAccount!
Scenario: Top ORG_ Agency Store linked to Centrally Owned HO View Balance - (Commission Account)
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_CommissionAccount" Service for "Handset.Till"
  Then I validate message "Messages.BalanceEnquiry_CommissionAccount" from "USSD.Sender" on "Handset.Till"
  Then I report "Top ORG_ Agency Store linked to Centrally Owned HO View Balance - (Commission Account) is successfull"

@TC_FINLSO_REG_MARKET_USSD_TopORGSuperAgentViewBalanceCommissionPayableAccountException!
Scenario:Top ORG_  Super Agent View Balance - (Commission Payable Account) Exception
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_CommissionPyabaleAccount" Service for "Handset.Till"
  Then I validate message "Messages.BalanceEnquiry_CommissionPayableAccount" from "USSD.Sender" on "Handset.Till"
  Then I report "Top ORG_  Super Agent View Balance - (Commission Payable Account) Exception is successfull"

@TC_FINLSO_REG_MARKET_USSD_PremiumSendMoneytovalidMSISDNwithwithdrawalfeeTosendmoneywithwithdrawalfee!
Scenario:Premium_Send Money to valid MSISDN with withdrawal fee_To send money with withdrawal fee
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_WithWithdrawalFee" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed_withdrawalfee" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_Send Money to valid MSISDN with withdrawal fee_To send money with withdrawal fee is successfull"

@TC_FINLSO_REG_MARKET_USSD_PremiumSendMoneytovalidMSISDNTosendmoneywithoutwithdrawalfee!
Scenario:Premium_Send Money to valid MSISDN_To send money without withdrawal fee
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Send Money" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_Send Money to valid MSISDN with withdrawal fee_To send money without Withdrawal fee is successfull"

@TC_FINLSO_REG_MARKET_USSD_Premium_SendMoneytoRegisteredMSISDNInsufficientBalanceToperformsendmoneybyenteringinsufficientamount!
Scenario:Premium_Send Money to Registered MSISDN (Insufficient Balance)_To perform send money  by entering insufficient amount.
  Given I generate name "EnterAmount" with value "Amount.Limit2000"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.InsufficientBalance" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_Send Money to Registered MSISDN (Insufficient Balance)_To perform send money  by entering insufficient amount is successfull"

@TC_FINLSO_REG_MARKET_USSD_C2B_USSD-MerchantActivateTillOperator!
Scenario: C2B_USSD-Merchant Activate Till/Operator
  Given I generate name "TillNumber" with value "RAND_6"
  Given I generate name "msisdn" with value "Handset.ClosedTill.MSISDN"
  Given I generate name "OperatorID" with value "Handset.ClosedTill.Operator ID"
  # Execute Command for Create Till
  Given I login to Fintech as "sp" operator
  Then I create Till with below details
  | Short_Code                      | MSISDN | Till_Number | Language | Operator_ID | Product           |
  | Handset.ClosedTill.TopShortCode | msisdn | TillNumber  | English  | ABC12345    | Available Product |
  # SMS
  Then I validate message "Messages.Till Creation" from "USSD.Sender" on "Handset.ClosedTill"
  #Execute Command for activate Till
  Given I generate name "EnterOperatorID" with value "Handset.ClosedTill.AssistantID"
  Given I generate name "EnterInitPin" with value "Handset.ClosedTill.PIN"
  Given I generate name "PIN" with value "RAND_4"
  Given I dial USSD code "USSD.Code" for "Handset.ClosedTill"
  When I select "Till.Activate_Till" Service for "Handset.ClosedTill"
  Then I validate message "Messages.activated" from "USSD.Sender" on "Handset.ClosedTill"
  Then I replace the "Handset.ClosedTill.PIN" value with "PIN" in the "fin_handset_testdata" json in folder "FolderLocation.Gptc"
  #Search again and Close
  When I search for "Till" with below details
  | TableId    | TableValues | Query Condition                       | SearchBy    | Organization Short Code | SearchValue | Till Number | Status        | CloseTheSearch |
  | Table.Till | TillNumber  | Till Number + Organization Short Code | Till Number | ShortCode.ShortCode2    | TillNumber  | TillNumber  | Status.Active | yes            |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_USSD_Premium_MyAccountServices_AddMerchantBeneficiary!
Scenario: Premium_My Account Services_Add Merchant Beneficiary
  #Add beneficiary from USSD
  Given I generate name "Enter Short Code to add" with value "ShortCode.ShortCode3"
  Given I generate name "BeneficiaryTopOrgName" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AddBeneficiaryOrganization" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.AddBeneficiaryOrganizationAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  #Post condition
  Then I join two values "Enter Short Code to add" and "BeneficiaryTopOrgName" with separator " " store in "BeneficiaryTopOrgName"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.DeleteBeneficiaryOrganization" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.DeleteBeneficiaryOrganizationAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Customer can Add Merhcant Beneficiary successfully"

@TC_FINLSO_REG_MARKET_USSD_TopOrgAgencyStorelinkedtoCentrallyOwnedHOViewBalanceFloatAccount!
Scenario: Top Org_ Agency Store linked to Centrally Owned HO View Balance - (Float Account)
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_FloatAccount" Service for "Handset.Till"
  Then I validate message "Messages.BalanceEnquiry_FloatAccount" from "USSD.Sender" on "Handset.Till"
  Then I report "Top Org_ Agency Store linked to Centrally Owned HO View Balance - (Float Account) is successfull"

@TC_FINLSO_REG_MARKET_USSD_TopORG_CentrallyOwnedHOViewBalance_FloatAccount!
Scenario:Top ORG_ Centrally Owned HO View Balance - (Float Account)
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_FloatAccount" Service for "Handset.Till"
  Then I wait "5"
  Then I validate message "Messages.BalanceEnquiry_FloatAccount" from "USSD.Sender" on "Handset.Till"
  Then I report "Top ORG_ Centrally Owned HO can View Float Account Balance"

@TC_FINLSO_REG_MARKET_USSD_TopORG_CentrallyOwnedHOViewBalance_M-PesaAccount!
Scenario:Top ORG_ Centrally Owned HO View Balance - (M-Pesa Account)
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_MPesaAccount" Service for "Handset.Till"
  Then I wait "5"
  Then I validate message "Messages.BalanceEnquiry_MPesaAccount" from "USSD.Sender" on "Handset.Till"
  Then I report "Top ORG_ Centrally Owned HO can M-Pesa Account View Balance"

@TC_FINLSO_REG_MARKET_USSD_TopOrg_AgencyStorelinkedtoCentrallyOwnedHODepositIntoAgentIndependentstoreTill!
Scenario: Top Org_ Agency Store linked to Centrally Owned HO Deposit into agent independent store till
  Given I generate name "ShortCode" with value "ShortCode.AgencyIndep"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit To Another Agent" Service for "Handset.Till"
  Then I validate message "Messages.Deposit To Another Agent" from "USSD.Sender" on "Handset.Till"
  Then I report "Top Org_ Agency Store linked to Centrally Owned HO Deposit into agent independent store till Successfully"

@TC_FINLSO_REG_MARKET_USSD_TopORG_CentrallyOwnedHOViewBalanceCommissionAccount!
Scenario: Top ORG_ Centrally Owned HO View Balance - (Commission Account)
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_CommissionAccount" Service for "Handset.Till"
  Then I wait "5"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "Top ORG Centrally Owned HO View Balance - (Commission Account)"

@TC_FINLSO_REG_MARKET_USSD_TopOrg_AgencyStorelinkedtoCentrallyOwnedHOsuccessfullyDeposittoCustomer!
Scenario: Top Org_ Agency Store linked to Centrally Owned HO successfully Deposit to Customer
  Given I generate name "ReceipientMobNo" with value "Handset.RegisteredCustomerTwo.MSISDN"
  Given I generate name "Amount" with value "114"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit to customer" Service for "Handset.Till"
  Then I wait "10"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "Top OrgAgency Store linked to Centrally Owned HO successfully Deposit to Customer"

@TC_FINLSO_REG_MARKET_USSD_MinorChangePINChangingtheAlreadyregisteredPIN!
Scenario: Minor-Change PIN_Changing the Already registered PIN
  Given I generate name "NewPin" with value "RAND_4"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.ResetPin" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.ResetPinConfirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  And I replace the "Handset.MinorCustomer.PIN" value with "NewPin" in the "fin_handset_testdata" json in folder "FolderLocation.Regression"
  And I report "Change Pin for minor customer was successfull"

@TC_FINLSO_REG_MARKET_USSD_MinorViewMINIStatementViewingtheministatementwithrelevantdetails!
Scenario: Minor-View MINI Statement_Viewing the mini statement with relevant details
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Show Mini Statement" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.MiniStatement" on "Handset.MinorCustomer"
  Then I report "Minor customer can view mini statment"

@TC_FINLSO_REG_MARKET_USSD_MinorBalanceEnquiryCheckingcurrentbalancetheMPesaAccount!
Scenario: Minor-Balance Enquiry Checking the current balance in the M-Pesa Account
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Balance Enquiry" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.CustomerBalance" from "USSD.Sender" on "Handset.MinorCustomer"

@TC_FINLSO_REG_MARKET_USSD_MinorSendMoneytoClosedMSISDNToperformsendmoneyenteringClosedMSISDN!
Scenario: Minor-Send Money to Closed MSISDN_To perform send money by entering Closed MSISDN
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.ClosedCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.ClosedMessage" on "Handset.MinorCustomer"
  Then I report "Minor Customer can not send Money to a Closed customer"

@TC_FINLSO_REG_MARKET_USSD_MinorSendMoneyvalidMSISDNwithwithdrawalfeesendmoneywithwithdrawalfee!
Scenario: Minor-Send Money to valid MSISDN with withdrawal fee_To send money with withdrawal fee
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer2"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Send Money_WithWithdrawalFee" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed_withdrawalfee" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Minor Customer Can Send Money to Valid msisdn With withdrawal fee"

@TC_FINLSO_REG_MARKET_USSD_MinorSendMoneyFrozenMSISDNToperformsendmoneybyenteringFrozenMSISDN!
Scenario: Minor-Send Money to a Frozen MSISDN_To perform send money by entering Frozen MSISDN
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer5"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.FrozenMessage" on "Handset.MinorCustomer"
  Then I report "Minor Customer Can not send money to Frozen Customer"

@TC_FINLSO_REG_MARKET_USSD_MinorCustomerPerformLanguageChangeSuccessfully!
Scenario: Minor-My Account Services_To perform change language transaction successfully.
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Change Language To Southern Sotho" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.LanguageChangeToSesothoSuccessful" from "USSD.Sender" on "Handset.MinorCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Change Language To English" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.LanguageChangeToEnglishSuccessful" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Minor Customer successfully able to Change Language"

@TC_FINLSO_REG_MARKET_USSD_MinorCustomerAbleToAddMerchantBeneficiary!
Scenario: Minor-My Account Services_Add Merchant Beneficiary
  #Add beneficiary from USSD
  Given I generate name "Enter Short Code to add" with value "ShortCode.ShortCode3"
  Given I generate name "BeneficiaryTopOrgName" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.AddBeneficiaryOrganization" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.AddBeneficiaryOrganizationAccepted" from "USSD.Sender" on "Handset.MinorCustomer"
  #Post condition
  Then I join two values "Enter Short Code to add" and "BeneficiaryTopOrgName" with separator " " store in "BeneficiaryTopOrgName"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.DeleteBeneficiaryOrganization" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.DeleteBeneficiaryOrganizationAccepted" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Minor Customer can Add Merhcant Beneficiary successfully"

@TC_FINLSO_REG_MARKET_USSD_VerifyMinorCustomerAddIndividualBeneficiaries!
Scenario: Minor-My Account Services-Beneficiary_ Add Individual beneficiaries - Beneficiary
  #Add beneficiary from USSD
  Given I generate name "BeneficiaryMSISDN" with value "Handset.MinorCustomer.MSISDN"
  Given I generate name "BeneficiaryMSISDNName" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.AddBeneficiaryCustomerAccepted" from "USSD.Sender" on "Handset.MinorCustomer"
  #Delete beneficiary from USSD
  Then I join two values "BeneficiaryMSISDN" and "BeneficiaryMSISDNName" with separator " " store in "BeneficiaryMSISDNName"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Minor Customer add registered customer as beneficary Successfully"

@TC_FINLSO_REG_MARKET_USSD_MinorCustomerSendingMoneyToRegisteredMSISDN_InsufficientAmount!
Scenario: Minor-Send Money to Registered MSISDN_To perform send money by entering insufficient amount.
  Given I generate name "EnterAmount" with value "Amount.Limit2000"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer2"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.InsufficientBalance" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Successful - Minor Customer Sending Money To RegisteredMSISDN Insufficientamount"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayforMetropolitaninsurancewithallvalidprerequisitesPayforMetropolitanwithvalidpolicyormembershipnumber!
Scenario:Minor-Pay for Metropolitan insurance with all valid prerequisites Pay for Metropolitan with valid policy or membership number
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  Given I generate name "Policy Number" with value "InsuranceTypes.Metropolitan"
  When I select "Customer.MinorcustomerPaybills - Metropolitan" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "The Minor Customer successfully completed Pay for Metropolitan insurance with all valid prerequisites "

@TC_FINLSO_REG_MARKET_USSD_Minor-PayforallianceInsurancewithallprequisitesavailable_PayforAllicanceinsurance-success!
Scenario:Minor-Pay for alliance Insurance with all prequisites available_Pay for Allicance insurance - success
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  Given I generate name "PolicyNumber" with value "InsuranceTypes.AllianceLife"
  Given I generate name "EnterAmount" with value "Insurance Amount.AllianceLifeAmmount"
  When I select "Customer.MinorcustomerAllianceLife" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "The Minor Customer successfully completed Pay for alliance insurance with all valid prerequisites"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayVodacomContractforself_PayVodacomContractforselfwithallvalidprerequisites.!
Scenario:Minor-Pay Vodacom Contract for self _Pay Vodacom Contract for self with all valid prerequisites.
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.VodacomContract" Service for "Handset.MinorCustomer"
  Then I wait "10"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "The Minor Customer successfully completed Pay Vodacom Contractforself_Pay Vodacom Contract forself with all valid prerequisites"

@TC_FINLSO_REG_MARKET_USSD_Minor_SendingMoneyToInvalidMSISDN!
Scenario: Minor-Send Money to Invalid MSISDN_Sending money to invalid MSISDN
  Given I generate name "IncorrectMSISDN" with value "123456789"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.SendMoney_IncorrectMSISDN" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.SendMoneyToInvalidMsisdn" on "Handset.MinorCustomer"
  Then I report "Successfully received error message for IncorrectMSISDN"

# @TC_FINLSO_REG_MARKET_USSD_MinorPayForMetropolitanWithInvalidPolicyOrMembershipNumberPayOrMetropolitanInsurance!
# #Error- Service temporarily unavailable
# Scenario:Minor-Pay for Metropolitan with invalid policy or membership number Pay for Metropolitan Insurance
#   Given I generate name "Policy Number" with value "RAND_10"
#   Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
#   When I select "Customer.Paybills-InvalidMetropolitan" Service for "Handset.MinorCustomer"
#   #Then I validate message "Messages.IssueMessage" from "USSD.Sender2" on "Handset.MinorCustomer"
#   Then I report "Minor-Pay for Metropolitan with invalid policy or membership number Pay for Metropolitan Insurance"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayforAllianceLegalWithInvalidPolicyNumberPayForAllianceLegalWithInvalidPolicyNumber!
Scenario:Minor-Pay for Alliance Legal with invalid Policy number Pay for Alliance Legal with invalid policy number
  Given I generate name "PolicyNumber" with value "RAND_10"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.InvalidAllianceLegal" Service for "Handset.MinorCustomer"
  Then I verify text "You have entered the incorrect details 3 times. Thank you for choosing Vodacom MPESA. "
  Then I report "Minor-Pay for Alliance Legal with invalid Policy number Pay for Alliance Legal with invalid policy number"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayForAllianceLegalWithAllPrerequisitesAvailablePayForAllianceLegal-Success!
Scenario:Minor-Pay for Alliance Legal with all prerequisites available Pay for Alliance Legal - success
  Given I generate name "EnterPolicyNumber" with value "InsuranceTypes.AllianceLegal2"
  Given I generate name "EnterAmount" with value "Insurance Amount.AllianceLegalAmount"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Minor_AllianceLegal" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Minor-Pay for Alliance Legal with all prerequisites available Pay for Alliance Legal - success"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayForAllianceInsurance-belowMinimumAmountAllowed_PayForAllinaceInsuranceWithBelowAllowedMinimumAmount!
Scenario:Minor-Pay for Alliance Insurance - below minimum amount allowed_Pay for Allinace insurance with below allowed minimum amount and all other prerequisites available
  Given I generate name "PolicyNumber" with value "InsuranceTypes.AllianceLife"
  Given I generate name "EnterAmount" with value "Amount.Minimum"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Less_AllianceLife-Mini" Service for "Handset.MinorCustomer"
  Then I verify text "You have entered an invalid amount 3 times. Please try again later. Thank you for using Vodacom MPESA.  "
  Then I report "Minor-Pay for Alliance Insurance - below minimum amount allowed_Pay for Allinace insurance with below allowed minimum amount and all other prerequisites available"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayForAllianceShort-termInsuranceWithAllValidPrerequisitesPayForAllianceShort-termInsuranceWithAllValidPrerequisites!
Scenario:Minor-Pay for Alliance Short-term insurance with all valid prerequisites Pay for Alliance Short-term insurance with all valid prerequisites
  Given I generate name "Policy Number" with value "InsuranceTypes.Alliance short term"
  Given I generate name "EnterAmount" with value "Amount.Minimum"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Paybills - Alliance short term" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Minor-Pay for Alliance Short-term insurance with all valid prerequisites Pay for Alliance Short-term insurance with all valid prerequisites"

# @TC_FINLSO_REG_MARKET_USSD_Minor-PayForElectricityWithAValidMeterNumberAndAllSystemsConnected_PayForElectricityUsingValidMeterNumber!
# #Need valid Electric meter number
# Scenario:Minor-Pay for electricity with a valid meter number and all systems connected_Pay for electricity using valid meter number and all other prerequisites available
#   Given I generate name "EnterAccountNumber" with value "Receipient.PayBillLEC"
#   Given I generate name "EnterAmount" with value "Amount.Normal"
#   Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
#   When I select "Customer.Pay Bill LEC" Service for "Handset.MinorCustomer"
#   Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
#   Then I report "Minor-Pay for electricity with a valid meter number and all systems connected_Pay for electricity using valid meter number and all other prerequisites available"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayVodacomContractForPrepaidPayContractForOtherMSISDN!
Scenario:Minor-Pay Vodacom Contract for prepaid Pay Contract for Other MSISDN [prepaid]
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.VodacomContracts" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Minor-Pay Vodacom Contract for prepaid Pay Contract for Other MSISDN [prepaid]"

@TC_FINLSO_REG_MARKET_USSD_Minor-BuyAirtimeForSelfBuyAirtimeforSelf!
Scenario: Minor-Buy Airtime for Self Buy Airtime for self
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.BuyAirTimeForSelf" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.BuyAirTimeForSelfConfirmed" on "Handset.MinorCustomer"
  Then I report "Minor-Buy Airtime for Self Buy Airtime for self"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreAgentInternalTransferfromM-PesatoFloatInsufficientFunds!
Scenario: Independent Store_ Agent Internal Transfer - from M-Pesa to Float (Insufficient Funds)
  Given I generate name "EnterAmount" with value "Amount.Limit1300000"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.TransferFromWorkingToFloat" Service for "Handset.Till"
  Then I validate message "Messages.InsufficientFund_InternalTransfer" from "USSD.Sender" on "Handset.Till"
  Then I report "SUCCESS : Independent Store_ Agent Internal Transfer - from M-Pesa to Float (Insufficient Funds)"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreIndependentAgentwithdrawalfromtheSuperAgent!
Scenario: Independent Store_ Independent Agent withdrawal from the Super Agent
  Given I generate name "EnterShortCode" with value "ShortCode.AgencyIndep"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.AgentWithdrawalofCashusingOnceoffpayment" Service for "Handset.Till"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "Independent Store_ Independent Agent withdrawal from the Super Agent Successfully"

@TC_FINLSO_REG_MARKET_USSD_TopORG_TopORGSuperAgentViewBalance-CommissionheldAccountException!
Scenario:Top ORG Super Agent View Balance - (Commission held Account) Exception
  Given I generate name "EnterShortCode" with value "ShortCode.ShortCode10"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_CommissionAccount1" Service for "Handset.Till"
  Then I validate message "Messages.BalanceEnquiry_CommissionAccountException" from "USSD.Sender" on "Handset.Till"
  Then I report "Top ORG Super Agent View Balance - (Commission held Account) Exception"

@TC_FINLSO_REG_MARKET_USSD_TopORGCentrallyOwnedHOwithsufficientfundwithdrawfromAnotherCentrallyOwnedHO!
Scenario:Top ORG_ Centrally Owned HO with sufficient fund withdraw from Another Centrally Owned HO
  Given I generate name "EnterShortCode" with value "orgAHO.Shortcode"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.AgentWithdrawalofCashusingOnceoffpayment" Service for "Handset.Till"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Top ORG_ Centrally Owned HO with sufficient fund withdraw from Another Centrally Owned HO"

@TC_FINLSO_REG_MARKET_USSD_Minor-SendMoneySuspendedMSISDNperformsendmoneyenteringsuspendedMSISDN!
Scenario: Minor-Send Money to a Suspended MSISDN_To perform send money by entering a suspended MSISDN
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.SuspendedCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" on "Handset.MinorCustomer"
  Then I report "Minor Customer can Send Money to a Suspended MSISDN successful"

@TC_FINLSO_REG_MARKET_USSD_Minor-SendMoneyDormantMSISDNperformsendmoneyenteringdormantMSISDN!
Scenario: Minor-Send Money to Dormant MSISDN_To perform send money by entering dormant MSISDN
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.DormantCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" on "Handset.MinorCustomer"
  Then I report "Minor Customer can Send Money to a Dormant MSISDN successful"

# @TC_FINLSO_REG_MARKET_USSD_IndependentStoreViewBalance-CommissionAccount-AgentViewBalancetransactionbyenteringcorrectPIN!
# #Pending Due First time SMS not geting when we rerun second time SMS is getting for  both 1st and 2nd (two SMS)
# Scenario:Independent Store_ View Balance - (Commission Account)-Agent View Balance transaction by entering correct PIN.
#   Given I generate name "EnterShortCode" with value "Independent Store ShortCode"
#   Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.BalanceEnquiry_CommissionAccount1" Service for "Handset.Till"
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.BalanceEnquiry_CommissionAccount1" Service for "Handset.Till"
#   Then I validate message "Messages.BalanceEnquiry_CommissionAccount" from "USSD.Sender" on "Handset.Till"
#   Then I report "Independent Store_ View Balance - (Commission Account)-Agent View Balance transaction by entering correct PIN."

# @TC_FINLSO_REG_MARKET_USSD_IndependentStoreViewBalance-FloatAccount-AgentViewBalancetransactionbyenteringcorrectPIN.!
#Pending Due First time SMS not geting when we rerun second time SMS is getting for  both 1st and 2nd (two SMS)
# Scenario: Independent Store_View Balance - (Float Account) - Agent View Balance transaction by entering correct PIN.
#   Given I generate name "EnterShortCode" with value "Independent Store ShortCode"
#   Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.BalanceEnquiry_FloatAccount" Service for "Handset.Till"
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.BalanceEnquiry_FloatAccount" Service for "Handset.Till"
#   Then I validate message "Messages.BalanceEnquiry_FloatAccount" from "USSD.Sender" on "Handset.Till"
#   Then I report "Independent Store_ View Balance - (Float Account)-Agent View Balance transaction by entering correct PIN."

# @TC_FINLSO_REG_MARKET_USSD_IndependentStoreViewBalance-M-PesaAccount-AgentViewBalancetransactionbyenteringcorrectPIN.!
#Pending Due First time SMS not geting when we rerun second time SMS is getting for  both 1st and 2nd (two SMS)
# Scenario: Independent Store_ View Balance - (M-Pesa Account) - Agent View Balance transaction by entering correct PIN.
#   Given I generate name "EnterShortCode" with value "Independent Store ShortCode"
#   Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.BalanceEnquiry_MPesaAccount" Service for "Handset.Till"
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.BalanceEnquiry_MPesaAccount" Service for "Handset.Till"
#   Then I validate message "Messages.BalanceEnquiry_MPesaAccount" from "USSD.Sender" on "Handset.Till"
#   Then I report "Independent Store_ View Balance - (M-Pesa Account)-Agent View Balance transaction by entering correct PIN."

@TC_FINLSO_REG_MARKET_USSD_Minor-PayDSTVusinginvalidcustomernumber/smartcard_PayforDSTVusinginvalidcustomernumber/smartcard!
Scenario:Minor-Pay DSTV using invalid customer number/smartcard_Pay for DSTV using invalid customer number/smart card
  Given I generate name "EnterSmartCardNumber" with value "RAND_4"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.MinorcustomerPay Bill DSTV" Service for "Handset.MinorCustomer"
  Then I verify text "Invalid account number. "
  Then I report "The Minor Customer successfully completed Pay Bill DSTV Using invalid customer number"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayforAllianceInsurancewithinvalidpolicynumberPayforAllinaceinsurancewithinvalidpolicynumberandallotherprerequisitesavailable!
Scenario:Minor-Pay for Alliance Insurance with invalid policy number Pay for Allinace insurance with invalid policy number and all other prerequisites available
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  Given I generate name "PolicyNumber" with value "RAND_10"
  When I select "Customer.AllianceLifeWithInvalidpolicynumber" Service for "Handset.MinorCustomer"
  Then I verify text "You have entered the incorrect details 3 times. Thank you for choosing Vodacom MPESA."
  Then I report "The Minor Customer successfully completed Pay for Alliance Insurance with invalid policy number"

# @TC_FINLSO_REG_MARKET_USSD_Minor-PayforDSTVwithavalidcustomernumber/smartcardandallsystemsconnectedPayforDSTVusingvalidcustomernumber/smartcardandallotherprerequisitesavailable!
# #Pending:service temporarily unavalaible
# Scenario:Minor-Pay for DSTV with a valid customer number/smartcard and all systems connected Pay for DSTV using valid customer number/smartcard and all other prerequisites available
#   Given I generate name "EnterAmount" with value "Amount.Minimum1"
#   Given I generate name "EnterSmartCardNumber" with value "7034387026"
#   Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
#   When I select "Customer.Pay Bill DSTV" Service for "Handset.MinorCustomer"
#   Then I validate message "Messages.Paid" from "USSD.Sender2" on "Handset.MinorCustomer"
#   Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
#   Then I report "The Minor Customer successfully completed Pay for DSTV witha validcustomer number with all valid prerequisites"

# @TC_FINLSO_REG_MARKET_USSD_Minor-PayforElectricitywithlessthanallowedminimulamount_Payforelectricitywithlowerthanallowedminimumamount.!
# #Pending:Need Exact LEC Number
# Scenario:Minor-Pay for Electricity with less than allowed minimul amount_Pay for electricity with lower than allowed minimum amount.
#   Given I generate name "EnterAmount" with value "Amount.Minimum1"
#   Given I generate name "EnterAccountNumber" with value "LecNumber"
#   Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
#   When I select "Customer.Pay Bill LEC" Service for "Handset.MinorCustomer"
#   Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
#   Then I report "The Minor Customer successfully completed Pay for Electricity with less than allowed minimul amount_Pay for electricity with lower than allowed minimum amount"

@TC_FINLSO_REG_MARKET_USSD_Premium-PayforNalediFuneralPlannersWithValidPolicyNumber!
Scenario: Premium_Pay for Naledi Funeral Planners with all valid prerequisites_Pay for Naledi Funeral Planners with valid Policy Number
  Given I generate name "Policy Number" with value "InsuranceTypes.Naledi Funeral Services"
  Given I generate name "EnterAmount" with value "Insurance Amount.Naledi Funeral Services Amount"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Paybills - Naledi Funeral Services" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" on "Handset.RegisteredCustomerThree"
  Then I report "Successful - Pay for Naledi Funeral Planners with valid Policy Number"

@TC_FINLSO_REG_MARKET_USSD_Premium_WithdrawalatAgentwithclosedTillclosedAgent/agenttilldoesnotgetWithdrawal!
Scenario:Premium_Withdrawal at  Agent with closed Till_closed  Agent/agent till does not get Withdrawal
  Given I generate name "EnterTillNo" with value "823936"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Customer Withdraw Cash" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.NotFoundError" on "Handset.RegisteredCustomerThree"
  Then I report "Premium Withdrawal at Agent with closed Till closed Agent does not get Withdrawal is successfull"

@TC_FINLSO_REG_MARKET_USSD_C2BUSSDMerchantPaysforgood/servicestoanothermerchantusingUSSD!
Scenario: C2B_USSD-Merchant Pays for good/services to another merchant using USSD
  Given I generate name "EnterShortCode" with value "Handset.ClosedTill.TopShortCode"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.MerchantToMerchant" Service for "Handset.Till"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "C2B_USSD-Merchant Pays for good/services to another merchant using USSD is successfull"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreAgentWithdrawalwithnegativebalance-fromAnotherAgentException!
Scenario: Independent Store_Agent Withdrawal with negative balance - from Another Agent(Exception)
  Given I generate name "EnterShortCode" with value "ShortCode.AgencyIndep"
  Given I generate name "Amount" with value "Amount.Limit1300000"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.AgentWithdrawalofCashusingOnceoffpayment" Service for "Handset.Till"
  Then I validate message "Messages.InsufficientFund_InternalTransfer" from "USSD.Sender" on "Handset.Till"
  Then I report "Independent Store_Agent Withdrawal with negative balance - from Another Agent(Exception) Successfully"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreIndependentAgentDeposittoFrozencustomerAccount!
Scenario: Independent Store_ Independent Agent Deposit to Frozen customer Account
  Given I generate name "EnterMSISDN" with value "FrozenMSISDNCustomer"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Customer Deposit Cash At Agent" Service for "Handset.Till"
  Then I validate message "Messages.CustomerDepositCashAtAgentExceptionFrozen" from "USSD.Sender" on "Handset.Till"
  Then I report "Independent Store_ Independent Agent Deposit to Frozen customer Account Successfully"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreIndependentAgentsuccessfullyDeposittoCustomer!
Scenario: Independent Store_ Independent Agent successfully Deposit to Customer
  Given I generate name "EnterMSISDN" with value "Handset.RegisteredCustomerThree.MSISDN"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Customer Deposit Cash At Agent" Service for "Handset.Till"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "Independent Store_ Independent Agent successfully Deposit to Customer Successfully"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreIndependentAgentDeposittoPendingActiveCustomerException!
Scenario: Independent Store_ Independent Agent Deposit to Pending Active Customer(Exception)
  Given I generate name "EnterMSISDN" with value "Customer.Pending_Customer"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Customer Deposit Cash At Agent" Service for "Handset.Till"
  Then I validate message "Messages.CustomerDepositCashAtAgentException" from "USSD.Sender" on "Handset.Till"
  Then I report " Independent Store_ Independent Agent Deposit to Pending Active Customer(Exception) Successfully"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayforNalediFuneralPlannerswithallvalidprerequisitesPayforNalediFuneralPlannerswithvalidPolicyNumber!
Scenario:Minor-Pay for Naledi Funeral Planners with all valid prerequisites Pay for Naledi Funeral Planners with valid Policy Number
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  Given I generate name "Policy Number" with value "InsuranceTypes.Naledi Funeral Services"
  Given I generate name "EnterAmount" with value "Insurance Amount.Naledi Funeral Services Amount"
  When I select "Customer.Paybills - Naledi Funeral Servicesone" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "The Minor Customer successfully completed ay for Naledi Funeral Planners with all valid prerequisites Pay for Naledi Funeral Planners with valid Policy Number"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayforMamothwithallvalidprerequisitesPayforMamothwithvalidPolicyNumber!
Scenario:Minor-Pay for Mamoth with all valid prerequisites Pay for Mamoth with valid Policy Number
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  Given I generate name "Policy Number" with value "InsuranceTypes.Mamoth Health"
  Given I generate name "EnterAmount" with value "Insurance Amount.Mamoth Health Amount"
  When I select "Customer.Paybills - Mamoth Healthone" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "The Minor Customer successfully completed Pay for Mamoth with all valid prerequisites"

@TC_FINLSO_REG_MARKET_USSD_Minor-LesothoFuneralServicePayForLesothoFuneralServicesWithValidPolicyNumber!
Scenario: Minor-Lesotho Funeral Service pay for Lesotho funeral services with valid policy number
  Given I generate name "Enterpolicynumber" with value "InsuranceTypes.LesothoFuneralServices"
  Given I generate name "EnterAmount" with value "Insurance Amount.LesothoFuneralServices"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.PayBills Lesotho Funeral Services" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Minor-Lesotho Funeral Service pay for Lesotho funeral services with valid policy number is Successfull"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayForTransAfricaWithAllValidPrerequisitesPayForTransAfricaWithValidPolicyNumber!
Scenario:Minor-Pay for TransAfrica with all valid prerequisites Pay for TransAfrica with valid Policy Number
  Given I generate name "Policy Number" with value "InsuranceTypes.TransAfrica1"
  Given I generate name "EnterAmount" with value "Insurance Amount.TransAfrica Amount"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.PayBills - TransAfrica" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Minor-Pay for TransAfrica with all valid prerequisites Pay for TransAfrica with valid Policy Number Successfully"

# @TC_FINLSO_REG_MARKET_USSD_C2B_USSD-Merchantsuccessfullychangeslanguage!
# # Receiving Message after 10 minutes
# Scenario: C2B_USSD-Merchant successfully changes language
#   Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
#   Given I generate name "PIN" with value "Handset.Till.PIN"
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.AgentChangeLanguageToSesotho" Service for "Handset.Till"
#   Then I validate message "Messages.LanguageToSesotho" on "Handset.Till"
#   Then I report "C2B_USSD-Merchant successfully changes language to Sesotho"
#   # Post-Condition
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.AgentChangeLanguageToEnglish" Service for "Handset.Till"
#   Then I validate message "Messages.LanguageToEnglish" on "Handset.Till"
#   Then I report "C2B_USSD-Merchant successfully changes language to English"

@TC_FINLSO_REG_MARKET_USSD_C2B_USSD-MerchantRequestMinistatement!
Scenario: C2B_USSD- Merchant Request Mini statement
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I generate name "PIN" with value "Handset.Till.PIN"
  Given I generate name "EnterShortCode" with value "Handset.Till.ShortCode"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.AgentViewMiniStatement" Service for "Handset.Till"
  Then I validate message "Messages.MiniStatement" on "Handset.Till"
  Then I report "C2B_USSD- Merchant Request Mini statement"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreAgentViewBalancecorrectPIN!
Scenario: Independent Store_ Agent View Balance - correct PIN
  Given I generate name "EnterShortCode" with value "IndependentStoreAgentShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_FloatAccount" Service for "Handset.Till"
  Then I wait "5"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "Independent Store_ Agent View Balance - correct PIN Successfully"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreIndependentAgentDeposittoDormantCustomerException!
Scenario:  Independent Store_ Independent Agent Deposit to Dormant Customer(Exception)
  Given I generate name "EnterMSISDN" with value "Customer.DormantCustomer"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Customer Deposit Cash At Agent" Service for "Handset.Till"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report " Independent Store_ Independent Agent Deposit to Dormant Customer(Exception) Successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium-PayforLesothoFuneralServiceWithValidPolicyNumber!
Scenario: Premium_Lesotho Funeral Service_pay for Lesotho funeral services with valid policy number
  Given I generate name "Enterpolicynumber" with value "InsuranceTypes.LesothoFuneralServices"
  Given I generate name "EnterAmount" with value "Insurance Amount.LesothoFuneralServices"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.PayBills Lesotho Funeral Services" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" on "Handset.RegisteredCustomerThree"
  Then I report "Successful - Pay for Lesotho Funeral Services with valid Policy Number"

@TC_FINLSO_REG_MARKET_USSD_Premium-PayforTransAfricaServiceWithValidPolicyNumber!
Scenario: Premium_Pay for TransAfrica with all valid prerequisites_Pay for TransAfrica with valid Policy Number
  Given I generate name "Policy Number" with value "InsuranceTypes.TransAfrica"
  Given I generate name "EnterAmount" with value "Insurance Amount.TransAfrica Amount"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.PayBills - TransAfrica" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_Pay for TransAfrica with all valid prerequisites_Pay for TransAfrica with valid Policy Number"

@TC_FINLSO_REG_MARKET_USSD_Premium_PayforMamothwithallvalidprerequisites_PayforMamothwithvalidPolicyNumber!
Scenario: Premium_Pay for Mamoth with all valid prerequisites_Pay for Mamoth with valid Policy Number
  Given I generate name "Policy Number" with value "InsuranceTypes.Mamoth Health"
  Given I generate name "EnterAmount" with value "Insurance Amount.Mamoth Health Amount"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Paybills - Mamoth Healthone" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "Successfull- Pay for Mamoth with valid Policy Number"

@TC_FINLSO_REG_MARKET_USSD_Premium_PayforLNIGwithallvalidprerequisites_PayforLNIGwithvalidPolicyNumber!
Scenario: Premium_Pay for LNIG with all valid prerequisites_Pay for LNIG with valid Policy Number
  Given I generate name "Enterpolicynumber" with value "InsuranceTypes.LNIG"
  Given I generate name "EnterAmount" with value "Insurance Amount.LNIG"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.LNIG_48Hrs" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "Successfull- Pay for LNIG  with valid Policy Number"

@TC_FINLSO_REG_MARKET_USSD_Premium_CustomerPayMerchant_PayMerchantActiveAccountWithAllPrerequisitesAvailable!
Scenario:Premium_Customer Pay Merchant_Pay Merchant Active account with all prerequisites available
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "TillNumber" with value "Handset.Till.Number"
  Given I generate name "ReferenceId" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Merchant" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_Customer Pay Merchant_Pay Merchant Active account with all prerequisites is Completed Successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium_CustomerPayMerchantOfSuspendedAccount!
Scenario:Premium_Customer Pay Merchant of suspended account
  #prerequisite
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser
  #Customer Pay Merchant to Suspended Account
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "TillNumber" with value "Handset.Till.Number"
  Given I generate name "ReferenceId" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Merchant" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.InvalidState" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_Customer can not Pay Merchant of suspended account"
  #Post-Requisite
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status"
  Then I report "The status of the Organization changes to Suspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_REG_MARKET_USSD_Premium_PayForElectricityWithAnInvalidMeterNumber_PayForElectricityUsingAnInvalidMeterNumber!
Scenario:Premium_Pay for Electricity with an Invalid Meter Number_Pay for Electricity using an invalid meter Number
  Given I generate name "EnterAccountNumber" with value "RAND_10"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Invalid_Pay Bill LEC" Service for "Handset.RegisteredCustomerThree"
  Then I verify text "The meter number is invalid or inactive. Please dial *111# to try again. "
  Then I report "Premium_Pay for Electricity with an Invalid Meter Number throws Error"

# @TC_FINLSO_REG_MARKET_USSD_Premium_Exception-CustomerPayMerchant_PayMerchantofdormantaccount!
# #pending:Need Dormant Till
# Scenario:Premium_Exception-Customer Pay Merchant_Pay Merchant of dormant account
#   Given I generate name "Amount" with value "Amount.Minimum1"
#   Given I generate name "TillNumber" with value "Handset.Till.Number"
#   Given I generate name "ReferenceId" with value "TEST"
#   Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
#   When I select "Customer.Pay Merchant" Service for "Handset.RegisteredCustomerThree"
#   Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
#   Then I report "Premium_Customer Pay Merchant_Pay Merchant of dormantaccount  is done Completed Successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium_PayDSTVusinginvalidcustomernumber/smartcardthroughsecondaryWallet_PayforDSTVusinginvalidcustomernumber/smartcard!
Scenario:Premium_Pay DSTV using invalid customer number/smartcard through secondary Wallet_Pay for DSTV using invalid customer number/smart card
  Given I generate name "EnterSmartCardNumber" with value "RAND_10"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Bill DSTVone" Service for "Handset.RegisteredCustomerThree"
  Then I verify text "Invalid account number."
  Then I report "Premium Pay for DSTV with a invalid customer number/smartcard and all systems connected  Pay for DSTV using valid customer through secondary Wallet is completed successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium_PayforElectricitywithanInvalidMeterNumberthroughSecondaryWallet_PayforElectricityusinganinvalidmeterNumber!
Scenario:Premium_Pay for Electricity with an Invalid Meter Number through Secondary Wallet_Pay for Electricity using an invalid meter Number
  Given I generate name "EnterAccountNumber" with value "RAND_10"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Invalid_Pay Bill LEC" Service for "Handset.RegisteredCustomerThree"
  Then I verify text "The meter number is invalid or inactive. Please dial *111# to try again."
  Then I report "The Premium Customer successfully completed Pay for Electricity Pay for Electricity withanInvalid MeterNumber through Secondary Wallet"

# @TC_FINLSO_REG_MARKET_USSD_Premium_PayforDSTVwithavalidcustomernumber/smartcardandallsystemsconnected_PayforDSTVusingvalidcustomernumber/smartcardandallotherprerequisitesavailable!
# #Pending:service temporarily unavalaible
# Scenario:Premium_Pay for DSTV with a valid customer number/smartcard and all systems connected _Pay for DSTV using valid customer number/smartcard and all other prerequisites available
#   Given I generate name "EnterAmount" with value "Amount.Minimum1"
#   Given I generate name "EnterSmartCardNumber" with value "41203513"
#   Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
#   When I select "Customer.Pay Bill DSTV" Service for "Handset.RegisteredCustomerThree"
#   Then I validate message "Messages.Paid" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
#   Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
#   Then I report "Premium Pay for DSTV with a valid customer number/smartcard and all systems connected  Pay for DSTV using valid customer number/smartcard and all other prerequisites available is completed successfully"

# @TC_FINLSO_REG_MARKET_USSD_Premium_PayforDSTVwithavalidcustomernumber/smartcardandallsystemsconnectedthroughSecondaryWallet_PayforDSTVusingvalidcustomernumber/smartcardandallotherprerequisitesavailable
#Service Temprorily unavailable
# Scenario:Premium_Pay for DSTV with a valid customer number/smartcard and all systems connected through Secondary Wallet_Pay for DSTV using valid customer number/smartcard and all other prerequisites available
#   Given I generate name "EnterAmount" with value "Amount.Minimum1"
#   Given I generate name "EnterSmartCardNumber" with value "DSTVNumber_1"
#   Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
#   When I select "Customer.Pay Bill DSTV" Service for "Handset.RegisteredCustomerThree"
#   Then I validate message "Messages.Paid" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
#   Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
#   Then I report "The Premium Customer successfully completed Pay for DSTV witha validcustomer number with all valid prerequisites through Secondary Wallet"

@TC_FINLSO_REG_MARKET_USSD_Premium_PayforMetropolitanwithinvalidpolicyormembershipnumberPayforMetropolitanInsurance!
Scenario: Premium_Pay for Metropolitan with invalid policy or membership number_Pay  for Metropolitan Insurance
  Given I generate name "Enterpolicynumber" with value "RAND_6"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.MetropolitanException" Service for "Handset.RegisteredCustomerThree"
  Then I verify text "Invalid policy number entered"
  Then I report "Premium Pay for Metropolitan with invalid policy or membership number Pay for Metropolitan Insurance is successfull"

@TC_FINLSO_REG_MARKET_USSD_PaybillsAllianceshortterm_InvalidPolicyNumber!
Scenario: Premium_Pay for Alliance Insuarance Short term with invalid policy number_Pay for Alliance insurance short-term with invalid policy number
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterPolicyNumber" with value "InsuranceTypes.AllianceShortTerm_InvalidPolicyNumber"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Paybills - Alliance short term_InvalidPolicy" Service for "Handset.RegisteredCustomerThree"
  Then I verify text "Invalid policy number. Please try again:  "
  Then I report "Successful - Alliance Short Term with amount lower than allowed amount"

@TC_FINLSO_REG_MARKET_USSD_Premium_PayVodacomContractforself_PayVodacomContractforselfwithallvalidprerequisites!
Scenario: Premium_Pay Vodacom Contract for self_Pay Vodacom Contract forself with all valid prerequisites
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.VodacomContractsFullPaymentone" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "The Premium Customer is successfully complete  Vodacom Contract for self_Pay Vodacom Contract forself with all valid prerequisites"

@TC_FINLSO_REG_MARKET_USSD_Minor-SendMoneytovalidMSISDN_Tosendmoneywithoutwithdrawalfee!
Scenario: Minor-Send Money to valid MSISDN_To send money without withdrawal fee
  Given I generate name "correctMSISDN" with value "Handset.RegisteredCustomerThree.MSISDN"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.SendMoney_correctMSISDN" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" on "Handset.MinorCustomer"
  Then I report "Minor Customer Send Money to valid MSISDN To send money without withdrawal is done feeSuccessfully"

@TC_FINLSO_REG_MARKET_USSD_Minor-WithdrawalatAgentwithclosedTillclosedAgent/agenttilldoesnotgetWithdrawal!
Scenario:Minor-Withdrawal at Agent with closed Till closed Agent/agent till does not get Withdrawal
  Given I generate name "EnterTillNo" with value "Till.MpatOrgOne.TillNumber_Closed"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Customer Withdraw Cash" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.NotFoundError" on "Handset.MinorCustomer"
  Then I report "Minor Withdrawal at Agent with closed Till closed Agent does not get Withdrawal is successfull"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreAgentswithinsufficientfundsdeposittocustomeraccountException!
Scenario: Independent Store_ Agents with insufficient funds deposit to customer account(Exception)
  Given I generate name "EnterMSISDN" with value "Handset.RegisteredCustomerThree.MSISDN"
  Given I generate name "Amount" with value "Amount.Limit1300000"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Customer Deposit Cash At Agent" Service for "Handset.Till"
  Then I validate message "Messages.InsufficientFund_InternalTransfer" from "USSD.Sender" on "Handset.Till"
  Then I report "Independent Store_ Agents with insufficient funds deposit to customer account(Exception) Successfully"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreInternalTransfer-AgentmovemoneyfromFloattoM-Pesasuccessfully!
Scenario: Independent Store_ Internal Transfer - Agent move money from Float to M-Pesa successfully
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.InternalTransfer_FloatToMpesa" Service for "Handset.Till"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "SUCCESS : Independent Store_ Internal Transfer - Agent move money from Float to M-Pesa successfully"

@TC_FINLSO_REG_MARKET_USSD_Minor-WithdrawalAtAnAgentToperformWithdrawalByEnteringValidTill!
Scenario:Minor-Withdrawal at an Agent To perform withdrawal by entering valid Till
  Given I generate name "EnterTillNo" with value "10012"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Customer Withdraw Cash" Service for "Handset.MinorCustomer"
  Given I login to Fintech as "sp" operator
  When MakerChecker is on "Approve" task from group task for "Transaction Confirmation"
  Then I logout the "sp" portal and close the browser
  Then I validate message "Messages.Confirmed" on "Handset.MinorCustomer"
  Then I report "Minor-Withdrawal at an Agent To perform withdrawal by entering valid Till"

@TC_FINLSO_REG_MARKET_USSD_Premium_PayDSTVUsingInvalidCustomerNumber/smartcard_PayForDSTVUsingInvalidCustomerNumber/smartCard!
Scenario:Premium_Pay DSTV using invalid customer number/smartcard_Pay for DSTV using invalid customer number/smart card
  Given I generate name "EnterSmartCardNumber" with value "RAND_4"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Invalid_Pay Bill DSTV" Service for "Handset.RegisteredCustomerThree"
  Then I verify text "Invalid account number. "
  Then I report "The Premium customer cannot Pay Bill DSTV Using invalid customer number"

@TC_FINLSO_REG_MARKET_USSD_Minor-LAA_PayForLAAwithValidLeaseNumber!
Scenario:Minor-LAA_pay for LAA with valid lease number
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterLeaseNumber" with value "LAALeaseNumber"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Minor_Pay Bill LAA" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "The Customer successfully completed Pay Bill LAA"

@TC_FINLSO_REG_MARKET_USSD_Premium_BuyAirtimeForOther_BuyAirtimeForOtherWithBelowAllowedMinimumAmountM5!
Scenario:Premium_Buy Airtime For Other_Buy Airtime for other with below allowed minimum amount [M5]
  Given I generate name "Amount" with value "3"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.BuyAirTimeForOther" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.MinimumAirtime" on "Handset.RegisteredCustomerThree"
  Then I report ":Premium_Buy Airtime For Other_Buy Airtime for other with below allowed minimum amount is verified Successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium_EnsureBuyAirtimeForOther_BuyAirtimeForOtherWithInvalidMSISDNHappensSuccessfully!
Scenario: Premium_Ensure Buy Airtime For Other_Buy Airtime for Other with invalid MSISDN happens successfully
  Given I generate name "Amount" with value "Amount.Minimum"
  Given I generate name "ReceiverMSISDN" with value "26657_RAND_6"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.BuyAirTimeForOther" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.BuyAirTimeForOthersConfirmed" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_Ensure Buy Airtime For Other_Buy Airtime for Other with invalid MSISDN happens successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium_BuyAirtimeForSelf_BuyAirtimeForselfWithTheBelowMinimalDenomination!
Scenario:Premium_Buy Airtime for Self_Buy Airtime forself with the below minimal denomination
  Given I generate name "Amount" with value "3"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.BuyAirTimeForSelf" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.MinimumAirtime" on "Handset.RegisteredCustomerThree"
  Then I report "Premium_Buy Airtime for Self_Buy Airtime forself with the below minimal denomination is verified Successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium_BuyAirtimeForOther_ToPerformAirtimeTopUpByEnteringAllValidDetails!
Scenario:Premium_Buy Airtime For Other_To perform airtime top up by entering all valid details.
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Handset.MinorCustomer"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.BuyAirTimeForOther" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.BuyAirTimeForOthersConfirmed" on "Handset.RegisteredCustomerThree"
  Then I report ":Premium_Buy Airtime For Other_To perform airtime top up by entering all valid details is Successfull"

@TC_FINLSO_REG_MARKET_USSD_Minor-BuyAirtimeForOtherBuyAirtimeForOtherWithInvalidMSISDN!
Scenario:Minor-Buy Airtime For Other Buy Airtime for Other with invalid MSISDN
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "26657_RAND_6"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.BuyAirTimeForOther" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.BuyAirTimeForOthersConfirmed" on "Handset.MinorCustomer"
  Then I report "Minor-Buy Airtime For Other Buy Airtime for Other with invalid MSISDN is Successfull"

@TC_FINLSO_REG_MARKET_USSD_Minor-BuyAirtimeForOtherToPerformAirtimeTopUpByEnteringAllValidDetails!
Scenario:Minor-Buy Airtime For Other To perform airtime top up by entering all valid details.
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Handset.RegisteredCustomerThree"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.BuyAirTimeForOther" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.BuyAirTimeForOthersConfirmed" on "Handset.MinorCustomer"
  Then I report "Minor-Buy Airtime For Other To perform airtime top up by entering all valid details is verified Successfully"

@TC_FINLSO_REG_MARKET_USSD_PayBills_AllianceLife!
#If making another transaction within 48 hours use AllianceLife48Hours JSon Key!
Scenario: Premium_Pay for alliance Insurance with all prequisites available_Pay for Allicance insurance - success
  Given I generate name "PolicyNumber" with value "InsuranceTypes.AllianceLife"
  Given I generate name "EnterAmount" with value "Insurance Amount.AllianceLifeAmmount"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AllianceLife" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreAgentViewBalancetransactionbyenteringincorrectPINException!
Scenario: Independent Store_Agent View Balance transaction by entering incorrect PIN. (Exception)
  Given I generate name "EnterShortCode" with value "IndependentStoreAgentShortCode"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I generate name "PIN" with value "RAND_4"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.BalanceEnquiry_FloatAccount" Service for "Handset.Till"
  Then I verify text "You have entered incorrect PIN."
  Then I report "Independent Store_Agent View Balance transaction by entering incorrect PIN. (Exception) Successfully"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreIndependentAgentDeposittoCustomer-belowminimumamountException!
Scenario: Independent Store_ Independent Agent Deposit to Customer - below minimum amount (Exception)
  Given I generate name "EnterMSISDN" with value "Handset.RegisteredCustomerThree.MSISDN"
  Given I generate name "Amount" with value "Amount.Minimum"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Customer Deposit Cash At Agent" Service for "Handset.Till"
  Then I verify text "Failed to authenticate the transaction by limit rule Minimum Deposit at Agent."
  Then I report "Independent Store_ Independent Agent Deposit to Customer - below minimum amount (Exception) Successfully"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreAgentInternalTransferfromM-PesatoFloat!
Scenario: Independent Store_ Agent Internal Transfer - from M-Pesa to Float
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.TransferFromWorkingToFloat" Service for "Handset.Till"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "SUCCESS : Independent Store_ Agent Internal Transfer - from M-Pesa to Float"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayforElectricitywithanInvalidMeterNumber_PayforElectricityusinganinvalidmeterNumber!
Scenario: Minor-Pay for Electricity with an Invalid Meter Number_Pay for Electricity using an invalid meter Number
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAccountNumber" with value "RAND_10"
  Given I generate name "PIN" with value "Handset.MinorCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Invalid_Pay Bill LEC1" Service for "Handset.MinorCustomer"
  Then I verify text "The meter number is invalid"
  Then I report "Minor-Pay for Electricity with an Invalid Meter Number_Pay for Electricity using an invalid meter Number"

@TC_FINLSO_REG_MARKET_USSD_Minor-PayforWASCOwithanInvalidAccountNumber_PayforWASCOusinganinvalidaccountNumber!
Scenario: Minor-Pay for WASCO with an Invalid Account Number_Pay for WASCO using an invalid account Number
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "Account number" with value "RAND_10"
  Given I generate name "PIN" with value "Handset.MinorCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.Invalid_Pay Bill WASCO1" Service for "Handset.MinorCustomer"
  Then I verify text "The Number you entered is not a valid Vodacom Number"
  Then I report "Minor-Pay for WASCO with an Invalid Account Number_Pay for WASCO using an invalid account Number"

@TC_FINLSO_REG_MARKET_USSD_C2B_USSD-Merchantwithdrawfundsfromagentsuccessfully!
Scenario: C2B_USSD-Merchant withdraw funds from agent successfully.
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I generate name "PIN" with value "Handset.Till.PIN"
  Given I generate name "EnterShortCode" with value "010024"
  Given I generate name "Enter Amount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.AgentWithdrawalofCashusingOnceoffpayment1" Service for "Handset.Till"
  Then I validate message "Messages.OwnAccountFund" on "Handset.Till"
  Then I report "C2B_USSD-Merchant withdraw funds from agent successfully"

@TC_FINLSO_REG_MARKET_USSD_MinorPayforAllianceInsuranceShorttermwithinvalidpolicynumberPayforAllianceinsuranceshorttermwithinvalidpolicynumber!
Scenario: Minor-Pay for Alliance Insurance Short term with invalid policy number Pay for Alliance insurance short-term with invalid policy number
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "Policy Number" with value "DCA_RAND_7"
  Given I generate name "PIN" with value "Handset.MinorCustomer.PIN"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.AllianceShort-TermInvalidPolicyNumber" Service for "Handset.MinorCustomer"
  Then I verify text "You have entered the incorrect details 3 times"
  Then I report "Minor-Pay for Alliance Insurance Short term with invalid policy number Pay for Alliance insurance short-term with invalid policy number"

@TC_FINLSO_REG_MARKET_USSD_Minor-CustomerPayMerchant_PayMerchantofclosedaccount!
Scenario: Minor-Customer Pay Merchant_Pay Merchant of closed account
  Given I generate name "EnterTillNumber" with value "Handset.Till.Number"
  Given I generate name "ReferenceId" with value "TEST"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.PayBussiness" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Successfull - Pay for Minor-Customer Pay Merchant_Pay Merchant of closed account"

@TC_FINLSO_REG_MARKET_USSD_Minor-CustomerPayMerchant_PayMerchantunvalidtillnumber!
Scenario: Minor-Customer Pay Merchant_Pay Merchant unvalid till number
  Given I generate name "EnterTillNumber" with value "RAND_5"
  Given I generate name "ReferenceId" with value "TEST"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.PayBussiness" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.NotFoundError" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I report "Successfull - Pay for Minor-Customer Pay Merchant_Pay Merchant using Invaid Till Number"

@TC_FINLSO_REG_MARKET_USSD_IdependentStoreEnsurethatOperatorcanChangelanguagesuccessfully!
#Pending due to Message delay
Scenario: Idependent Store_ Ensure that Operator can Change language successfully
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Change Language To Southern Sotho" Service for "Handset.Till"
  Then I validate message "Messages.Change Language To Southern Sotho" from "USSD.Sender" on "Handset.Till"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Change Language To English" Service for "Handset.Till"
  Then I validate message "Messages.LanguageChangeToEnglishSuccessful" from "USSD.Sender" on "Handset.Till"
  Then I report " Idependent Store_ Ensure that Operator can Change language successfully"

@TC_FINLSO_REG_MARKET_USSD_IdependentStoreEnsureanOperatorcanchangePINsuccessfully!
Scenario: Idependent Store_ Ensure an Operator can change PIN successfully
  Given I generate name "NewPin" with value "RAND_4"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.ChangePinSuccessfully" Service for "Handset.Till"
  Then I validate message "Messages.ResetPinConfirmed" on "Handset.Till"
  Then I replace the "Handset.Till.PIN" value with "NewPin" in the "fin_handset_testdata" json in folder "FolderLocation.Regression"
  Then I report "Idependent Store_ Ensure an Operator can change PIN successfully"

@TC_FINLSO_REG_MARKET_USSD_IndependentStoreMyAccountServices-ChangePINusingBlacklistedPIN!
#Pending due to Message delay
Scenario: Independent Store_ My Account Services- Change PIN - using Blacklisted PIN
  Given I generate name "EnterBlackListedPin" with value "1111"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.ChangePin" Service for "Handset.Till"
  Then I validate message "Messages.Blacklisted" on "Handset.Till"
  Then I report "Independent Store_ My Account Services- Change PIN - using Blacklisted PIN successfully"

@TC_FINLSO_REG_MARKET_USSD_Premium_PayforAllianceInsurancewithinvalidpolicynumberPayforAllinaceinsurancewithinvalidpolicynumberandallotherprerequisitesavailable!
Scenario: Premium_Pay for Alliance Insurance with invalid policy number_Pay for Allinace insurance with invalid policy number and all other prerequisites available
  Given I generate name "PolicyNumber" with value "RAND_10"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AllianceLifeWithInvalidpolicynumber" Service for "Handset.RegisteredCustomerThree"
  Then I verify text "You have entered the incorrect details 3 times. Thank you for choosing Vodacom MPESA."
  Then I report "successfully completed Pay for Alliance Insurance with invalid policy number"

@TC_FINLSO_REG_MARKET_USSD_MinorCustomerSuccessfullyAbleToInitiateReversal!
Scenario: Minor-Advance Reversal [self-service reversal] _to confirm Advance Reversal
  #Pre-requisite
  Given I generate name "EnterTillNumber" with value "Handset.Till.Number"
  Given I generate name "ReferenceId" with value "TEST"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.PayBussiness" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.MinorCustomer"
  Then I get Receipt Number from "Messages.Confirmed" on "Handset.MinorCustomer" and store it in "receiptNumber"
  #Validation
  Given I dial USSD code "USSD.Code" for "Handset.MinorCustomer"
  When I select "Customer.InitiateReversal" Service for "Handset.MinorCustomer"
  Then I validate message "Messages.ReversalRequestMessage" from "USSD.Sender" on "Handset.MinorCustomer"

@TC_FINLSO_REG_MARKET_USSD_Premium_SuccessfullyAbleToInitiateReversal!
Scenario: Premium_Advance Reversal [self-service reversal]_To confirm Advance Reversal
  #Pre-requisite
  Given I generate name "EnterTillNumber" with value "Handset.Till.Number"
  Given I generate name "ReferenceId" with value "TEST"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.PayBussiness" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I get Receipt Number from "Messages.Confirmed" on "Handset.MinorCustomer" and store it in "receiptNumber"
  #Validation
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.InitiateReversal" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.ReversalRequestMessage" from "USSD.Sender" on "Handset.RegisteredCustomerThree"