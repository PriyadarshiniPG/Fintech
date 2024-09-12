@FINLSO_GPTC_USSD!
Feature: FINLSO_GPTC_USSD

@TC_FINLSO_GPTC_CustBalCheck!
Scenario:Customer - Balance Check USSD
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Balance Enquiry" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.CustomerBalance" from "USSD.Sender" on "Handset.RegisteredCustomerThree"

@TC_FINLSO_GPTC_ShowCustMiniStatement!
Scenario:Customer - Show Mini Statement USSD
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Show Mini Statement" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.MiniStatement" from "USSD.Sender" on "Handset.RegisteredCustomerThree"

@TC_FINLSO_GPTC_RegCustomerSendMoneyToRegCust266!
Scenario:Send Money to registered customer include 266
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Send Money" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Registered customer performed send money to registered customer and verified notification."

@TC_FINLSO_GPTC_RegCustomerSendMoneyToRegCustExclude266!
Scenario:Send Money to registered customer exclude 266
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Exclude266"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Send Money" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Registered customer performed send money to registered customer and verified notification."

@TC_FINLSO_GPTC_RegCustomerSendMoneyToRegCustWithWithdrawalFee!
Scenario:Send money to registered customer with withdrawal fees
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Send Money_WithWithdrawalFee" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Send Money_withdrawalfee" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Registered customer performed send money to registered customer and verified notification."

@TC_FINLSO_GPTC_CustWithdrawCashAtAgent!
Scenario:Customer - Withdraw Cash at Agent
  Given I generate name "EnterTillNo" with value "Handset.Till.Number"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Customer Withdraw Cash" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Withdraw From Agent" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer Withdraws Cash successfully"

@TC_FINLSO_GPTC_CustomerBuyAirtimeForSelf!
Scenario:Customer - Buy Airtime (for self)
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.BuyAirTimeForSelf" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.BuyAirTimeForSelfConfirmed" on "Handset.RegisteredCustomerThree"

@TC_FINLSO_GPTC_CustomerBuyAirtimeForOther!
Scenario:Customer - Buy Airtime (for other phone)
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "ReceiverMSISDN" with value "Customer.Registered_Customer2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.BuyAirTimeForOther" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.BuyAirTimeForOthersConfirmed" on "Handset.RegisteredCustomerThree"

@TC_FINLSO_GPTC_Customer_ChangeLaguage!
Scenario:Customer - Change Language USSD
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Change Language To Southern Sotho" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Kopo ea hao e netefalitsoe" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Change Language To English" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"

@TC_FINLSO_GPTC_SuperagentOrganisationtransferfundsfromM-pesaaccounttoFloataccount!
Scenario:Super agent Organisation transfer funds from M-pesa account to Float account
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.TransferFromWorkingToFloat" Service for "Handset.Till"
  Then I validate message "Messages.InternalTransfer_MpesaToFloat" from "USSD.Sender" on "Handset.Till"
  Then I report "SUCCESS : Super agent Organisation transfer funds from M-pesa account to Float account"

@TC_FINLSO_GPTC_VerifyRegCustAddRegCustAsBeneficiary!
Scenario:Beneficiary Lookup_Verify that  Registered Customer add Registered customer as beneficiary Via USSD and verify the Notification.
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
  Then I validate message "deleted successfully" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Customer add registered customer as beneficary Successfully"

@TC_FINLSO_GPTC_AgentDepositToAnotherAgent!
Scenario:Deposit to another Agent USSD
  Given I generate name "ShortCode" with value "ShortCode.ShortCode3"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit To Another Agent" Service for "Handset.Till"
  Then I validate message "Messages.Deposit To Another Agent" from "USSD.Sender" on "Handset.Till"
  Then I report "Agent successfully deposited to another agent and verified notification."

@TC_FINLSO_GPTC_MovemoneyfromWorkingaccounttoFloataccount!
Scenario: Move money from  Working account to Float account (Agent via USSD)
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.InternalTransfer_MpesaToFloat" Service for "Handset.Till"
  Then I validate message "Messages.InternalTransfer_MpesaToFloat" from "USSD.Sender" on "Handset.Till"
  Then I report "Move money from  Working account to Float account successfully"

@TC_FINLSO_GPTC_VerifythatRegisteredCustomerdeleteRegOrganizationAsBeneficiary!
Scenario: Beneficiary Lookup_Verify that Registered Customer delete existing Organization reference as beneficiary from list Via USSD  and verify the Notification.
  #Add beneficiary from USSD
  Given I generate name "Enter Short Code to add" with value "ShortCode.ShortCode3"
  Given I generate name "BeneficiaryTopOrgName" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AddBeneficiaryOrganization" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.AddBeneficiaryOrganizationAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  #Delete beneficiary from USSD
  Then I join two values "Enter Short Code to add" and "BeneficiaryTopOrgName" with separator " " store in "BeneficiaryTopOrgName"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.DeleteBeneficiaryOrganization" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.DeleteBeneficiaryOrganizationAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "RegCustAddRegOrganizationAsBeneficiary and Delete beneficiary from USSD"

@TC_FINLSO_GPTC_WithdrawalfromAgentbyCustomer!
Scenario: Withdrawal from Agent by Customer
  Given I generate name "EnterTillNo" with value "Handset.Till.Number"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Customer Withdraw Cash" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Withdraw From Agent" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Withdrawal from Agent by Customer successfully from USSD"

@TC_FINLSO_GPTC_VerifythatRegisteredCustomerdeleteRegCustAsBeneficiary!
Scenario: Beneficiary Lookup_Verify that Registered Customer delete existing beneficiary customer from list Via USSD  and verify the Notification.
  #Add beneficiary Customer from USSD
  Given I generate name "BeneficiaryMSISDN" with value "Customer.Registered_Customer2"
  Given I generate name "BeneficiaryMSISDNName" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AddBeneficiaryCustomer" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.AddBeneficiaryCustomerAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  #Delete beneficiary Customer from USSD
  Then I join two values "BeneficiaryMSISDN" and "BeneficiaryMSISDNName" with separator " " store in "BeneficiaryMSISDNName"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.DeleteBeneficiaryCustomer" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.DeleteBeneficiaryCustomerAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Delete existing beneficiary customer successfully from USSD"

@TC_FINLSO_GPTC_PaySchoolFees!
Scenario:Pay School fees
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "TillNumber" with value "InsuranceTypes.PayschoolFee"
  Given I generate name "ReferenceId" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.PaySchoolFees" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaySchoolFees" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Customer Pay School fees is Completed Successfully"

@TC_FINLSO_GPTC_PayMerchant!
Scenario:Pay Merchant
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "TillNumber" with value "Handset.Till.Number"
  Given I generate name "ReferenceId" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Merchant" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Customer Pay to Merchant is completed Successfully"

@TC_FINLSO_GPTC_VerifythatRegisteredCustomerPayBillRegOrgAsBeneficiary!
Scenario: Beneficiary Lookup_Verify that Registered Customer add Registered Pay Bill Organization reference as beneficiary Via USSD and verify the Notification.
  #Add beneficiary from USSD
  Given I generate name "Enter Short Code to add" with value "ShortCode.ShortCode3"
  Given I generate name "BeneficiaryTopOrgName" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AddBeneficiaryOrganization" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.AddBeneficiaryOrganizationAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  #Delete beneficiary from USSD
  Then I join two values "Enter Short Code to add" and "BeneficiaryTopOrgName" with separator " " store in "BeneficiaryTopOrgName"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.DeleteBeneficiaryOrganization" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.DeleteBeneficiaryOrganizationAccepted" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Registered Customer successfully added Org as beneficiary"

@TC_FINLSO_GPTC_WithdrawalfromAgentViaUSSD!
Scenario:Withdrawal from Agent via USSD
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "EnterShortCode" with value "ShortCode.ShortCode3"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.AgentWithdrawalofCash" Service for "Handset.Till"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "Withdrawal from Agent via USSD is completed Successfully"

@TC_FINLSO_GPTC_PayBills-LAA!
Scenario:Pay Bills - LAA
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterLeaseNumber" with value "LAALeaseNumber"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Bill LAA" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Pay Bill LAA"

@TC_FINLSO_GPTC_Deposittocustomerexclude266USSD!
Scenario: Deposit to customer (exclude 266) USSD
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
  Then I report "Deposit to customer with exclude 266 successfully from USSD"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Deposittocustomerinclude266USSD!
Scenario: Deposit to customer (include 266) USSD
  Given I generate name "ReceipientMobNo" with value "Include266"
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.Deposit to customer" Service for "Handset.Till"
  Then I report "Deposit to customer with include 266 successfully from USSD"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Complete"
  #Verify SMS
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
  Then I report "Deposit to customer with include 266 Transaction successfully completed"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_MoveMoneyFromFloatToWorkingAccount!
Scenario: Move money from Float to Working account (Agent via USSD)
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.InternalTransfer_FloatToMpesa" Service for "Handset.Till"
  Then I validate message "Messages.InternalTransfer_FloatToMpesa" from "USSD.Sender" on "Handset.Till"

# @TC_FINLSO_GPTC_Exception-VerifyAgentdepositnotwithinsamevicinity!
# Scenario:Exception - Verify Agent deposit not within same vicinity
#   Given I generate name "Amount" with value "Amount.Minimum1"
#   Given I generate name "EnterAgentshortcode" with value "Handset.Till.ShortCode"
#   Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.Deposit to customerone" Service for "Handset.Till"
#   Then I validate message "Messages.sameidentity" from "USSD.Sender" on "Handset.Till"
#   Then I report "Exception-VerifyAgentdepositnotwithinsamevicinity"

# @TC_FINLSO_GPTC_CustomerdepositcashatanAgentUSSDwithinsamevicinity!
# Scenario: Customer deposit cash at an Agent (USSD) within same vicinity
#   Given I generate name "ReceipientMobNo" with value "EXclude266"
#   Given I generate name "Amount" with value "Amount.Minimum1"
#   Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
#   Given I dial USSD code "USSD.Code" for "Handset.Till"
#   When I select "Till.Deposit to customer" Service for "Handset.Till"
#   Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.Till"
#   Then I report "Customer deposit cash at an Agent (USSD) within same vicinity"

@TC_FINLSO_GPTC_VerifyPaymerchanttransactionsarecharged1%!
Scenario: Verify Pay merchant transactions are charged 1%
  Given I generate name "Amount" with value "Amount.Minimum1"
  Given I generate name "TillNumber" with value "Handset.Till.Number"
  Given I generate name "ReferenceId" with value "TEST"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Merchant" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  #Taking Transaction
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.ReviewTransactionBo"
  Then I click on " Search " button in cite
  Then I check table "Table.ReviewTransaction" with multiple values as "Paymerchant" and click on "Reverse" of "Operation" column
  Then I click on "GenericLocators.DetailsTranctaion"
  Then I click on "GenericLocators.CloseViewDetailofTopOrg"
  Then I wait "4"
  Then I report "Customer Pay to Merchant is completed Successfully"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_Merchantisabletotransferfundstoownpersonalaccount!
Scenario: Merchant is able to transfer funds to own personal account
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.InternalTransfer_MPesaAccount" Service for "Handset.Till"
  Then I validate message "Messages.InternalTransfer_MPesaAccount" from "USSD.Sender" on "Handset.Till"
  Then I report "Merchant is able to transfer to MPesa-account is completed Successfully."

# @TC_FINLSO_GPTC_VerifyaqualifyingcustomergetsNtlatseforsendmoney!
# Scenario: Verify a qualifying customer gets Ntlatse for send money
#   Given I generate name "EnterAmount" with value "Amount.Minimum1"
#   Given I generate name "ReceipientMobNo" with value "MSISDNCustomer"
#   Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
#   When I select "Customer.Send Money_PhoneNumber" Service for "Handset.RegisteredCustomerThree"
#   Then I validate message "Messages.Send Money" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
#   Then I report "customer gets Ntlatse for sendmoney is completed Successfully."

# @TC_FINLSO_GPTC_Nkalime!
# Scenario: Verify unqualified Customer does not get Nkalime
#   Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
#   When I select "Customer.Loan" Service for "Handset.RegisteredCustomerThree"
#   Then I report "Verify unqualified Customer does not get Nkalime"

@TC_FINLSO_GPTC_Paybills-Metropolitan!
#If making another transaction within 48 hours use "Paybills - Metropolitan_48hrs" JSon Key!
Scenario: Paybills - Metropolitan
  Given I generate name "Policy Number" with value "InsuranceTypes.Metropolitan"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Paybills - Metropolitan" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Paybills - Metropolitan"

@TC_FINLSO_GPTC_PayBills-Wasco!
Scenario:Pay Bill - Wasco
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterAccountNumber" with value "WASCO Service Fees Disconnection Penalty"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Bill WASCO" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Paid" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Pay Bill_WASCO"

@TC_FINLSO_GPTC_PayBillfromSecondaryWallet!
Scenario:Pay Bills from Secondary Wallet
  Given I generate name "PolicyNumber" with value "InsuranceTypes.AllianceLife"
  Given I generate name "EnterAmount" with value "Insurance Amount.AllianceLifeAmmount"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AllianceLife" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully pay the bill through secondary wallet"

@TC_FINLSO_GPTC_PayBills_AllianceLife!
#If making another transaction within 48 hours use AllianceLife48Hours JSon Key!
Scenario: Pay Bills - Alliance
  Given I generate name "PolicyNumber" with value "InsuranceTypes.AllianceLife"
  Given I generate name "EnterAmount" with value "Insurance Amount.AllianceLifeAmmount"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AllianceLife" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"

@TC_FINLSO_GPTC_CustomerChangePIN!
Scenario: Customer Change PIN
  Given I generate name "NewPin" with value "RAND_4"
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                   | SearchBy     | SearchValue                   | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer1 | Label.MSISDN | Customer.Registered_Customer1 | Status.Active |
  Then I select "Reset PIN" in Operation
  When static text "Message.ResetPinSuccess" is visible
  Then I logout the "sp" portal and close the browser
  Then I get the value of initial pin from "Handset.RegisteredCustomerThree" for sms "Messages.ResetPinGenerated" and store in "PinGenerated"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.ResetPin" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.ResetPinConfirmed" on "Handset.RegisteredCustomerThree"
  Then I replace the "Handset.RegisteredCustomerThree.PIN" value with "NewPin" in the "fin_handset_testdata" json in folder "FolderLocation.Regression"
  Then I report "The Registered customer pin is been changed."

@TC_FINLSO_GPTC_BusinessdepositsmoneyatanHOorganization!
Scenario: Business deposits money at an HO organization
  Given I login to Fintech as "orgAHO" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                 | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.Organization Funds Management - Business Deposit | Short Code                       | ShortCode.ShortCode1           | Amount.Minimum1 | Reason Description |
  #Verify SMS
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Transaction is Completed successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_BusinesswithdrawalofmoneyfromHOorganization!
Scenario:Business withdrawal of money from HO organization
  Given I login to Fintech as "orgAHO" operator
  Then I initiate transaction with below details
  | Transaction_Services                                                    | Receiver_Identifier_Account_Type | Receiver_Identifier_Short_Code | Amount          | Reason             |
  | TransactionServices.Organization Funds Management - Business Withdrawal | Short Code                       | ShortCode.ShortCode1           | Amount.Minimum1 | Reason Description |
  #Verify SMS
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Transaction is Completed successfully"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GPTC_CustomerActivateDeviceViaUSSD!
Scenario:Customer - Device Activation
  Given I generate name "CustomerMSISDN" with value "Handset.ClosedTill.MSISDN"
  Given I generate name "FirstName" with value "TestING"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "IDNumber" with value "130_RAND_3"
  #Execute Command for Create Customer
  Given I login to Fintech as "sp" operator
  Then I create customer the with below details
  | Product Name                | MSISDN         | First Name | Middle Name | Last Name | City or Town     | Secret Question         | SecretAnswer       | ID Type          | ID Number | Document Received |
  | DropDown.Registeredcustomer | CustomerMSISDN | FirstName  | MiddleName  | LastName  | Label.CityorTown | DropDown.SecretQuestion | Label.SecretAnswer | Label.Nationalid | IDNumber  | Label.Yes         |
  #Executing command for validating message
  Then I validate message "activate" from "USSD.Sender" on "Handset.ClosedTill"
  #Taking the Pin for customer
  Then I get the value of initial pin from "Handset.ClosedTill" for sms "activate" and store in "PinGenerated"
  #Activating the customer!
  Given I generate name "PIN" with value "RAND_4"
  Given I generate name "EnterInitPin" with value "PinGenerated"
  Given I dial USSD code "USSD.Code" for "Handset.ClosedTill"
  When I select "Customer.Activating Customer" Service for "Handset.ClosedTill"
  #Searching and closing the customer
  When I search for "Customer" with below details
  | TableId                  | TableValues               | SearchBy     | SearchValue               | Status        | CloseTheSearch |
  | Table.CustomerInIdentity | Handset.ClosedTill.MSISDN | Label.MSISDN | Handset.ClosedTill.MSISDN | Status.Active | yes            |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_AgentOperatorActivation!
Scenario: Agent - Operator Activation
  Given I generate name "TillNumber" with value "RAND_6"
  Given I generate name "msisdn" with value "Handset.ClosedTill.MSISDN"
  Given I generate name "OperatorID" with value "Handset.ClosedTill.Operator ID"
  #Execute Command for Create Till
  Given I login to Fintech as "sp" operator
  Then I create Till with below details
  | Short_Code                      | MSISDN | Till_Number | Language | Operator_ID | Product           |
  | Handset.ClosedTill.TopShortCode | msisdn | TillNumber  | English  | ABC12345    | Available Product |
  #SMS
  Then I validate message "Messages.Till Creation" from "USSD.Sender" on "Handset.ClosedTill"
  #Execute Command for activate Till
  Given I generate name "EnterOperatorID" with value "Handset.ClosedTill.AssistantID"
  Given I generate name "EnterInitPin" with value "Handset.ClosedTill.PIN"
  Given I generate name "PIN" with value "RAND_4"
  Given I dial USSD code "USSD.Code" for "Handset.ClosedTill"
  When I select "Till.Activate_Till" Service for "Handset.ClosedTill"
  Then I validate message "Messages.activated" from "USSD.Sender" on "Handset.ClosedTill"
  Then I replace the "Handset.ClosedTill.PIN" value with "PIN" in the "fin_handset_testdata" json in folder "FolderLocation.Regression"
  Then I replace the "orgC2B.PIN" value with "PIN" in the "fin_testdata" json in folder "FolderLocation.Regression"
  #Search again and Close
  When I search for "Till" with below details
  | TableId    | TableValues | Query Condition                       | SearchBy    | Organization Short Code | SearchValue | Till Number | Status        | CloseTheSearch |
  | Table.Till | TillNumber  | Till Number + Organization Short Code | Till Number | ShortCode.ShortCode2    | TillNumber  | TillNumber  | Status.Active | yes            |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_GPTC_CustomerPayBetting!
Scenario:Customer Pay Betting
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterMerchantShortCode" with value "InsuranceTypes.BettingShortCode"
  Given I generate name "Reference" with value "Automation Testing Purpose"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.CustomerPayBetting" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "Customer is able to do betting transaction"

@TC_FINLSO_GPTC_PayBillS_DSTV!
Scenario:Pay BillS - DSTV
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterSmartCardNumber" with value "DSTVNumber"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Pay Bill DSTV" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Paid" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Pay Bill DSTV"

@TC_FINLSO_GPTC_VCLContracts!
Scenario: VCL Contracts
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.VodacomContractsFullPayment" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.SuccessfulPayment" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer is successfully complete VCL contracts payment"

@TC_FINLSO_GPTC_PayBillsAllianceLegal!
Scenario: Pay Bills - Alliance Legal  
  Given I generate name "EnterAmount" with value "Insurance Amount.AllianceLegalAmount"
  Given I generate name "EnterPolicyNumber" with value "InsuranceTypes.AllianceLegal2"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.AllianceLegal" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Pay Bill Alliance Life"

@TC_FINLSO_GPTC_PaybillsAllianceshortterm!
#If making another transaction within 48 hours use "Paybills - Allianceshortterm_48Hrs" JSon Key!
Scenario: Paybills - Alliance short term
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I generate name "EnterPolicyNumber" with value "InsuranceTypes.Alliance short term"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Paybills - Alliance short term" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Paybills Alliance short term"

@TC_FINLSO_GPTC_PaybillsNalediFuneralServices!
#If making another transaction within 48 hours use "Paybills - NalediFuneralServices_48Hrs" JSon Key!
Scenario: Paybills - Naledi Funeral Services
  Given I generate name "EnterAmount" with value "Insurance Amount.Naledi Funeral Services Amount"
  Given I generate name "EnterPolicyNumber" with value "InsuranceTypes.Naledi Funeral Services"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Paybills - Naledi Funeral Services" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Paybills Naledi Funeral Services"

@TC_FINLSO_GPTC_PaybillsMamothHealth!
#If making another transaction within 48 hours use "Paybills - Mamoth Health_48Hrs" JSon Key!
Scenario: Paybills - Mamoth Health
  Given I generate name "PolicyNumber" with value "InsuranceTypes.Mamoth Health"
  Given I generate name "EnterAmount" with value "Insurance Amount.Mamoth Health Amount"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.Paybills - Mamoth Health" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Paybills Mamoth Health Services"

@TC_FINLSO_GPTC_PayBillsLesothoFuneralServices!
#If making another transaction within 48 hours use "Paybills - Lesotho Funeral Services_48Hrs" JSon Key!
Scenario: PayBills - Lesotho Funeral Services
  Given I generate name "Enterpolicynumber" with value "InsuranceTypes.LesothoFuneralServices"
  Given I generate name "EnterAmount" with value "Insurance Amount.LesothoFuneralServices"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.PayBills Lesotho Funeral Services_48Hrs" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Paybills Lesotho Funeral Services"

@TC_FINLSO_GPTC_PayBillsLNIG!
#If making another transaction within 48 hours use "Paybills - LNIG_48Hrs" JSon Key!
Scenario: PayBills - LNIG
  Given I generate name "Enterpolicynumber" with value "InsuranceTypes.LNIG"
  Given I generate name "EnterAmount" with value "Amount.Minimum1"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.LNIG_48Hrs" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Paybills LNIG"

@TC_FINLSO_GPTC_PayBillsTransAfrica!
#If making another transaction within 48 hours use "PayBills - TransAfrica_48Hrs" JSon Key!
Scenario: PayBills - TransAfrica
  Given I generate name "Policy Number" with value "InsuranceTypes.TransAfrica1"
  Given I generate name "EnterAmount" with value "Insurance Amount.TransAfrica Amount"
  Given I dial USSD code "USSD.Code" for "Handset.RegisteredCustomerThree"
  When I select "Customer.PayBills - PayBills - TransAfrica_48Hrs" Service for "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I validate message "Messages.PaymentWasSuccessful" from "USSD.Sender2" on "Handset.RegisteredCustomerThree"
  Then I report "The Customer successfully completed Paybills TransAfrica"