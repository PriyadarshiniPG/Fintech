@FINLSO_GP_SANITY

Feature: Fintech2.0 Gptc Sanity Test case

@TC_SANITY_FINLSO_SearchOrgOperatorByUserNameOrgOperatorInActiveStatusSanity!
Scenario:Search OrgOperator By User Name When OrgOperator is in the Active Status
  Given I login to Fintech as "sp" operator
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | UserName         | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | Login.org.UserID | pass       |
  Then I click on " Verify " button in cite
  Then I wait "5"
  Then I report "Sp operator Search OrgOperator By User Name When OrgOperator is in the Active Status is successful"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_SetDisplayedRecordsOfVerificationRemarkToZeroInOrganizationSanity!
Scenario:Set Displayed Records of Verification Remark to zero
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
  Then I enter text for "GenericLocators.DisplayRecord" with value "0"
  Then I click on a button "Submit"
  Then I click on "Yes" button in popup window
  Then I switch to previousTab
  Then I click on "GenericLocators.ConfigurationSp"
  When I verify organization operator from Take a Call
  | ShortCode            | OperatorID                    | UserName         | PassOrFail |
  | ShortCode.ShortCode1 | OrgOperator.DefaultOperatorId | Login.org.UserID | pass       |
  Then I wait "5"
  Then I scroll "GenericLocators.ScrollNote" to view using "false" parameter
  Then I enter text area "Note" with value "Reason Description"
  Then I scroll "GenericLocators.ScrollHistory" to view using "true" parameter
  Then I click on " Submit " button in cite
  When static text "Submit Note Success!" is visible
  Then I report "The Note History displays no verification remark."
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Customer Care Audit Log" in the "Home" Page
  Then I check table "Table.CustomercareIdentity" with multiple values as "Take a Call" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.ClosebuttonINaudit"
  Then I report "The Customer Care Audit Log records the Take a Call event log correctly."
  Then I wait "5"
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
  Then I report "The Sp Operator Set Displayed Records of Verification Remark to zero and The Note History displays no verification remark."
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_TransferFromMerchantPayToMerchantViaWEBSanity!
Scenario:Transfer From Merchant Pay To Merchant Via WEB
  Given I login to Fintech as "org" operator
  Then I initiate transaction with below details
  | Transaction_Services                   | Primary_Identifier_ShortCode | Receiver_Identifier_Short_Code | Receiver_Identifier_Account_Type | Amount          | Reason             |
  | TransactionServices.MerchantToMerchant | ShortCode.ShortCode1         | ShortCode.ShortCode2           | Short Code                       | Amount.Minimum1 | Reason Description |
  Then I report "Transfer From Merchant Pay To Merchant Via WEB is Successfully Completed"
  Then I logout the "org" portal and close the browser

@TC_SANITY_FINLSO_ChangeTillService_RemoveTillProductSanity!
Scenario: Change Till Service_Remove Till Product
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.MSISDN"
  Then I enter text in "Label.MSISDN" with value "Till.MpatOrgOne.Till_MSISDN_Pending1"
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  Then I wait "6"
  Then I click on "GenericLocators.DetailsOrg"
  Then I Switch tab
  Then I wait "6"
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I check table "Table.ProductAdd" with multiple values as "Product Name|Super Agent Till" and click on "Delete" of "Operation" column
  Then I wait "3"
  Then I click on "GenericLocators.ConfirmButton"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  When static text "Product edited successfully" is visible
  Then I scroll "GenericLocators.Status" to view using "true" parameter
  Then I click on the "Audit Log" tab
  Then I select drop down "Category" with option "Identity Management"
  Then I select drop down "Event Group" with option "DropDown.Till"
  Then I click on "GenericLocators.TillEvent"
  Then I click on "GenericLocators.Tillproduct"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "GenericLocators.TillEvent|DropDown.Change Till Product" and click on "Detail" of "Operation" column
  Then I wait "6"
  Then I click on "GenericLocators.Closebutton"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_SANITY_FINLSO_SPCreateOrgOperatorViaWeb!
Scenario:Create Organization Operator - SP Operator Create WEB Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "spUsername" with value "spoperator_RAND_4"
  Then I create sp operator with below details
  | UserName   | Language                | AccessChannel     | Rule Profile | Gender        | Role | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | spUsername | Language.Southern Sotho | AccessChannel.API | sptest1      | Gender.Female | All  | Email                          | 2314563243465                 | Test Email |
  # Then I click on left child menu "SP Operator" in the "Home" Page
  # Then I click on "GenericLocators.CreateButton"
  # Then I select drop down "Language" with option "DropDown.English"
  # Then I enter text in "Label.Username" with value "userName"
  # Then I click on "Next" button in cite
  # Then I click on "Add" button in cite
  # Then I click on "SpRole.SPOperatorRole" checkbox in dialog window
  # Then I click on "Confirm" button in cite
  # Then I click on "Next" button in cite
  # Then I enter text in "Label.First Name" with value "FirstName"
  # Then I enter text in "Label.LastName" with value "LastName"
  # Then I enter text in "Label.Email" with value "Test Email"
  # Then I wait "5"
  #Then I scroll "GenericLocators.NotificationReceivingE-mail" to view using "false" parameter
  #Then I select drop down "Preferred Notification Channel" with option "Label.Email"
  #Then I enter text in "Label.NotificationReceivingE-mail" with value "Test Email"
  #Then I click on "Next" button in cite
  #Then I click on "Submit" button in cite
  Then I report "SP Operator Create WEB Organization Operator via Web"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_TILLAuditLog_ExportTillAuditLogsinPDFFormat!
Scenario: TILL Audit Log_Export Till Audit Logs in PDF Format
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber"
  Then I click on " Search " button in cite
  Then I click on " Search " button in cite
  Then I wait "10"
  Then I click on "GenericLocators.TillDetail"
  # Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber|Active" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I wait "5"
  Then I click on the "Audit Log" tab
  Then I select drop down "Category" with option "Identity Management"
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  Then I wait "15"
  Then I click on "GenericLocators.ExportButtonPdf"
  Then I wait "3"
  Then I click on "GenericLocators.PDFExport"
  Then I check file is downloaded in "PDF" format
  Then I report "Audit Log Export Till Audit Logs in PDF Format is successfull"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_SANITY_FINLSO_CashInViaUSSD!
# Pending - Need menu to do the operation
Scenario: Cash In Via USSD
  Given I generate name "CorrectPin" with value "Handset.Till.PIN"
  Given I generate name "AssistantID" with value "Handset.Till.AssistantID"
  Given I generate name "Amount" with value "Handset.TransactionAmount"
  Given I generate name "ReceipientMobNo" with value "Handset.RegisteredCustomer.MSISDN"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.CashInViaUssd" Service for "Handset.Till"
  Then I get Receipt Number from "Messages.CashInViaUssdConfirm" on "Handset.Till" and store it in "receiptNumber"
  Then I report "Agency can transfer from Working Account to Float Account via USSD"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Transaction" in the "Home" Page
  Then I enter text in "Label.Receipt No" with value "receiptNumber"
  Then I click on "Search" to check
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_GenerateRecReportReject!
Scenario: Generate Reconciliation Report - Reject
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank Reconciliation" in the "Home" Page
  Then I click on left child menu "Generate Reconciliation Report" in the "Home" Page
  Then I click on "Generate Summary" button in cite
  Then I click on "Confirm" button in cite
  Then I wait "10"
  Then I enter text area "Remark" with value "Reason Description"
  Then I wait "15"
  Then I click on "Submit" button in cite
  Then I click on left child menu "Approve Reconciliation Report" in the "Home" Page
  Then I check table "Table.ApproveReconciliation" with multiple values as "Login.sp.UserID" and click on "Process" of "Operation" column
  Then I click on "Reject" radio
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_ExportNotificationType!
Scenario: Export Notification Type
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Notification Type" in config
  Then I click on "GenericLocators.AllNotificationTypeEntry"
  Then I click on "Export" button in Notification Type Window
  Then I wait "80"
  Then I check file is downloaded in "Excel" format
  Then I switch to previousTab
  Then I report "Export Notification Type in Excel Format is successfull"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_SPToEditTrustLevel!
Scenario:Edit Trust Level
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Trust Level" in config
  Then I click on "GenericLocators.Search"
  Then I switch to next frame
  Then I wait "10"
  Then I check table in "Table.Gridclient" with multiple values as "Unregistered Customer" and click on "Edit" of "Operation" column
  Then I enter text for "GenericLocators.TrustLevelName" with value "registeredcustomer"
  Then I enter text area for "GenericLocators.TrustLevelDescription" with value "test"
  Then I click on "GenericLocators.Submit"
  Then I click on "Yes" button in popup window
  Then I click on "GenericLocators.Return"
  Then I close the current tab
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Reporting"
  Then I switch to next frame
  Then I scroll "GenericLocators.ConfigurationItem" to view using "false" parameter
  Then I click on "GenericLocators.Buttongroup"
  Then I switch to next frame
  Then I check table in "Table.Gridclient" with multiple values as "810322:registeredcustomer" and click on "View" of "Operation" column
  Then I switch to previousTab
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_ResetPINBySPOperatorViaWeb!
Scenario:Reset PIN By SP Operator via Web
  Given I login to Fintech as "sp" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues       | SearchBy                      | Operator Id                    | SearchValue           | Status        |
  | Table.OrganizationOperator | ShortCode.OrgOper | Label.Organization Short Code | OrgOperator.DefaultOperatorId8 | ShortCode.ShortCode12 | Status.Active |
  Then I select "Reset PIN" in Operation
  When static text "The request must be approved by another operator." is visible
  Then I click on "Confirm" button in cite
  When MakerChecker is on "Approve" task from group task for "Approve 'Reset Organization Operator PIN'"
  Then I report "The Sp operator reset the Organization operator via web"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_CommissionDailySettlementManuallyByTransaction!
# passed Pending:the commission period(Date) is in disable state un able to access the calender
#Tried with various period in same month but it's throwing message stating The settlement period is inconsecutive or the settlement result status is abnormal.
Scenario:Commission Daily Settlement Manually By Transaction
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in org of the "Home" Page
  Then I click on left child menu "Commission" in org of the "Home" Page
  Then I click on menu "Commission Settlement Result"
  Then I click on " Initiate " button in cite
  Then I enter text for "GenericLocators.CommissionOrganizationShortcode" with value "ShortCode.ShortCode1"
  Then I select drop down "Currency" with option "DropDown.LSL"
  Then I enter text for "GenericLocators.CommissionPeriod" with value "CommissionPeriod"
  Then I wait "3"
  Then I click on "GenericLocators.CommissionAccount"
  Then I click on "GenericLocators.CommissionAccountSelect"
  Then I wait "3"
  Then I click on " Submit " button in cite
  When static text "Commission payment reviewed successfully." is visible
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.OrgOper"
  Then I select drop down "Status" with option "Created"
  Then I click on " Search " button in cite
  Then I switch to next frame
  Then I check table of "Table.Commission" with multiple values as "010228-Venkatmain1" and click on "Detail" of "Operation" column
  Then I report "Sp Operator Commission Daily Settlement Manually By Transaction"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_CloseMyOrganizationOperatorStatusviaWeb!
Scenario: Close My Organization Operator Status via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgUsername" with value "OrgOperator_RAND_4"
  Given I generate name "msisdn" with value "8613000_RAND_6"
  Given I generate name "OpeId" with value "OperId_RAND_6"
  Then I create organization operator with below details
  | ShortCode             | Language                | AccessChannel | UserName    | MSISDN | OperatorId | Role                                                                   | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | OrgOperator.ShortCode | Language.Southern Sotho | Web           | OrgUsername | msisdn | OpeId      | OrgOperRole,B2C Operator,C2B Operator,[Open API] API Key Administrator | SMS                            | 2314563243465                 | Test Email |
  Then I logout the "sp" portal and close the browser
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode"
  Then I enter text in "Label.Username" with value "OrgUsername"
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "OrgOperator.ShortCode" and click on "Close" of "Operation" column
  Then I select drop down "Reason" with option "Not Use"
  Then I enter text area "Remark" with value "test"
  Then I click on "GenericLocators.SubmitButtonForCloseOperatorPopup"
  Then I click on "GenericLocators.ConfirmPopupForOperatorRequest"
  Then I wait "5"
  Then I logout the "org" portal and close the browser
  Given I login to Fintech as "sp" operator
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator Status'"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|LookUp Beneficiary" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_InitiatorinvestigatingchangeorganizationoperatorKYCworkflowtaskbySPoperator!
Scenario: Initiator investigating change organization operator KYC workflow task by SP operator
  Given I login to Fintech as "sp" operator
  Given I generate name "FirstName" with value "AutomationTest"
  Given I generate name "OrgUsername" with value "OrgOperator_RAND_4"
  Given I generate name "msisdn" with value "8613000_RAND_6"
  Given I generate name "OpeId" with value "OperId_RAND_6"
  Then I create organization operator with below details
  | ShortCode             | Language                | AccessChannel | UserName    | MSISDN | OperatorId | Role                                                                   | Gender        | Preferred Notification Channel | Notification Receiving MSISDN | Email      |
  | OrgOperator.ShortCode | Language.Southern Sotho | Web           | OrgUsername | msisdn | OpeId      | OrgOperRole,B2C Operator,C2B Operator,[Open API] API Key Administrator | Gender.Female | SMS                            | 2314563243465                 | Test Email |
  Then I click on the "KYC Info" tab
  Then I click on "GenericLocators.EditKYC"
  Then I scroll "GenericLocators.IdDetailsScroll" to view using "false" parameter
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.ConfirmButton"
  When MakerChecker is on "Investigate" task from group task for "Approve 'Change Organization Operator KYC'"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Task Audit Log" in the "Home" Page
  Then I click on "Search" button in cite
  Then I report "Initiator investigating change organization operator KYC workflow task Successfully Completed"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Operator KYC'"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_ChangeOrganizationOperatorsLanguage!
Scenario: Change Organization Operator's Language
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode"
  Then I enter text in "Label.Username" with value "Prak"
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "Label.Username|Prak" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I wait "10"
  Then I change Language in OrgPortal with value "Southern Sotho" and Remark as "test"
  When static text "Change Language success!" is visible
  #post-requsite
  Then I change Language in OrgPortal with value "English" and Remark as "test"
  When static text "Change Language success!" is visible
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_SANITY_FINLSO_DownloadBulkPaymentTaskTemplatebyOrgOperator!
Scenario: Download Bulk Payment Task Template by Org Operator
  Given I login to Fintech as "org" operator
  Then I click on "Business Center" on button in top menu
  Then I click on left child menu "Bulk Task Template Download " in org of the "Business Center" Page
  Then I enter text in "Label.Tamplate Name" with value "Payment"
  Then I click on " Search " button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "Label.Tamplate Name|PAYMENT" and click on "Download" of "Operation" column
  Then I wait "3"
  Then I check file is downloaded in "CSV" format
  Then I click on "homepage.ProfileOrg"
  Then I click on "homepage.OrgMypreference"
  Then I click on "GenericLocators.MyprefAuditLog1"
  Then I select drop down "Category" with option "Task"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "Event" and click on "Detail" of "Operation" column
  Then I wait "5"
  Then I click on "GenericLocators.Closebutton"
  Then I logout the "org" portal and close the browser

@TC_SANITY_FINLSO_RejectWorkflowTasks!
Scenario: Reject Workflow Tasks
  Given I login to Fintech as "sp" operator
  When I search for "Organization Operator" with below details
  | TableId                    | TableValues          | SearchBy                      | Operator Id                    | SearchValue          | Status        |
  | Table.OrganizationOperator | ShortCode.ShortCode1 | Label.Organization Short Code | OrgOperator.DefaultOperatorId3 | ShortCode.ShortCode1 | Status.Active |
  Then I edit Identity Status in "Organization operator" with value "Suspended"
  Then I report "The status of the Organization Operator changes to Suspended."
  When MakerChecker is on "Reject" task from group task for "Approve 'Change Organization Operator Status'"
  Then I click on left child menu "Task Center" in the "Home" Page
  Then I wait "3"
  Then I click on "GenericLocators.TaskManagement"
  Then I click on "GenericLocators.TaskHistory"
  Then I wait "3"
  Then I click on "Search" button in cite
  Then I check table of "Table.Commission" with multiple values as "Change Organization Operator Status" and click on " Detail " of "Operation" column
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Task Audit Log" in the "Home" Page
  Then I check table "Table.TaskAuditlog" with multiple values as "Reject workflow task" and click on "Detail" of "Operation" column
  Then I wait "3"
  Then I click on "GenericLocators.CloseForViewDetails"
  Then I report "The RejectWorkflow Task successfully"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_ChangethePINoforganizationOperatoronweb/handsetsuccess!
# passed - error in steps
Scenario: Change the PIN of organization Operator on web/handset success
  Given I login to Fintech as "orgC2B" operator
  Then I click on "homepage.ProfileOrg"
  Given I generate name "newpin" with value "2_RAND_3"
  Then I click on "homepage.OrgMypreference"
  Then I click on "GenericLocators.ChangePIN"
  Then I enter text in "Label.PassWord" with value "Login.orgC2B.password"
  Then I click on "Next" button in cite
  Then I enter text in "Current PIN" with value "Login.orgC2B.PIN"
  Then I enter text in "New PIN" with value "newpin"
  Then I enter text in "Confirm PIN" with value "newpin"
  Then I click on " Submit " button in cite
  When static text "Operation succeeded." is visible
  # Then I replace the "Login.orgC2B.PIN" value with "newpin" in the "fin_testdata" json in folder "FolderLocation.Gptc"
  Then I replace the "Login.orgC2B.PIN" value with "newpin" in the "fin_testdata" json in folder "FolderLocation.Regression"
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I click on "GenericLocators.MyprefAuditLog1"
  Then I select drop down "Category" with option "Identity Management"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "Change Organization Operator PIN" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.Closebutton"
  Then I logout the "org" portal and close the browser

@TC_SANITY_FINLSO_SpOperatorSuccessfullyTransfersAnM-PESAAccountToTransaction!
Scenario:An SP operator successfully transfers an M-PESA account to a transaction
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                                         | Amount          | Reason             |
  | TransactionServices.OrganizationFundsManagement-FloatToMPesa | Amount.Minimum1 | Reason Description |
  Then I report " SP operator successfully transfers an M-PESA account to a transaction"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_ApproveTheTransaction!
Scenario:Approve the transaction.
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I initiate transaction with below details
  | Transaction_Services                        | Receiver_Identifier_Account_Type | Receiver_Identifier_MSISDN    | Amount          | Reason             |
  | TransactionServices.SalaryPaymentToCustomer | MSISDN                           | Customer.Registered_Customer1 | Amount.Minimum1 | Reason Description |
  Then I close tab near to home tab
  Then I close tab near to home tab
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I wait "5"
  When MakerChecker is Review Transaction "Table.ReviewTransaction" for ReceiptNo "transactionReceiptNum" Status "Approve"
  Then I logout the "sp" portal and close the browser
  Then I validate message "Messages.Confirmed" from "USSD.Sender" on "Handset.RegisteredCustomerThree"
  Then I report "The transaction is successfully approved for Salary Pay to Customer"

@TC_SANITY_FINLSO_TopOrgValidationModeSPPortal!
Scenario: Top Organization set the Validation Mode Validation in SP Portal
  Given I login to Fintech as "spBackoff" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I create top organization with below details
  | Product                       | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Commission Settlement Configuration | Validation Mode     |
  | C2B – Single Account Merchant | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | default settle template             | External Validation |
  Then I report "Sp operator back office can create Top Organization - B2C Organisation successfully"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_BulkTransactionReversalviaOrgPortal!
Scenario: Bulk Transaction Reversal via Org Portal.
  Given I login to Fintech as "org" operator
  Given I generate name "BTR" with value "BTR_RAND_2"
  Then I click on "Business Center" on button in top menu
  Then I click on " Add " button in cite
  Then I wait "3"
  Then I select drop down "Bulk Type" with option "Bulk Transaction Reversal"
  Then I enter text in "Label.Plan Name" with value "BTR"
  Then I select the file to upload from "BULK_TRANSACTION_REVERSAL.CSV"
  Then I wait "30"
  Then I scroll "GenericLocators.ScrollTimeschedule" to view using "false" parameter
  Then I enter text area "Description" with value "Reason Description"
  Then I click on "Next Available Time Slot" radio
  Then I click on "Submit" button in cite
  Then I wait "3"
  Then I click on "GenericLocators.ConfirmButton"
  Then I report "Task plan created successfully"
  Then I scroll page to top
  Then I click on " View Detail >> " to check
  Then I wait "3"
  Then I click on "GenericLocators.DownloadIconBulkOrg"
  Then I wait "5"
  Then I check file is downloaded in "CSV" format
  Then I click on "homepage.ProfileOrg"
  Then I click on "homepage.OrgMypreference"
  Then I click on "GenericLocators.MyprefAuditLog1"
  Then I select drop down "Category" with option "Task"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "Create Bulk Plan" and click on "Detail" of "Operation" column
  Then I wait "5"
  Then I click on "GenericLocators.Closebutton"
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_SANITY_FINLSO_BulkResetCustormerPINViaPortal!
Scenario:Bulk Reset Custormer PIN Via Portal
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Bulk" in the "Home" Page
  Then I click on menu "Bulk Task Plan"
  Then I wait "5"
  Then I click on "GenericLocators.CreateBulk"
  Then I wait "5"
  Then I enter text in "Label.Plan Name" with value "TestingAutomation"
  Then I select drop down "Bulk Type" with option "Reset Customer PIN"
  Then I select the file to upload from "RESET_CUSTOMER_PIN.XML"
  Then I wait "10"
  Then I scroll "GenericLocators.ScrollTimeschedule" to view using "false" parameter
  Then I click on "GenericLocators.BulkAvailableTimeSlot"
  Then I enter text area "Description" with value "Reason Description"
  Then I click on " Submit " button in cite
  Then I click on " View Detail >> " to check
  Then I wait "10"
  Then I report "Bulk Reset Custormer PIN Via Portal"
  Then I logout the "sp" portal and close the browser

@TC_SANITY_FINLSO_AgencyTransferWorkingToFloatViaUSSD!
Scenario: Agency Transfer from Working Account to Float Account via USSD
  Given I generate name "CorrectPin" with value "Handset.Till.PIN"
  Given I generate name "EnterAssistantID" with value "Handset.Till.AssistantID"
  Given I generate name "EnterAmount" with value "Handset.TransactionAmount"
  Given I dial USSD code "USSD.Code" for "Handset.Till"
  When I select "Till.TransferFromWorkingToFloat" Service for "Handset.Till"
  Then I get Receipt Number from "Messages.InternalTransfer_MpesaToFloat" on "Handset.Till" and store it in "receiptNumber"
  Then I report "Agency can transfer from Working Account to Float Account via USSD"
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Transaction" in the "Home" Page
  Then I check the Transaction ReceiptNo "receiptNumber"
  Then I logout the "sp" portal and close the browser