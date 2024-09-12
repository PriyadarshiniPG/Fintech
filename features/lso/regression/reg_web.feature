@FINLSO_GP_WEB
Feature: Fintech2.0 Gptc Web feature

@TC_FINLSO_AttemptCallFailSuspendCustomer!
Scenario: Customer Service - Attempt Take a Call Failed Suspened Customer when customer fails to answer questions for X times, the system sets the customer status to Customer Care Suspended
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "User Service" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "Customer.Registered_Customer_One"
  Then I click on a "Search"
  Then I check table "Table.CustomerInUserService" with multiple values as "Customer.Registered_Customer_One|Active" and click on "Detail" of "Operation" column
  When static text "Verify Customer" is visible
  Then I click on Generic "Fail"
  Then I click on "Submit" button in cite
  Then I report "Attempt Take a Call Failed Suspened Customer when customer fails to answer questions for X times, the system sets the customer status to Customer Care Suspended"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureSpTakeCallByMsisdn!
Scenario: Customer Care Service - Ensure SP operator can take Customer Take Call Search by MSISDN
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "User Service" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "Customer.Registered_Customer_Two"
  Then I click on a "Search"
  Then I check table "Table.CustomerInUserService" with multiple values as "Customer.Registered_Customer_Two" and click on "Detail" of "Operation" column
  When static text "Verify Customer" is visible
  Then I click on Generic "Pass"
  Then I click on "Submit" button in cite
  When static text "Customer.Registered_Customer_Two" is visible
  Then I report "The SP operator can take Customer Call Search by MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureSpCanViewTillViaWeb!
Scenario: Ensure SP operator can view till info via web
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                | SearchBy          | SearchValue                | Status                |
  | Table.Till | Till.MpatOrgOne.TillNumber | Label.Till Number | Till.MpatOrgOne.TillNumber | Status.Pending Active |
  Then I report "The SP operator can view till info via web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureSpCantCreateTillIfNumOutOfRange!
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
  Then I scroll "GenericLocators.SelectedProduct" to view using "false" parameter
  Then I click on "GenericLocators.AvaliableProduct"
  Then I click on "GenericLocators.ArrowRightButton"
  Then I click on "Submit" button in cite
  Then I check error text "till number not match rule:^([0-9A-Za-z]{4,12})$" is displayed
  Then I report "The SP operator can't create till if till number is out of range"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SpOperatorCantCreatetillIfMSISDNisoutofrange!
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

@TC_FINLSO_AttemptspoperatorcantbecreatetillIftillMSISDNisAlreadyUsedbyanotherTill!
Scenario: Attempt sp operator can't be create till. If till MSISDN is Already Used by another Till
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode2"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "Till.MpatOrgOne.MSISDN"
  Then I click on "GenericLocators.TillAutogeneratecode"
  Then I wait "4"
  When static text "The MSISDN already exists." is visible
  Then I report "The till MSISDN is Already Used by another Till unable to Create Till via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorCanAbleToCreateTillViaWeb!
Scenario:Ensure SP Operator can able to Create Till via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "TillMSISDN" with value "2665000_RAND_4"
  Given I generate name "TillNumber" with value "20_RAND_3"
  Then I create Till with below details
  | Short_Code           | MSISDN     | Till_Number | Language | Operator_ID | Product           |
  | ShortCode.ShortCode2 | TillMSISDN | TillNumber  | English  | ABC1        | Available Product |
  Then I report "The SP Operator can able to Create Till via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorIsAbleToArchiveAProject!
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

@TC_FINLSO_SPOperatorIsAbleTopublishAProject!
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

@TC_FINLSO_SPOperatorIsAbleTotoUnlockAproject!
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

@TC_FINLSO_SPOperatorIsAbleTotolockAproject!
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

@TC_FINLSO_SPOperatorIsAbleToRejectaKYC!
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

@TC_FINLSO_SPOperatorCanUseTillMSISDNWhichisAlreadyUsedByCustomer!
Scenario:Ensure SP operator can use Till MSISDN which is already used by Customer
  Given I login to Fintech as "sp" operator
  Given I generate name "TillNumber" with value "RAND_8"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode2"
  Then I enter text in "Label.MSISDN" with value "Till.MpatOrgOne.MSISDN"
  Then I enter text in "Label.Till Number" with value "TillNumber"
  Then I select drop down "Language" with option "DropDown.English"
  When static text "msisdn has been used" is visible
  Then I report "The SP operator can use Till MSISDN which is already used by Customer"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPNotAllowCreateTillMSISDNAlreadyUsedByOrgOperator!
Scenario: Attempt SP operator not allow to create till if till MSISDN already used by Organization Operator
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I enter text in "Label.MSISDN" with value "OrgOperator.MSISDN_2"
  Then I enter text in "Label.Till Number" with value "OrgOperator.Till"
  Then I select drop down "Language" with option "DropDown.English"
  When static text "Msisdn has been used" is visible
  Then I click on " Confirm" button in cite
  Then I report "The SP operator not allow to create till if till MSISDN already used by Organization Operator"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPAbleToCreateNewVersionForReleasedDeactivedKYC!
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

@TC_FINLSO_SPOperatorIsAbleTodeactivateaKYC!
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

@TC_FINLSO_EnsuerThatSPOperatorCanDeleteKYCthatAreNotReleased!
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

@TC_FINLSO_ResetOrganizationOperatorPINthatResetOrganizationOperatorPIN!
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

@TC_FINLSO_EnsureSPResetCustomerPINThroughCustomerCareChannel!
Scenario:Reset Customer PIN - Ensure that SP to Reset Customer PIN Through the customer care channel
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "User Service" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "Customer.Registered_Customer_Two"
  Then I click on a "Search"
  Then I check table "Table.CustomerInUserService" with multiple values as "Customer.Registered_Customer_Two|Active" and click on "Detail" of "Operation" column
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

@TC_FINLSO_EnsureSPResetCustomerPIN!
Scenario:Reset Customer PIN - Ensure that the SP to Reset Customer PIN
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnCustomer" with value "Customer.Registered_Customer_Two"
  Then I click on a "Search"
  Then I check table "Table.CustomerInIdentity" with multiple values as "Customer.Registered_Customer_Two" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.OperatorButtonForCustomer"
  Then I click on "GenericLocators.ResetPin"
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitResetForCustomer"
  When static text "Reset PIN SUCCESS" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCreateHANDSETOrgOpViaWeb!
Scenario:Create Organization Operator - SP Operator Create HANDSET Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "OperatorId" with value "RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text for "GenericLocators.Organization_Shortcode_Create" with value "ShortCode.MpatOrg"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text in "Label.Operator ID" with value "OperatorId"
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_One"
  Then I click on "Next" button in cite
  Then I click on "Add Role" button in cite
  Then I click on "GenericLocators.Checkboxbutton"
  Then I click on "GenericLocators.Confirmbutton"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  When static text "Operation succeeded." is visible
  Then I close tab near to home tab
  Then I close tab near to home tab
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.MpatOrg"
  Then I enter text in "Label.Operator ID" with value "OperatorId"
  Then I click on a "Search"
  Then I wait "5"
  Then I check table "Table.OrganizationOperatorColumns" with multiple values as "ShortCode.MpatOrg|OperatorId" and store "TableList.OrgOperatorTable.StatusColNum" column value in "orgOperatorStatus"
  Then I check value of "orgOperatorStatus" is "Pending Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCanCreateProjectOnThePortal!
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

@TC_FINLSO_SPCanCreateGroupKYCOnPortal!
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

@TC_FINLSO_SPShouldNotSeeUnlockPinWhenCustomerPinIsNormal!
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

@TC_FINLSO_OrgOperatorSpCreateHANDSETOrgOperatorViaWeb!
Scenario:Create Organization Operator - SP Operator Create HANDSET Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "OperatorId" with value "RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "Label.Handset" checkbox
  Then I enter text in "Label.Operator ID" with value "OperatorId"
  Then I scroll "GenericLocators.ScrollContact" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_Four"
  Then I click on "Next" button in cite
  Then I click on "Add Role" button in cite
  Then I click on "OrgOpRole.Test001" checkbox in dialog window
  Then I click on "GenericLocators.Confirmbutton"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  When static text "Operation succeeded." is visible
  Then I close tab near to home tab
  Then I close tab near to home tab
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I click on a "Search"
  Then I report "SP Operator Create HANDSET Organization Operator via Web and it is in Pending Active state"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatoLogoutSPPortal!
Scenario:SP Operator Logout SP Portal
  Given I login to Fintech as "sp" operator
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureSPOperatorCreateWEBSPOperatorViaWeb!
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

@TC_FINLSO_SPCreateAPIOrgOpViaWebUserNameAlreadyUsed!
Scenario:Create Organization Operator - Exception - Attempt SP Operator Create API Organization Operator via Web - User Name Already Used
  Given I login to Fintech as "sp" operator
  Given I generate name "userName" with value "Techtest"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "Label.API" checkbox
  Then I enter text in "Label.User Name" with value "userName"
  Then I scroll "GenericLocators.ScrollContact" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_Four"
  Then I click on "Next" button in cite
  Then I scroll "GenericLocators.ScrollLanguage" to view using "true" parameter
  Then I check error text "The User Name is existed" is displayed
  Then I report "SP Operator Can't Create API Organization Operator via Web_User Name Already Used"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCreateAPIOrgOperatorViaWeb!
Scenario: Create Organization Operator - SP Operator Create API Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "userName" with value "Techtest_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "Label.API" checkbox
  Then I enter text in "Label.User Name" with value "userName"
  Then I scroll "GenericLocators.ScrollContact" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_Four"
  Then I click on "Next" button in cite
  Then I click on "Add Role" button in cite
  Then I click on "OrgOpRole.Test001" checkbox in dialog window
  Then I click on "GenericLocators.Confirmbutton"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  When static text "Operation succeeded." is visible
  Then I close tab near to home tab
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I enter text in "Label.User Name" with value "userName"
  Then I click on a "Search"
  Then I check table "Table.OrganizationOperator" with multiple values as "userName" and click on "Detail" of "Operation" column
  Then I report "SP Operator Create API Organization Operator via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCreateChildAggregatorOrganizationViaWeb!
Scenario:Create Organization - Ensure SP Operator Create Child Aggregator Organization via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "Product" with value "CashIn2"
  Given I generate name "Role" with value "test_role01"
  Given I generate name "OrgName" with value "ChildAgg_RAND_4"
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
  Then I click on "GenericLocators.OptionAggregator"
  Then I click on "GenericLocators.ChildSubAgentModel"
  Then I click on "GenericLocators.OptionAggregator"
  Then I click on "Next" button in cite
  Then I click on "GenericLocators.CreateSubmit"
  When static text "Child organization created successfully, please wait for approving." is visible
  Then I click on "View Detail" to check
  Then I report "SP Operator Create Child Aggregator Organization via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_AttemptSPCreateRegCusViaWebMSISDNOutOfRange!
Scenario:Create Customer - Exception - Attempt SP Operator Create Registered Customer via Web - MSISDN is out of Range
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "26659999999_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I select drop down "Language" with option "DropDown.English"
  Then I check error text "The msisdn is not in the number segment specified for registered customers" is displayed
  Then I report "SP Operator Create Can't Registered Customer via Web_MSISDN is out of Range"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCreateRegCusViaWebMandatoryverificationBasicProduct!
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
  Then I select drop down "Language" with option "DropDown.English"
  Then I scroll "GenericLocators.ScrollPersonalDetail" to view using "false" parameter
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I enter text in "Date of Birth" with value "DateOfBirth"
  Then I click on " Male " radio
  Then I scroll "GenericLocators.ScrollAddressDetail" to view using "false" parameter
  Then I enter text in "Label.CityorTown" with value "City"
  Then I select drop down "Secret Question" with option "DropDown.SecretQuestion"
  Then I enter text in "Label.SecretAnswer" with value "SecretAnswer"
  Then I click on "Next" button in cite
  Then I check error text "Please select the default product" is displayed
  Then I report "SP Operator Can't Create Registered Customer via Web_Mandatory verification: basic product"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCreateRegisteredCustomerViaWeb!
Scenario:Create Customer - Ensure SP Operator Create Registered Customer via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "132000_RAND_5"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I wait "5"
  Then I click on "+ Add Basic Product " button in cite
  Then I click on "GenericLocators.Fintech2TestProduct" radio in dialog window
  Then I click on "GenericLocators.OkButtonForAddBasicProduct"
  Then I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "CustomerMSISDN"
  Then I scroll "GenericLocators.ScrollPersonalDetail" to view using "false" parameter
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I enter text in "Date of Birth" with value "DateOfBirth"
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
  When static text "Create completed, please waiting for approving." is visible
  Then I close tab near to home tab
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "CustomerMSISDN"
  Then I click on a "Search"
  Then I check table "Table.CustomerInIdentity" with multiple values as "CustomerMSISDN" and click on "Detail" of "Operation" column
  Then I report "SP Operator can Create Registered Customer via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCreateWEBandHANDSETOrgOperatorViaWeb!
Scenario:Create Organisation Operator - Ensure SP Operator Create WEB and HANDSET Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "userName" with value "Techtest_RAND_4"
  Given I generate name "OperatorId" with value "RAND_4"
  Given I generate name "Role" with value "test_role03"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I click on "Label.Web" checkbox
  Then I click on "Label.Handset" checkbox
  Then I enter text in "Label.Operator ID" with value "OperatorId"
  Then I enter text in "Label.User Name" with value "userName"
  Then I scroll "GenericLocators.ScrollContact" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.Email"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_Four"
  Then I enter text in "Label.Notification Receiving E-MAIL" with value "Test Email"
  Then I click on "Next" button in cite
  Then I click on "Add Role" button in cite
  Then I click on "OrgOpRole.Test001" checkbox in dialog window
  Then I click on "GenericLocators.Confirmbutton"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  When static text "Operation succeeded." is visible
  Then I close tab near to home tab
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.NewOrg"
  Then I click on a "Search"
  Then I check table "Table.OrganizationOperator" with multiple values as "userName" and click on "Detail" of "Operation" column
  Then I report "SP Operator can Create WEB&HANDSET Organization Operator via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCreateHANDSETOrgOpViaWebNewOperatorIDAlreadyUsed!
Scenario:Create Organization Operator - Exception - Attempt SP Operator Create HANDSET Organization Operator via Web - New Operator ID Already Used
  Given I login to Fintech as "sp" operator
  Given I generate name "OperatorId" with value "74745"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I scroll "GenericLocators.ScrollLanguage" to view using "false" parameter
  Then I select drop down "Language" with option "DropDown.English"
  Then I click on "Label.Handset" checkbox
  Then I enter text in "Label.Operator ID" with value "OperatorId"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_Four"
  Then I click on "Next" button in cite
  When static text "The Operator ID is existed" is visible
  Then I report "SP Operator can't Create HANDSET Organization Operator via Web_New Operator ID Already Used"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsurethatSPCreateChildOwnedOrganizationViaWeb!
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

@TC_FINLSO_SPCreateTopOrgViaWebWithMSISDN!
Scenario:Create Organization - Ensure SP Operator Create Top Organization via Web with MSISDN
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_RAND_4"
  Given I generate name "OrgNameShortCode" with value "RAND_6"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I click on "Add" button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I scroll "GenericLocators.EffectiveDate" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product"
  Then I scroll page to bottom
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I enter text in "Label.shortcode" with value "OrgNameShortCode"
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
  Then I click on "GenericLocators.CreateSubmit"
  Then I report "Top organization created successfully, please wait for approving."
  Then I click on "View Detail" to check
  Then I report "The SP Operator can create Top Organization via Web with MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsurethatSPCanLoginSPPortal!
Scenario:SP Operator Login SP Portal - Ensure that SP Operator Login SP Portal Active
  Given I login to Fintech as "sp" operator
  Then I report "The SP operator login the portal successful."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCantakeOrgOperatorCallSearchbyOperatorID!
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

@TC_FINLSO_SPCanTakeOrgOpCallSearchByOperatorUserName!
Scenario:Customer Service - Ensure SP Operator can take Organization Operator Call Search by Operator UserName
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "User Service" in the "Home" Page
  Then I click on "GenericLocators.Customerbtn"
  Then I click on "GenericLocators.Organizationoperator"
  Then I enter text in "Label.Organization Short Code" with value "MpatOrg.ShortCode"
  Then I enter text in "Label.Username" with value "MpatOrg.Username"
  Then I click on a "Search"
  Then I check table "Table.OrganizationOperator" with multiple values as "MpatOrg.Username" and click on "Detail" of "Operation" column
  Then I enter text in "Label.Secret Word" with value "MpatOrg.SecretWord"
  Then I enter text in "Label.Balance of Default Account" with value "MpatOrg.BalanceOfDefaultAccount"
  Then I select drop down "Verify Account" with option "DropDown.Organization Wallet Working Account"
  Then I click on "Submit" button in cite
  Then I report "Page prompt verify Success"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPCanReleaseKYCToActiveProjectOnThePortal!
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

@TC_FINLSO_SPCanResetOrgOpPINwhenOrgOpPinIsLocked!
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

@TC_FINLSO_SPCanResetOrgOperatorPINViaWeb!
Scenario:Resetting Organization Operator PIN - Ensure SP Operator can reset Organization Operator PIN via Web
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

@TC_FINLSO_SPCanResetThePinwhenCustomerPinIsInLockedStatus!
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

@TC_FINLSO_SPCanResetPinWhenCustomersIdentityStatusIsInActive!
Scenario:Resetting Customer PIN - Ensure SP Operator can able to reset the pin when Customer's Identity Status is inactive
  Given I login to Fintech as "sp" operator
  Given I generate name "Newpin" with value "Infrozenstate"
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

@TC_FINLSO_SPCanResetCustomerPINByViaWeb!
Scenario:Resetting Customer PIN - Ensure SP Operator can Reset Customer PIN By via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "Newpin" with value "Resettingpin"
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

@TC_FINLSO_SPCanCreateTopOrgViaWebwithEmail!
Scenario:Create Organization - Ensure SP Operator Create Top Organization via Web with Email
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_RAND_4"
  Given I generate name "OrgNameShortCode" with value "RAND_6"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I click on "Add" button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I scroll "GenericLocators.ProductName" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product Name"
  Then I scroll page to bottom
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I enter text in "Label.shortcode" with value "OrgNameShortCode"
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
  Then I report "The SP Operator can create Top Organization via Web with MSISDN"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureQueryAuditLog!
Scenario:Ensure - Query Audit Log
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I select drop down "Event" with option "DropDown.ResetPIN"
  Then I click on a "Search"
  Then I report "The Identity Audit Logs are listed correctly."
  Then I click on left child menu "Configuration Audit Log" in the "Home" Page
  Then I select drop down "Event" with option "DropDown.ModifySystemParameter"
  Then I click on a "Search"
  Then I report "The configuration audit logs are listed correctly."
  Then I click on left child menu "Security Audit Log" in the "Home" Page
  Then I select drop down "Event" with option "DropDown.LoginSuccess"
  Then I click on a "Search"
  Then I report "The Security audit logs are listed correctly."
  Then I click on left child menu "Query Audit Log" in the "Home" Page
  Then I click on a "Search"
  Then I report "The Query audit logs are listed correctly."
  Then I click on left child menu "Home" in the "Home" Page
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureOrganizationChangeStatus!
Scenario:Organization change status - Ensure Organization change status
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.MpatOrgOne"
  Then I click on a "Search"
  Then I check table "Table.Organization" with multiple values as "ShortCode.MpatOrgOne" and click on "View" of "Operation" column
  Then I edit Identity Status in "Organization" with value "Suspended"
  Then I report "The status of the organization changes to Suspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPChangeCustomerStatusActiveToSuspended!
Scenario:SP Operator Change Customer status - Ensure SP Operator Change Customer status (Active to Suspended)
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues                         | SearchBy     | SearchValue                         | Status        |
  | Table.CustomerInIdentity | Customer.Registered_Customer_Active | Label.MSISDN | Customer.Registered_Customer_Active | Status.Active |
  Then I edit Identity Status of customer with value "Suspended"
  Then I edit Identity Status of customer with value "Active"
  Then I report "The status of the customer changes to Suspended."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorChangeTillDefaultOperatorIdviaWebOperatorStatusActive!
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

@TC_FINLSO_SPOperatorChangeTillDefaultOperatorIdviaWeb_OrganizationStatusFrozen!
Scenario:SP Operator Change Till Default Operator Id via Web_ Organization Status Frozen
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
  Then I edit Default Operator Id with value "01000001" and Remark as "Reason Description"
  Then I edit Default Operator Id with value "10022" and Remark as "Reason Description"
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

@TC_FINLSO_SPLookupBeneficiaryViaWeb!
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

@TC_FINLSO_SPOperatorCloseTillviaWebTillStatusActive!
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

@TC_FINLSO_SPOperatorChangeTillStatusviaWebTillStatusIsPendingActive!
Scenario: Exception_ SP Operator Change Till Status via Web _Till Status Is Pending Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                        | Query Condition                       | SearchBy          | Organization Short Code | Till Number                        | SearchValue                        | Status                |
  | Table.Till | Till.MpatOrgOne.Till_PendingActive | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.Till_PendingActive | Till.MpatOrgOne.Till_PendingActive | Status.Pending Active |
  Then I report "The till is queried successfully and the details page is displayed"
  Then I report "The SP Operator cannot change the Till status when the Till is in Pending Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPLookupBeneficiaryViaWeb!
Scenario:SP Operator Lookup Beneficiary via Webb
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

@TC_FINLSO_EnsureServiceProviderCreateBankAccount!
Scenario:Service Provider Bank Account_ Ensure Create Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  Then I create bank account with below details for Sp Portal
  | ServiceProvider | BankName            | BankID | Currency | AssertType      | BankAccountName | BankAccountNumber |
  | Yes             | FIRST NATIONAL BANK | testyy | LSL      | Deposit Account | AccountName     | AccountNumber     |
  When static text "Add Bank Account Success" is visible
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseBankview"
  Then I report "SP operator can Create Bank Account via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorChangeStatusviaWebfromActivetoFrozen!
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

@TC_FINLSO_ServiceProviderBankAccount_EnsureViewRemoveAccountDetail!
Scenario:Service Provider Bank Account_Ensure View Remove Account Detail
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  Then I create bank account with below details for Sp Portal
  | ServiceProvider | BankName            | BankID | Currency | AssertType      | BankAccountName | BankAccountNumber |
  | Yes             | FIRST NATIONAL BANK | testyy | LSL      | Deposit Account | AccountName     | AccountNumber     |
  Then I enter text in "Account Name" with value "AccountName"
  Then I click on "Search" button in cite
  Then I click on the "Active Account" tab
  Then I check table "Table.OrganizationOperator" with multiple values as "AccountName" and click on "Remove" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitRemoveBan"
  Then I click on the "Removed Account" tab
  Then I switch to next frame
  Then I enter text in "Account Name" with value "AccountName"
  Then I click on "Search" button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseBankview1"
  Then I report "The Bank Account menu displays normally."
  Then I report "The details of the deleted bank account are correct."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ServiceProviderBankAccount_EnsureDeleteBankAccount!
Scenario:Service Provider Bank Account_Ensure Delete Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  Then I create bank account with below details for Sp Portal
  | ServiceProvider | BankName            | BankID | Currency | AssertType      | BankAccountName | BankAccountNumber |
  | Yes             | FIRST NATIONAL BANK | testyy | LSL      | Deposit Account | AccountName     | AccountNumber     |
  Then I enter text in "Account Name" with value "AccountName"
  Then I click on "Search" button in cite
  Then I click on the "Active Account" tab
  Then I check table "Table.OrganizationOperator" with multiple values as "AccountName" and click on "Remove" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitRemoveBan"
  Then I report "The Bank Account menu displays normally."
  Then I report " The bank account is successfully removed and can be viewed on the removed account tab page"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ServiceProviderBankAccount_EnsureQueryBankAccount!
Scenario:Service Provider Bank Account_Ensure Query Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  Then I create bank account with below details for Sp Portal
  | ServiceProvider | BankName            | BankID | Currency | AssertType      | BankAccountName | BankAccountNumber |
  | Yes             | FIRST NATIONAL BANK | testyy | LSL      | Deposit Account | AccountName     | AccountNumber     |
  Then I enter text in "Account Name" with value "AccountName"
  Then I click on "Search" button in cite
  Then I click on the "Active Account" tab
  Then I check table "Table.OrganizationOperator" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseBankview"
  Then I report "The Bank Account menu displays normally."
  Then I report "The operation options are available in the result column to query other details about the bank account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorChangeTillLanguageviaWebTillStatusPendingActive!
Scenario: SP Operator Change Till Language via Web_ Till Status Pending Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                       | Query Condition                       | SearchBy          | Organization Short Code | Till Number                       | SearchValue                       | Status         |
  | Table.Till | Till.MpatOrgOne.PendingTillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.PendingTillNumber | Till.MpatOrgOne.PendingTillNumber | Status.Pending |
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  When static text "Language edited successfully" is visible
  Then I change Language with value "English" and Remark as "Test"
  When static text "Language edited successfully" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator" and click on "Detail" of "opration" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureSPOperatorChangeOperatorlanguageviaWeb!
#Pending-While changing language on clicking Confirm Button getting error Code-11500001
Scenario:Change operator language_Ensure_SP Operator Change Operator language via Web
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I click on a "Search"
  Then I check table "Table.OrganizationOperator" with multiple values as "OrgOperator.Shortcode" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.EditLanguageOrg"
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text area "Remark" with value "Test"
  Then I click on "GenericLocators.ConfirmLanguage"
  When static text "Change Language SUCCESS!" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureQueryCustomerInfo!
Scenario:Query Identity by SP Portal_Ensure Query Customer Info
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Customer" in the "Home" Page
  Then I enter text for "GenericLocators.MsisdnUserService" with value "Customer.Registered_Customer_Two"
  Then I click on a "Search"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureQueryOrganizationInfo!
Scenario:Query Identity by SP Portal_Ensure Query Organization Info
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.MpatOrgOne"
  Then I click on a "Search"
  Then I check table "Table.Organization" with multiple values as "ShortCode.MpatOrgOne" and click on "View" of "Operation" column
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsurethatQueryOrganizationOperatorInfo!
Scenario:Query Identity by SP Portal_Ensure that Query Organization Operator Info
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization Operator" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I click on a "Search"
  Then I check table "Table.OrganizationOperator" with multiple values as "OrgOperator.Shortcode" and click on "Detail" of "Operation" column
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_OrganizationBank_EnsureCreateBankAccount!
Scenario:Organization Bank Account_Ensure Create Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I create bank account with below details for Sp Portal
  | Organization | BankName            | BankID | Currency | AssertType      | BankAccountName | BankAccountNumber |
  | Yes          | FIRST NATIONAL BANK | testyy | LSL      | Deposit Account | AccountName     | AccountNumber     |
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Create Identity Bank Account'"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I enter text in "Account Name" with value "AccountName"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseBankview"
  Then I report "SP operator can Create Organization Bank Account via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_OrganizationBankAccountQueryBankAccount!
Scenario: Organization Bank Account_Ensure Query Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I create bank account with below details for Sp Portal
  | Organization | BankName            | BankID | Currency | AssertType      | BankAccountName | BankAccountNumber |
  | Yes          | FIRST NATIONAL BANK | testyy | LSL      | Deposit Account | AccountName     | AccountNumber     |
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Create Identity Bank Account'"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I enter text in "Account Name" with value "AccountName"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseBankview"
  Then I report "Organization Bank Account Ensure Query Bank Account"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_OrganizationBankAccountSetDefaultBankAccount!
Scenario:Organization Bank Account_ Ensure Set Default Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I create bank account with below details for Sp Portal
  | Organization | BankName            | BankID | Currency | AssertType      | BankAccountName | BankAccountNumber |
  | Yes          | FIRST NATIONAL BANK | testyy | LSL      | Deposit Account | AccountName     | AccountNumber     |
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Create Identity Bank Account'"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I enter text in "Account Name" with value "AccountName"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "More" of "Operation" column
  Then I click on "GenericLocators.SetDefaultOrg"
  Then I click on "GenericLocators.SubmitRemoveBan"
  When static text "Success to set default account." is visible
  Then I report "Organization Bank Account Set to Default"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_OrganizationBankAccountDeleteBankAccount!
Scenario:Organization Bank Account_Ensure Delete Bank Account
  Given I login to Fintech as "sp" operator
  Given I generate name "AccountName" with value "TEST_RAND_4"
  Given I generate name "AccountNumber" with value "RAND_14"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I create bank account with below details for Sp Portal
  | Organization | BankName            | BankID | Currency | AssertType      | BankAccountName | BankAccountNumber |
  | Yes          | FIRST NATIONAL BANK | testyy | LSL      | Deposit Account | AccountName     | AccountNumber     |
  Then I click on "GenericLocators.ConfirmException"
  When MakerChecker is on "Approve" task from group task for "Approve 'Create Identity Bank Account'"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode1 | Label.Organization Short Code | ShortCode.ShortCode1 | Status.Active |
  Then I click on "GenericLocators.BankAccountOrganization"
  Then I enter text in "Account Name" with value "AccountName"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Remove" of "Operation" column
  Then I enter text area "Remark" with value "Reason Description" in the popup dialog window
  Then I click on "GenericLocators.SubmitRemoveBan"
  When static text "Success to delete." is visible
  Then I report "SP operator can delete Organization Bank Account via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorQueryCustomerKYCInfo!
Scenario:SP Operator Query Customers KYC Info
  Given I login to Fintech as "sp" operator
  When I search for "Customer" with below details
  | TableId                  | TableValues      | SearchBy     | SearchValue      | Status        |
  | Table.CustomerInIdentity | Customer.MSISDN1 | Label.MSISDN | Customer.MSISDN1 | Status.Active |
  Then I click on the "KYC Info" tab
  Then I wait "3"
  Then I report "SP Operator Query Customers KYC Info"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CreateCustomerInSPPortalInputAllKYCFields!
Scenario:Create Customer in SP Portal, and Input All KYC Fields
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "130000_RAND_5"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "PostNo" with value "RAND_6"
  Given I generate name "PostalAdd" with value "Lesotho"
  Given I generate name "PhyAdd" with value "LesothoFintech"
  Given I generate name "IDno" with value "RAND_6"
  Given I generate name "EffectiveDate" with value "10/1/2020"
  Given I generate name "ExpiryDate" with value "20/1/2035"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I wait "5"
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
  Then I enter text in "Label.Email" with value "Test Email"
  Then I select drop down "Nationality" with option "DropDown.American"
  Then I scroll "GenericLocators.ScrollAddressDetail" to view using "false" parameter
  Then I enter text in "Label.PostCode" with value "PostNo"
  Then I enter text in "Label.PostalAddress" with value "PostalAdd"
  Then I enter text in "Label.PhysicalAddress" with value "PhyAdd"
  Then I enter text in "Label.CityorTown" with value "City"
  Then I select drop down "Secret Question" with option "DropDown.Whatisyourfirstcellphone"
  Then I enter text in "Label.SecretAnswer" with value "DateOfBirth"
  Then I scroll "GenericLocators.IdDetailsScroll" to view using "false" parameter
  Then I click on "Add ID" button in cite
  Then I click on "GenericLocators.IdType"
  Then I click on a "GenericLocators.VoterId"
  Then I enter text for "GenericLocators.IDNumber" with value "IDno"
  Then I click on "Next" button in cite
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  Then I click on " View >> " to check
  Then I report "SP Operator Created Customer with All Input Mandatory And Optional KYC Fields"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CreateCustomerInSPPortalInputTheCombinationOfMandatoryAndOptionalKYC!
Scenario:Create Customer in SP Portal, and Input the Combination of Mandatory and Optional KYC
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "130000_RAND_5"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Given I generate name "MiddleName" with value "FintechTest"
  Given I generate name "PostNo" with value "RAND_6"
  Given I generate name "PostalAdd" with value "Lesotho"
  Given I generate name "PhyAdd" with value "LesothoFintech"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I wait "5"
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
  Then I enter text in "Label.Email" with value "Test Email"
  Then I select drop down "Nationality" with option "DropDown.American"
  Then I scroll "GenericLocators.ScrollAddressDetail" to view using "false" parameter
  Then I enter text in "Label.PostCode" with value "PostNo"
  Then I enter text in "Label.PostalAddress" with value "PostalAdd"
  Then I enter text in "Label.PhysicalAddress" with value "PhyAdd"
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
  Then I report "SP Operator Created Customer with All Input Mandatory And Optional KYC Fields"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CreateCustomerInSPInputMandatoryKYCFields!
Scenario: Scenario name Create Customer in SP Portal, and Only Input the Mandatory KYC Fields
  Given I login to Fintech as "sp" operator
  Given I generate name "CustomerMSISDN" with value "132000_RAND_5"
  Given I generate name "FirstName" with value "TestKYC"
  Given I generate name "LastName" with value "AutomationKYC"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I wait "5"
  Then I click on "+ Add Basic Product " button in cite
  Then I click on "GenericLocators.Fintech2TestProduct" radio in dialog window
  Then I click on "GenericLocators.OkButtonForAddBasicProduct"
  Then I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "CustomerMSISDN"
  Then I scroll "GenericLocators.ScrollPersonalDetail" to view using "false" parameter
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I enter text in "Date of Birth" with value "DateOfBirth"
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
  When static text "Create completed, please waiting for approving." is visible
  Then I click on " View >> " to check
  Then I report "SP Operator Created Customer with Input the Mandatory KYC Fields"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SSPOperatorCloseTillviaWeb_TillStatusFrozenandorganizationstatusisfrozen!
#Pending - need a active till number to work with this test case!
Scenario:SP Operator Close Till via Web_Till Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues      | SearchBy                      | SearchValue      | Status        |
  | Table.Organization | ShortCode.NewOrg | Label.Organization Short Code | ShortCode.NewOrg | Status.Active |
  Then I edit Identity Status in "org" with value "Frozen"
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
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorCloseTillviaWeb_OrganizationStatusFrozen
#Pending - need a active till number to work with this test case
#testcase blocked by manual team due to audit log issue
Scenario:SP Operator Close Till via Web_Organization Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues      | SearchBy                      | SearchValue      | Status        |
  | Table.Organization | ShortCode.NewOrg | Label.Organization Short Code | ShortCode.NewOrg | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
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
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorofTillOrganizationisintheFrozenstateToChangeTillProduct!
Scenario:When The Till Organization is in the Frozen state To Change Till Product
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode5 | Label.Organization Short Code | ShortCode.ShortCode5 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code | Till Number                 | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber2 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode5    | Till.MpatOrgOne.TillNumber2 | Till.MpatOrgOne.TillNumber2 | Status.Active |
  Then I click on the "Product" tab
  Then I click on "GenericLocators.Editproduct"
  Then I check table "Table.RemoveTillProduct" with multiple values as "C2B Business - Utlity Payment Till" and click on "Delete" of "Operation" column
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Editproduct"
  Then I Add product in till as "C2B Business - Utlity Payment Till"
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
  | Table.Organization | ShortCode.ShortCode5 | Label.Organization Short Code | ShortCode.ShortCode5 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_WhenTheTillInPendingActiveToChangeTillDevice!
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

@TC_FINLSO_ChangeTillDeviceWhenTillInActiveAndTillOrganizationInActive!
Scenario:eChange Till Device When The till is in the Active state and the till organization is in the Active state
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "86131123499_RAND_2"
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code | Till Number                 | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber1 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber1 | Till.MpatOrgOne.TillNumber1 | Status.Active |
  Then I scroll "GenericLocators.ScrollDevice" to view using "false" parameter
  Then I edit Device MSISDN with value "MSISDN"
  Then I edit Device MSISDN with value "Till.MpatOrgOne.MSISDN1"
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Device" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I report "Till device changed successfully when the status is Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ExceptionBusinessDepositviaSPPORTALBalanceNotEnough!
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

@TC_FINLSO_Exception_BusinessWithdrawviaSPPortalBalanceNotEnough!
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

@TC_FINLSO_BusinessDepositviaCreditIdentityStatusInvalid!
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

@TC_FINLSO_BusinessWithdrawviaCreditIdentityStatusInvalid!
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

@TC_FINLSO_BusinessDepositviaSPPORTALSameTopOrganization!
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

@TC_FINLSO_BusinessWithdrawviaSPPortalSameTopOrganization!
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

@TC_FINLSO_CreateChildOrgAutomaticShortcodeAssignmentViaPortal!
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

@TC_FINLSO_ChildOrgBankAccEnsureCreateBankAccount!
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
  Then I Add product in the organization as "Agency Store"
  Then I enter text in "Label.parentshortcode" with value "Login.org.Shortcode"
  Then I enter text in "Label.Organizationname" with value "OrgName"
  Then I scroll "GenericLocators.ScrollKYcInfo" to view using "false" parameter
  Then I click on "GenericLocators.Region"
  Then I click on "GenericLocators.SemonRegion"
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
  Then I select drop down "GenericLocators.ContactType" with the "Owner"
  Then I enter text for "GenericLocators.ContactFirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.ContactSurName" with value "Reason Description"
  Then I enter text for "GenericLocators.ContactPhNo" with value "PhoneNo"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.ContactIdNo" with value "NationalId"
  Then I select drop down "GenericLocators.ContactIdType" with the "National ID"
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
  Then I click on "GenericLocators.CloseViewDetailofChildOrg"
  Then I report "The Child Organization can Create Bank Account via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_TopOrgBankAccEnsureDelBankAccount!
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
  Then I select drop down "GenericLocators.ContactType" with the "Owner"
  Then I enter text for "GenericLocators.TopOrgContactFirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactSurName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactPhNo" with value "PhoneNo"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.TopOrgContactIdNo" with value "NationalId"
  Then I select drop down "GenericLocators.ContactIdType" with the "National ID"
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
  Then I click on "Submit" button in cite
  Then I click on the "Removed Account" tab
  Then I report "The Bank Account can be deleted in Top Organization"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_TopOrganizationBankAccountCreateBankAccount!
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
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.SuperAgent"
  Then I click on "GenericLocators.ConfirmTopOrg"
  Then I scroll "GenericLocators.ProductName" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product Name"
  Then I scroll page to bottom
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  Then I enter text in "Label.shortcode" with value "OrgNameShortCode"
  Then I select drop down "Preferred Notification Channel" with option "Label.Email"
  Then I enter text in "Notification Receiving E-MAIL" with value "Test Email"
  Then I scroll "GenericLocators.Language" to view using "false" parameter
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
  Then I select drop down "GenericLocators.ContactType" with the "Owner"
  Then I enter text for "GenericLocators.TopOrgContactFirstName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactSurName" with value "Reason Description"
  Then I enter text for "GenericLocators.TopOrgContactPhNo" with value "PhoneNo"
  Then I click on "GenericLocators.ScrollContactNo"
  Then I scroll "GenericLocators.ScrollContactNo" to view using "true" parameter
  Then I enter text for "GenericLocators.TopOrgContactIdNo" with value "NationalId"
  Then I select drop down "GenericLocators.ContactIdType" with the "National ID"
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
  Then I click on "GenericLocators.CloseViewDetailofChildOrg"
  Then I report "The Child Organization can Create Bank Account via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_EnsureOrgChangeStatus!
# Pending - Transaction process need to be automated
Scenario: Organization change status - Ensure Organization change status
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues      | SearchBy                      | SearchValue      | Status        |
  | Table.Organization | ShortCode.NewOrg | Label.Organization Short Code | ShortCode.NewOrg | Status.Active |
  Then I edit Identity Status in "Organization" with value "Suspended"
  Then I edit Identity Status in "Organization" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SpOperatorCantCreateCusIfMSISDNIsAlreadyExist!
Scenario: Create Customer - Exception - Attempt SP Operator Create Registered Customer via Web MSISDN Already Used
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "Customer.Registered_Customer_One"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Customer "
  Then I scroll "GenericLocators.ScrollBasicInform" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text in "Label.First Name" with value "Reason Description"
  When static text "The MSISDN already exists" is visible
  Then I report "SP Operator can't create Registered Customer via Web MSISDN Already Used"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_TransferFromBusinessTransfersFromUtilityCollectionAccountViaWEB!
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

@TC_FINLSO_TransferFromBusinessTransfersUtilityDisbursementM-PESAAccountViaWEB!
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

@TC_FINLSO_TransferFromAgencyOrganizationMoveFundsViaWEB!
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

@TC_FINLSO_TransferFromOrganizationFundsManagementBusinessDepositViaWEB!
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

@TC_FINLSO_TransferOrganizationFundsManagementBusinessWithdrawalViaWEB!
Scenario:Transfer From Organization Funds Management - Business Withdrawal Via WEB
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues       | SearchBy                      | SearchValue       | Status        |
  | Table.Organization | ShortCode.NewOrg2 | Label.Organization Short Code | ShortCode.NewOrg2 | Status.Active |
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

@TC_FINLSO_ExceptionTheAvailableShortcodeUsedUpWhenCreateChildOrg!
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

@TC_FINLSO_ExceptionAutogeneratedShortcodeHasexistWhenCreateChildOrg!
Scenario: Exception_Autogenerated Shortcode Has exist When Create Child Org
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
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  When static text "The short code is existed." is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ExceptionTransferFromMerchantPayToMerchantViaWEB!
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

@TC_FINLSO_ExceptionCreditIdentityStatusInvalid!
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

@TC_FINLSO_ExceptionDebitIdentityStatusInvalid!
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

@TC_FINLSO_CreateTopOrgAutomaticShortcodeAssignmentViaPortal!
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

@TC_FINLSO_ExceptionTheAvailableShortcodeUsedUpWhenCreateTopOrg!
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

@TC_FINLSO_ExceptionAutogeneratedShortcodeHasexistWhenCreateTopOrg!
Scenario:Exception_ Autogenerated Shortcode Has exist When Create Top Org
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
  Then I enter text for "GenericLocators.OrganizationName" with value "OrgName"
  When static text "The short code is existed" is visible
  Then I scroll "GenericLocators.Language" to view using "false" parameter
  Then I select drop down "Preferred Notification Channel" with option "Label.SMS"
  Then I enter text in "Label.Notification Receiving MSISDN" with value "Customer.Registered_Customer_One"
  Then I select drop down "Preferred Notification Language" with option "DropDown.English"
  Then I click on "Next" button in cite
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ExceptionBusinessDepositviaSPPORTALPayerIdentityStatusInvalid!
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

@TC_FINLSO_ExceptionBusinessWithdrawviaSPPortalSameTopOrganizationpayerIdentityStatusInvalid!
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

@TC_FINLSO_SPOperatorofTillisinthePendingActivestateToChangeTillProduct!
Scenario:When The Till is in the Pending Active state To Change Till Product
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                       | Query Condition                       | SearchBy          | Organization Short Code | Till Number                       | SearchValue                       | Status                |
  | Table.Till | Till.MpatOrgOne.TillPendingActive | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillPendingActive | Till.MpatOrgOne.TillPendingActive | Status.Pending Active |
  Then I report "Query the till successfully, The till details page is displayed."
  Then I click on the "Product" tab
  Then I click on "GenericLocators.Editproduct"
  Then I check table "Table.RemoveTillProduct" with multiple values as "Agency Independent Store Till" and click on "Delete" of "Operation" column
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Editproduct"
  Then I Add product in till as "Agency Independent Store Till"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  Then I report "The Product is successfully modified. The modification is successfully submitted."
  Then I verify Portal Log with below details
  | Table                  | Log                | Tablevalue          | Sp  |
  | Table.IdentityAuditlog | Identity Audit Log | Change Till Product | Yes |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatortoChangeTillProductWhenThetillisintheFrozenstateandthetillorganizationisintheFrozenstate!
Scenario:Change Till Product When The till is in the Frozen state and the till organization is in the Frozen state
  Given I login to Fintech as "sp" operator
  #Prerequisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code | Till Number                | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I report "Query the till successfully, The till details page is displayed"
  Then I click on the "Product" tab
  Then I click on "GenericLocators.Editproduct"
  Then I Add product in till as "Super Agent Till"
  Then I report "The Product is successfully modified. The modification is successfully submitted."
  Then I verify Portal Log with below details
  | Table                  | Log                | Tablevalue         | Sp  |
  | Table.IdentityAuditlog | Identity Audit Log | Change Till Status | Yes |
  # Then I click on left child menu "Audit Log" in the "Home" Page
  # Then I click on left child menu "Identity Audit Log" in the "Home" Page
  # Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  # Then I click on "GenericLocators.CloseViewDetails"
  # #Post-Requisite
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code | Till Number                | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I wait "5"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Frozen |
  Then I wait "5"
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatortoChangeTillProductWhenThetillisintheFrozenstateandthetillorganizationisintheActivestate!
Scenario:Change Till Product When The till is in the Frozen state and the till organization is in the Active state
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code | Till Number                | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I wait "5"
  Then I report "Query the till successfully, The till details page is displayed"
  Then I click on the "Product" tab
  Then I click on "GenericLocators.Editproduct"
  Then I Add product in till as "Super Agent Till"
  Then I report "The Product is successfully modified. The modification is successfully submitted."
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator|Change Till Status" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseViewDetails"
  #Post-Requisite
  Then I close tab near to home tab
  When I search for "Till" with below details
  | TableId    | TableValues                | Query Condition                       | SearchBy          | Organization Short Code | Till Number                | SearchValue                | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber | Till.MpatOrgOne.TillNumber | Status.Frozen |
  Then I edit Identity Status in "Till" with value "Active"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatortoChangeTillProductWhenThetillisintheActivestateandthetillorganizationisintheActivestate!
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

@TC_FINLSO_CreateTillMaintainABlacklistOfIdentifiersViaPortal!
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
  Then I get value from label "Till Number" and store it in "TillNumber"
  Then I select drop down "Language" with option "DropDown.English"
  Then I scroll "GenericLocators.UnSelectAllButtonTill" to view using "false" parameter
  Then I click on " Available " checkbox
  Then I click on "GenericLocators.SelectAllButtonTill"
  Then I click on "Submit" button in cite
  When static text "Till created successfully!" is visible
  Then I click on "View Detail" to check
  Then I report "The SP operator can Create Till Maintain A Blacklist Of Identifiers Via Portal"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CreateChildOrgMaintainABlacklistOfIdentifiersViaPortal!
Scenario:Create Child Org Maintain A Blacklist Of Identifiers Via Portal
  Given I login to Fintech as "sp" operator
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Child Organization "
  Then I click on "Add" button in cite
  Then I click on "OrgOpRole.All" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I scroll "GenericLocators.ProductName" to view using "false" parameter
  Then I click on checkbox "GenericLocators.Product" with text "Product Name"
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

@TC_FINLSO_CreateTopOrgMaintainABlacklistOfIdentifiersViaPortal!
Scenario:Create Top Org Maintain A Blacklist Of Identifiers Via Portal
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_RAND_4"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I click on "Add" button in cite
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

@TC_FINLSO_CreateTillAutomaticTillNumberAssignmentViaPortal!
Scenario:Create Till Automatic Till Number Assignment Via Portal
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode2"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I click on "GenericLocators.TillAutogeneratecode"
  Then I select drop down "Language" with option "DropDown.English"
  Then I wait "6"
  Then I scroll "GenericLocators.UnSelectAllButtonTill" to view using "false" parameter
  Then I click on "GenericLocators.CheckboxforTill"
  Then I wait "3"
  Then I click on "GenericLocators.SelectAllButtonTill"
  Then I click on "Submit" button in cite
  When static text "Till created successfully!" is visible
  Then I click on "View Detail" to check
  Then I wait "2"
  Then I report "The SP Operator can able to Create Till via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_BusinessDepositviaSPPORTALDifferentTopOrganization
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

@TC_FINLSO_BusinessWithdrawviaSPPortalDifferrentTopOrganization!
Scenario: Business Withdraw via SP Portal_Differrent Top Organization
  Given I login to Fintech as "sp" operator
  When I search for "Organization" with below details
  | TableId            | TableValues           | SearchBy                      | SearchValue           | Status        |
  | Table.Organization | ShortCode.NewChlidOrg | Label.Organization Short Code | ShortCode.NewChlidOrg | Status.Active |
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I select drop down "Transaction Services" with option "DropDown.BusinessWithdraw"
  Then I enter text for "GenericLocators.TransactionShortCode" with value "ShortCode.NewOrg"
  Then I enter text in "Label.Amount" with value "Amount.Minimum"
  Then I enter text area "Remark" with value "Test"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Initiate Transaction submitted successfully." is visible
  Then I report "Business Deposit for Different Top Organization is successfully done"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ExceptionAutogeneratedTillNumHasexistWhenCreateTill!
Scenario: Exception_ Autogenerated Till Num Has exist When Create Till
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text for "GenericLocators.CreateTillNo" with value "Till.MpatOrgOne.TillNumber"
  Then I wait "3"
  Then I select drop down "Language" with option "DropDown.English"
  When static text "till number has been used" is visible
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ExceptionTheAvailableTillNumUsedUpWhenCreateTill!
Scenario: Exception_The Available Till Num Used Up When Create Till
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I scroll "GenericLocators.TillAutogeneratecode" to view using "false" parameter
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text for "GenericLocators.CreateTillNo" with value "Till.MpatOrgOne.TillNumber"
  Then I select drop down "Language" with option "DropDown.English"
  Then I wait "3"
  When static text "till number has been used" is visible
  Then I report "The Exception can be seen when we enter already used till number"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_LoginTheOrganizationPortalForgotPasswordResetSuccessfully!
#pending need Another Login credentials with SecretQuestionAswer
Scenario: Login The Organization Portal_Forgot Password Reset Successfully
  Given I navigate to Mpesa "orgnew" portal
  Then I click on "GenericLocators.OrgPortalForgetPassword"
  Then I enter text in "Short Code" with value "Login.orgnew.Shortcode"
  Then I enter text in "User Name" with value "Login.orgnew.UserID"
  Then I click on "Submit" button in cite
  Then I enter text in "Answer1" with value "chennai"
  Then I click on "Confirm" button in cite
  When static text "Password retrieved successfully." is visible
  Then I login to Fintech as "sp" operator
  When MakerChecker is on "Reject" task from group task for "Approve 'Reset Organization Operator Password'"
  Then I logout the "sp" portal and close the browser
  Then I report "The Organization Portal_Forgot Password Reset Successfully"

@TC_FINLSO_LoginOrganizationPortalCreateBankAccountviaOrganization_EnsureDeleteBankAccount!
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

@TC_FINLSO_LoginOrganizationPortalCreateBankAccountviaOrganization_EnsureSetDefaultBankAccount!
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

@TC_FINLSO_LoginTheOrganizationPortalExceptionIncorrectVerificationCode!
Scenario: Login The Organization Portal_Exception_ Incorrect Verification Code
  Given I navigate to Mpesa "org" portal
  Then I enter text in "Short Code" with value "Login.orgAHO.Shortcode"
  Then I enter text in "User Name" with value "Login.orgAHO.UserID"
  Then I enter text in "Password" with value "Login.orgAHO.password"
  Then I enter text in "Verification Code" with value "Login.orgIncorrectShortcode.IncorrectVerificationCode"
  Then I click on "Login Service Agreement" button in cite
  Then I wait "3"
  Then I click on " I Have Read And Agreed" button in cite
  Then I click on " Login " button in cite
  Then I check error text " Incorrect verification code. " is displayed
  Then I report "The organization operator login the portal failed with incorrect Verificationcode"

@TC_FINLSO_LoginOrganizationPortalWithIncorrectPassword!
Scenario:Login The Organization Portal_Exception_ Incorrect Password
  Given I login to Fintech as "orgIncorrectPassword" operator
  Then I check error text " Incorrect username, password, or status. Remaining attempts: " is displayed
  Then I report "The organization operator login the portal failed with incorrect password"

@TC_FINLSO_BankAccountMyOrganizationCreateBankAccount!
Scenario:Bank Account via My Organization _Ensure Create Bank Account
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
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.Closebutton"
  Then I report "Organization operator create bank account via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_BankAccountOrganizationQuery!
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

@TC_FINLSO_BankAccountMyOrganizationViewRemoveAccountDetail!
Scenario:Bank Account via My Organization_Ensure View Remove Account Detail
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

@TC_FINLSO_BankAccountMyOrganizationSetDefaultBankAccount!
Scenario:Bank Account via My Organization _Ensure Set Default Bank Account
  Given I login to Fintech as "org" operator
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Add" button in cite
  Then I select drop down "Bank Head Office" with option "DropDown.StandardLesothoBank"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.FintechTest"
  Then I select drop down "Asset Type" with option "DropDown.DepositAccount"
  Then I select drop down "Currency" with option "DropDown.LSL"
  Then I enter text in "Label.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccNo"
  Then I click on "Confirm" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Set Default" of "Operation" column
  Then I click on "GenericLocators.SubmitButtonInSetDefault"
  Then I click on "Confirm" button in cite
  Then I report "Organization operator can set default account via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_BankAccountviaOrganizationCreateBankAccount!
Scenario:Bank Account via Organization_ Ensure Create Bank Account
  Given I login to Fintech as "org" operator
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.NewOrg2"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountCreated" with multiple values as "ShortCode.NewOrg2" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I click on "GenericLocators.BankAccount"
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.BankHODropdown"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.FintechTest"
  Then I click on "GenericLocators.AssetType"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccNo"
  Then I click on "Confirm" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.Closebutton"
  Then I report "Organization operator create Bank account via organization"
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser

@TC_FINLSO_BankAccountOrganizationViewRemoveAccount!
Scenario:Bank Account via Organization _Ensure View Remove Account Detail
  Given I login to Fintech as "org" operator
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.NewOrg2"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountCreated" with multiple values as "ShortCode.NewOrg2" and click on "Detail" of "Operation" column

@TC_FINLSO_BankAccountviaChildOrganization_EnsureCreateBankAccount!
Scenario:Bank Account via Child Organization_Ensure Create Bank Account
  Given I login to Fintech as "org" operator
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.NewChlidOrg"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountCreated" with multiple values as "ShortCode.NewChlidOrg" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I click on "GenericLocators.BankAccount"
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.BankHODropdown"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.FintechTest"
  Then I click on "GenericLocators.AssetType"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccNo"
  Then I click on "Confirm" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Remove" of "Operation" column
  Then I enter text area "Reason" with value "Reason Description"
  Then I click on "Confirm" button in cite
  Then I switch to previousTab
  Then I report "Organization operator remove Bank account via organization"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_BankAccountOrganizationSetDefaultBankAccount!
Scenario:Bank Account via Organization_Ensure Set Default Bank Account
  Given I login to Fintech as "org" operator
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.NewOrg2"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountCreated" with multiple values as "ShortCode.NewOrg2" and click on "Detail" of "Operation" column
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.Closebutton"
  Then I report "Organization operator create Bank account via organization"
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser

@TC_FINLSO_BankAccountviaChildOrganization_EnsureDeleteBankAccount!
Scenario:Bank Account via Child Organization_Ensure Delete Bank Account
  Given I login to Fintech as "org" operator
  Then I click on "GenericLocators.Organizationleftchild"
  Then I wait "5"
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I wait "5"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.NewChlidOrg"
  Then I click on "Search" button in cite
  Then I check table "Table.BankAccountCreated" with multiple values as "ShortCode.NewChlidOrg" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I click on "GenericLocators.BankAccount"
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.BankHODropdown"
  Then I click on "GenericLocators.StandardLesothoBankDropdown"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.FintechTest"
  Then I click on "GenericLocators.AssetType"
  Then I click on "GenericLocators.DepositDropdown"
  Then I select drop down "GenericLocators.Currency" with the "DropDown.LSL"
  Then I enter text for "GenericLocators.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccNo"
  Then I click on "Confirm" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Set Default" of "Operation" column
  Then I click on "GenericLocators.SubmitButtonInSetDefault"
  Then I click on "Confirm" button in cite
  Then I switch to previousTab
  Then I report "Organization operator can set default account via web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_BankAccountMyOrganizationRemoveAccountDetail!
Scenario:Bank Account via My Organization_Ensure View Remove Account Detail
  Given I login to Fintech as "org" operator
  Given I generate name "AccountName" with value "Test_RAND_4"
  Given I generate name "AccNo" with value "RAND_16"
  Then I click on "Add" button in cite
  Then I select drop down "Bank Head Office" with option "DropDown.StandardLesothoBank"
  Then I select drop down "GenericLocators.BankDropDown" with the "DropDown.FintechTest"
  Then I select drop down "Asset Type" with option "DropDown.DepositAccount"
  Then I select drop down "Currency" with option "DropDown.LSL"
  Then I enter text in "Label.AccountName" with value "AccountName"
  Then I enter text in "Label.AccountNumber" with value "AccNo"
  Then I click on "Confirm" button in cite
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Remove" of "Operation" column
  Then I enter text area "Reason" with value "Reason Description"
  Then I click on "Confirm" button in cite
  Then I report "Organization operator can remove account detail via My organization"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_LoginTheOrganizationPortalExceptionEnteranincorrectanswer!
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

@TC_FINLSO_OrgOpChangeTillDeviceforChildOrgViaWeb!
#Pending - Coding
Scenario:Change Till Device - Org Operator change Till Device for Child Org via Web
  Given I login to Fintech as "org" operator
  Then I click on left child menu " Till " in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "Till.NewOrg2.ShortCode"
  Then I click on a "Search"
  Then I check table "Table.Till" with multiple values as "Till.NewOrg2.ShortCode" and click on "Detail" of "Operation" column
  Then I check table "Table.BankAccountList" with multiple values as "AccountName" and click on "Remove" of "Operation" column
  Then I enter text area "Reason" with value "Reason Description"
  Then I click on "Confirm" button in cite
  Then I report "The bank account is successfully deleted, which can be viewed on the Deleted Account tab page under the Bank Account menu of the organization."
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser

@TC_FINLSO_LoginTheOrganizationPortalExceptionnewpasswordandconfirmpasswordaredifferent!
Scenario: Login The Organization Portal_Exception_ new password and confirm password are different
  Given I login to Fintech as "orgSecond" operator
  Then I wait "2"
  Then I enter text in "Old Password" with value "Login.orgSecond.password"
  Then I enter text in "New Password" with value "Login.orgSecond.Newpassword"
  Then I enter text in "Confirm Password" with value "Login.orgSecond.Confirmpassword"
  Then I click on "Next" button in cite
  When static text "The two passwords are inconsistent." is visible
  Then I report "The Organization Portal Forgot new password and confirm password are different"

@TC_FINLSO_LoginTheOrganizationPortalExceptionNewPasswordoutofrange!
Scenario: Login The Organization Portal_Exception_ New Password out of range
  Given I login to Fintech as "orgSecond" operator
  Then I wait "2"
  Then I enter text in "Old Password" with value "Login.orgSecond.password"
  Then I enter text in "New Password" with value "Login.orgSecond.MinimumPassword"
  Then I enter text in "Confirm Password" with value "Login.orgSecond.Confirmpassword"
  When static text "Must be between 8 and 255 characters" is visible
  Then I report "The Organization Portal Forgot New Password out of range"

@TC_FINLSO_LoginTheOrganizationPortalFirstLoginTheOrganizationPortalSuccesed!
#Note-Need a new credential to excecute this testcase
Scenario:Login The Organization Portal_First Login The Organization Portal Succesed
  Given I login to Fintech as "orgtest" operator
  Then I enter text in "Old Password" with value "Login.orgtest.password"
  Then I enter text in "New Password" with value "Login.orgtest.Newpassword"
  Then I enter text in "Confirm Password" with value "Login.orgtest.Confirmpassword"
  Then I click on "Next" button in cite

@TC_FINLSO_LoginTheOrganizationPortalExceptionIncorrectpassword!
#Note-Need a new credential to excecute this testcase
Scenario:Login The Organization Portal_Exception_ Incorrect password
  Given I login to Fintech as "orgSecond" operator
  Then I check error text "Incorrect username, password, or status." is displayed
  Then I logout the "org" portal and close the browser

@TC_FINLSO_LoginOrganizationPortalSuccesed!
Scenario:Login The Organization Portal_Login The Organization Portal Succesed
  Given I login to Fintech as "org" operator
  Then I logout the "org" portal and close the browser

@TC_FINLSO_LoginOrganizationPortalExceptionShortCodeDoesNotExist!
Scenario:Login The Organization Portal_Exception_The Short Code does not exist
  Given I login to Fintech as "orgIncorrectShortcode" operator
  Then I check error text "The organization does not exist." is displayed
  Then I report "The organization operator login the portal failed"

@TC_FINLSO_LoginOrganizationPortalIncorrectPassword!
Scenario:Login The Organization Portal_Exception_ Incorrect Password
  Given I login to Fintech as "orgIncorrectPassword" operator
  Then I check error text "Incorrect username, password, or status." is displayed
  Then I report "The organization operator login the portal failed with incorrect password"

@TC_FINLSO_SPOperatoroftheSSOloginissuccessfulwiththecorrectusername,password,andverificationcode!
Scenario:The SSO login is successful with the correct user name, password, and verification code
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Security Audit Log" in the "Home" Page
  Then I wait "5"
  Then I check table "Table.Till" with multiple values as "AutomationFin1" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.CloseButtonINDetailspage"
  Then I report "The SSO login is successful and the SP portal home page is displayed."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatortoLogintotheSPPortalandSitchtotheConfigPortal!
Scenario:Login to the SP Portal and Sitch to the Config Portal
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  Then I wait "5"
  Then I switch to previousTab
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorofTillCreation_Exception_TillNumberAlreadyUsedByAnotherTill!
Scenario:Till Creation_Exception_Till Number Already Used By Another Till
  Given I login to Fintech as "sp" operator
  Given I generate name "anotherMSISDN" with value "2665000_RAND_4"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Till" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I enter text in "Label.Organization Short Code" with value "Till.MpatOrgOne.ShortCode"
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text in "Label.MSISDN" with value "anotherMSISDN"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber6"
  When static text "till number has been used" is visible
  Then I scroll "GenericLocators.SelectedProduct" to view using "false" parameter
  Then I click on "GenericLocators.AvaliableProduct"
  Then I click on "GenericLocators.ArrowRightButton"
  Then I click on "Submit" button in cite
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_CancelTheSSOlogoutsuccessfully!
Scenario:Cancel the SSO logout successfully
  Given I login to Fintech as "sp" operator
  Then I wait "5"
  Then I click on "GenericLocators.LogoutDropdown"
  Then I click on "GenericLocators.Logout"
  Then I click on "GenericLocators.Logout_No"
  Then I report "The SP portal is still displayed on the home page."

@TC_FINLSO_TheSSOLogoutSuccessful!
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

@TC_FINLSO_ExceptionTheSSOloginIsFailedWithTheIncorrectPassword!
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

@TC_FINLSO_SPOperatorCreateTillWithNakedNumberViaWeb!
Scenario:SP Operator Create Till_with Naked Number via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "TillMSISDN" with value "2665000_RAND_4"
  Given I generate name "TillNumber" with value "20_RAND_3"
  Then I create Till with below details
  | Short_Code           | MSISDN     | Till_Number | Language | Operator_ID | Product                       |
  | ShortCode.ShortCode2 | TillMSISDN | TillNumber  | English  | ABC1        | Agency Independent Store Till |
  # Then I click on left child menu "Identity" in the "Home" Page
  # Then I click on left child menu "Till" in the "Home" Page
  # Then I click on "GenericLocators.CreateButton"
  # Then I enter text in "Label.Organization Short Code" with value "Till.MpatOrgOne.ShortCode"
  # Then I enter text in "Label.MSISDN" with value "MSISDN"
  # Then I wait "5"
  # Then I click on "GenericLocators.TillAutogeneratecode"
  # Then I select drop down "Language" with option "DropDown.English"
  # Then I scroll "GenericLocators.AvailableProduct" to view using "false" parameter
  # Then I wait "5"
  # Then I click on "GenericLocators.AvailableProductCheckbox"
  # Then I click on "GenericLocators.AvailableProductArrow"
  # Then I click on "Submit" button in cite
  Then I verify Portal Log with below details
  | Table      | Log                | Tablevalue  | Sp  |
  | Table.Till | Identity Audit Log | Create Till | Yes |
  # Then I click on left child menu "Audit Log" in the "Home" Page
  # Then I click on left child menu "Identity Audit Log" in the "Home" Page
  # Then I check table "Table.Till" with multiple values as "Create Till" and click on "Detail" of "Operation" column
  # Then I click on "GenericLocators.CloseViewDetailIdentity"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatorofTillCreation_DefaultOperatorIDisnullCreateTillviaWeb!
Scenario:Till Creation_Default Operator ID is null Create Till via Web
  Given I login to Fintech as "sp" operator
  # Given I generate name "anotherMSISDN" with value "2665000_RAND_4"
  Given I generate name "TillMSISDN" with value "2665000_RAND_4"
  Given I generate name "TillNumber" with value "20_RAND_3"
  Then I create Till with below details
  | Short_Code           | MSISDN     | Till_Number | Language | Product                       |
  | ShortCode.ShortCode1 | TillMSISDN | TillNumber  | English  | Agency Independent Store Till |
  Then I report "Till created successfully, please wait for approving."
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_QueryMyOrganizationInfo!
Scenario: Query My Organization Info
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "My Organization " in org of the "Identity Center" Page
  Then I wait "4"
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_QueryorganizationoperatorInfo!
Scenario: Query organization operator Info
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I enter text in "Label.First Name" with value "aa"
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "ShortCode.ShortCode1" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I report "organization operator Info"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ExceptionTheorganizationsPINisnormal!
Scenario: Exception_ The organization's PIN is normal
  Given I login to Fintech as "orgnew" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I enter text in "Label.First Name" with value "aa"
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  #Then I check table "Table.OrganizationOperator" with multiple values as "OrgOperator.ShortCode1" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.DetailOrgPortal"
  Then I Switch tab
  Then I wait "4"
  Then I click on "GenericLocators.OperationButtonOrgop"
  Then I wait "3"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ExceptionTheOperatorIddoesnotexist!
Scenario: Exception_ The Operator Id does not exist
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.OrgOper"
  Then I enter text in "Label.Operator ID Org" with value "MpatOrg.OperatorID"
  Then I click on "Search" button in cite
  Then I wait "4"
  Then I report "The Operator Id does not exist and No records found."
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ExceptionTheShortCodedoesnotexist!
Scenario: Exception_ The Short Code does not exist
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.Shortcode"
  Then I click on "Search" button in cite
  When static text "The Organization Short Code is not existed" is visible
  Then I report "The ShortCode does not exist and No records found."
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_Searchforanorganizationoperatorwhentheshortcodeisempty!
Scenario: Search for an organization operator when the short code is empty
  Given I login to Fintech as "orgnew" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value ""
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  When static text "Specify at least one search condition of First Name, Middle Name, Last Name, Role, User Name, and Operator ID." is visible
  Then I report "Searchforanorganizationoperatorwhentheshortcodeisempty"
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_QueryAccountlistinMyOrganization
Scenario:Query Account list in My Organization
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "My Organization " in org of the "Identity Center" Page
  Then I wait "5"
  Then I scroll "GenericLocators.ExportButton" to view using "false" parameter
  Then I wait "5"
  Then I report "The My Organization Account list displays normal."
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TillCreation_Exception_TillMSISDNisoutofRange
Scenario: Till Creation_Exception_Till MSISDN is out of Range
  Given I login to Fintech as "org" operator
  Given I generate name "MSISDNOutOfRange" with value "8618799999999_RAND_6"
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I click on "Create" button in cite
  Then I Switch tab
  Then I enter text in "Label.Organization Short Code" with value ""
  Then I enter text in "Label.MSISDN" with value "MSISDNOutOfRange"
  Then I enter text in "Label.Organization Short Code" with value ""
  When static text "Must be between 1 and 18 characters" is visible
  Then I report "The MSISDN is out of msisdn range"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TillCreationExceptionTillNumberisoutofRange!
Scenario: Till Creation_Exception_Till Number is out of Range
  Given I login to Fintech as "org" operator
  Given I generate name "TillOutOFRange" with value "10219_RAND_10"
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I click on "GenericLocators.CreateTillOrg"
  Then I Switch tab
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I enter text in "Label.Till Number" with value "TillOutOFRange"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  When static text "The characters do not comply with the rule. The regular expression is '^([0-9A-Za-z]{4,12})$'." is visible
  Then I report "Till Number is out of Range"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_SPOperatortoAddAccountType!
#pending:Unable to switch frames
Scenario:Add Account Type
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Core Configuration"
  Then I switch to next frame
  Then I click on "GenericLocators.AddButton"
  Then I wait "5"
  Then I switch to previousTab
  Then I Switch tab
  Then I switch to left hand menu
  Then I enter text in "Label.Account Type Name" with value "Transaction"
  Then I enter text in "Label.Account Type Alias" with value "Alias"
  Then I enter text in "Display Nameone" with value "Display"
  Then I enter text in "Label.Description" with value "Description"
  Then I select drop down "Account Model" with the "DropDown.Control"
  Then I click on "Label.AllowOverdraft" checkbox
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Yesbutton"
  Then I click on "Return >>" button in cite
  Then I enter text in "Label.AccountTypeNameone" with value "Transaction"
  Then I click on "Search"
  Then I check table "Table.accountType" with multiple values as "Control" and click on "Release" of "Operation" column
  Then I click on "GenericLocators.Yesbutton"
  When I click on top menu "My Functions" and select sub menu "Reporting"
  Then I click on "Search"
  Then I check table "Table.dataList" with multiple values as "Time" and click on "View" of "Operation" column
  Then I click on "Return" button in cite
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatortoAddProduct!
#pending:Unable to switch frames
Scenario:Add Product
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Core Configuration"
  Then I click on left child menu "Product" in the "Home" Page
  Then I switch to next frame
  Then I click on "GenericLocators.AddButton"
  Then I enter text in "Label.ProductName" with value "Product"
  Then I enter text in "Label.Descriptionone" with value "Description"
  Then I enter text in "Label.DisplayName" with value "Display"
  Then I enter text in "Label.DisplayDescription" with value "Display"
  Then I enter text in "Label.AdvanceNotification(Days)" with value "TenDays"
  Then I click on "Submit" button in cite
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.Yesbutton"
  Then I click on "GenericLocators.Addproduct"
  Then I click on "OK" button in cite
  Then I click on "Add" button in cite
  Then I click on "Add" button in cite
  Then I click on "GenericLocators.AddCustomerBeneficiary"
  Then I click on "OK" button in cite
  Then I click on "Return >>" button in cite
  Then I enter text in "Label.ProductName" with value "Product"
  Then I click on "Search"
  Then I check table "Table.accountType" with multiple values as "Product Name" and click on "Release" of "Operation" column
  Then I click on "GenericLocators.Yesbutton"
  When I click on top menu "My Tasks" and select sub menu "Group Task"
  Then I click on a "Search"
  Then I check table "Table.task_data" with multiple values as "Task No" and click on "Process" of "Operation" column
  Then I click on "Approve" radio
  Then I enter text area "Comments" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I click on "GenericLocators.Yesbutton"
  When I click on top menu "My Functions" and select sub menu "Reporting"
  Then I click on "Search"
  Then I check table "Table.dataList" with multiple values as "Time" and click on "View" of "Operation" column
  Then I click on "Return" button in cite
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_LoginOrganizationPortalException_DoNotSelectanyProductToCreateCustomer!
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
  Then I select drop down "Secret Question" with option "DropDown.Whatisyourfirstcellphone"
  Then I enter text in "Label.SecretAnswer" with value "Answer"
  Then I click on "Next" button in cite
  Then I check error text "Please add" is displayed
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser

@TC_FINLSO_LoginOrganizationPortaltoCreateCustomeronOrgnizationPortal_AddProductsonTheEnterDetailspage
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
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I enter text in "Label.LastNameInorgpage" with value "LastName"
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
  Then I scroll "GenericLocators.ScrollAddressDetail" to view using "false" parameter
  Then I enter text in "Label.CityorTownInorgpage" with value "city"
  Then I select drop down "Secret Question" with option "DropDown.SecretQuestion"
  Then I enter text for "GenericLocators.SecretAnswer" with value "Placeofbirth"
  Then I click on "Next" button in cite
  Then I click on "Next" button in cite
  Then I click on " Submit " button in cite
  Then I scroll page to top
  Then I click on " View Detail >> " to check
  Then I report "Org operator can Create Customer on Orgnization Portal_Add Products on The Enter Details page"
  Then I switch to previousTab
  Then I logout the "org" portal and close the browser

@TC_FINLSO_SPOperatorChangeTillLanguageviaWebTillStatusActive!
Scenario: SP Operator Change Till Language via Web_ Till Status Active
  Given I login to Fintech as "sp" operator
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code | Till Number                 | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber1 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode1    | Till.MpatOrgOne.TillNumber1 | Till.MpatOrgOne.TillNumber1 | Status.Active |
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  When static text "Language edited successfully" is visible
  Then I change Language with value "English" and Remark as "Test"
  When static text "Language edited successfully" is visible
  Then I click on left child menu "Audit Log" in the "Home" Page
  Then I click on left child menu "Identity Audit Log" in the "Home" Page
  Then I check table "Table.IdentityAuditlog" with multiple values as "SP Operator" and click on "Detail" of "opration" column
  Then I click on "GenericLocators.CloseViewDetails"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SSPOperatorCloseTillviaWeb_TillStatusFrozen!
#Pending - need a active till number to work with this test case!
Scenario:SP Operator Close Till via Web_Till Status Frozen
  Given I login to Fintech as "sp" operator
  #Prerequisite - need a frozen till
  When I search for "Till" with below details
  | TableId    | TableValues                 | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                 | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber8 | Till Number + Organization Short Code | Label.Till Number | ShortCode.NewShortCode  | Till.MpatOrgOne.TillNumber8 | Status.Active |
  Then I edit Identity Status in "Till" with value "Frozen"
  Then I wait "5"
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
  Then I report "SP operator closes till when the till status is frozen"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ChangeMyOrganizationTillStatusViaWeb!
Scenario:Change My Organization Till Status via Web
  Given I login to Fintech as "orgnew" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I enter text for "GenericLocators.TillMSISDN" with value "Till.MpatOrgOne.MSISDN"
  Then I click on " Search " button in cite
  Then I click on " Search " button in cite
  Then I edit Identity Status of Till in Org Portal with value "Frozen"
  # Then I check table "Table.Till" with multiple values as "Test" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.DetailsOrg"
  Then I wait "5"
  Then I Switch tab
  Then I click on "GenericLocators.Auditlog"
  Then I select drop down "Category" with option "DropDown.Identity Management"
  Then I wait "5"
  Then I click on "Search" button in cite
  Then I check table "Table.Till" with multiple values as "Change Till Status" and click on "Detail" of "Operation" column
  Then I wait "5"
  Then I switch to previousTab
  Then I edit Identity Status of Till in Org Portal with value "Active"
  Then I report "Org Operator Changes My Organization Till Status via Web"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_QueryMyOrganizationTilllistAndInfo!
Scenario:Query My Organization Till list and Info
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on the "Till" tab
  Then I wait "5"
  Then I enter text for "GenericLocators.TillMSISDNList" with value "Till.MpatOrgOne.MSISDN"
  Then I click on "GenericLocators.SearchTill"
  Then I check table "Table.Till" with multiple values as "Till.MpatOrgOne.MSISDN" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I switch to previousTab
  Then I report "Org Operator enqire Query My Organization Till list and Info"
  Then I logout the "org" portal and close the browser

@TC_FINLSO_SPOperatortoCreateaCopyBankStatementTemplate!
Scenario:Create a Copy Bank Statement Template
  Given I login to Fintech as "sp" operator
  Given I generate name "BankName" with value "Bank_RAND_4"
  Then I click on "GenericLocators.Configuration"
  Then I click on "GenericLocators.BankName"
  Then I click on "GenericLocators.BankStatementTemplate"
  Then I click on "GenericLocators.Create"
  Then I enter text for "GenericLocators.PleaseEntertextbox" with value "BankName"
  Then I wait "20"
  Then I select drop down "Statement Type" with option "Normal Transactions"
  Then I click on "GenericLocators.StatementType"
  Then I click on "GenericLocators.NormalTransactions"
  Then I click on "GenericLocators.Format"
  Then I click on "GenericLocators.CSV"
  Then I click on " Submit" button in cite
  Then I check table "Table.BankAccountCreated" with multiple values as "BankName" and click on "Detail" of "Operation" column
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_SPOperatortoCreateaCreateaTrustAccount!
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

@TC_FINLSO_ChangeTillStatus_Exception_TillinPendingActiveStatus
Scenario: Change Till Status_Exception_Till in Pending Active Status
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber" and click on "Detail" of "Operation" column
  Then I wait "10"
  Then I Switch tab
  Then I report "There is no Edit button against Identity status when status is Pending Active"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ChangeTillStatus_ChangeTillfromFrozentoActive
Scenario: Change Till Status_Change Till from Frozen to Active
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber1"
  Then I click on "Search" button in cite
  Then I edit Identity Status of Till in Org Portal with value "Frozen"
  Then I edit Identity Status of Till in Org Portal with value "Active"
  When static text "Status edited successfully" is visible
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber1" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue         | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Status | Yes |
  # Then I click on the "Audit Log" tab
  # Then I select drop down "Category" with option "Identity Management"
  # Then I select drop down "Event Group" with option "DropDown.Till"
  # Then I click on "Search" button in cite
  # Then I check table "Table.OrgAuditLog" with multiple values as "GenericLocators.TillEvent|DropDown.Change Till Status" and click on "Detail" of "Operation" column
  # Then I wait "6"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ChangeTillStatus_ChangeTillfromActivetoFrozen
Scenario: Change Till Status_Change Till from Active to Frozen
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber1"
  Then I click on "Search" button in cite
  Then I edit Identity Status of Till in Org Portal with value "Frozen"
  Then I edit Identity Status of Till in Org Portal with value "Active"
  When static text "Status edited successfully" is visible
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber1" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue         | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Status | Yes |
  # Then I click on the "Audit Log" tab
  # Then I select drop down "Category" with option "Identity Management"
  # Then I select drop down "Event Group" with option "DropDown.Till"
  # Then I click on "Search" button in cite
  # Then I check table "Table.OrgAuditLog" with multiple values as "GenericLocators.TillEvent|DropDown.Change Till Status" and click on "Detail" of "Operation" column
  # Then I wait "6"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ConfigPortalandSPPortallogoutatthesametimeviaclickSPPortalLogoutButton
Scenario:Config Portal and SP Portal logout at the same time when we click sp portal logout Button
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  Then I wait "10"
  Then I switch to previousTab
  Then I logout the "sp" portal and close the browser
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operation Support"
  Then I wait "10"
  Then I report "Sp portal and config portal logout when when we click sp portal logout button"

@TC_FINLSO_ConfigPortalandSPPortalLogoutattheSameTimeviaClickConfigPortalLogoutButton
Scenario:Config Portal and SP Portal Logout at the Same Time via Click Config Portal Logout Button
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  Then I wait "10"
  Then I logout the "config" portal and close the browser
  Then I report "Config portal successful, The SP portal login page is displayed."

@TC_FINLSO_ChangeTillStatus_Exception_ChangeTillfromclosetoActiveStatus
Scenario: Change Till Status_Exception_Change Till from close to Active Status
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber_Closed"
  Then I click on " Search " button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber_Closed" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I wait "8"
  Then I report "There is no Edit button against Identity status"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ChangeTilllanguage_Exception_TillstatusisClosechangeTillLanguageviaWeb
Scenario: Change Till language_Exception_Till status is Close change Till Language via Web
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber_Closed"
  Then I click on " Search " button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber_Closed" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  Then I click on "GenericLocators.ConfirmButton"
  Then I report "We get an exception while editing the language of a close till"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ChangeTilllanguage_TillstatusisFrozenchangeTillLanguageviaWeb
Scenario: Change Till language_Till status is Frozen change Till Language via Web
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber1"
  Then I click on " Search " button in cite
  Then I edit Identity Status of Till in Org Portal with value "Frozen"
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber1" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I wait "5"
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  Then I change Language with value "English" and Remark as "Test"
  When static text "Language edited successfully" is visible
  Then I switch to previousTab
  Then I click on " Search " button in cite
  Then I edit Identity Status of Till in Org Portal with value "Active"
  Then I Switch tab
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue           | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Language | Yes |
  # Then I click on the "Audit Log" tab
  # Then I select drop down "Category" with option "Identity Management"
  # Then I select drop down "Event Group" with option "DropDown.Till"
  # Then I click on "Search" button in cite
  # Then I check table "Table.OrgAuditLog" with multiple values as "Change Till Language" and click on "Detail" of "Operation" column
  # Then I wait "5"
  # Then I click on "GenericLocators.Closebutton"
  Then I report "Language change is successfull when till is in frozen state"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ChangeTilllanguage_TillstatusisActivechangeTillLanguageviaWeb
Scenario: Change Till language_(PASS)Till status is Active change Till Language via Web
  Given I login to Fintech as "orgnew" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.MSISDN"
  Then I enter text in "Label.MSISDN" with value "Till.MpatOrgOne.MSISDN1"
  Then I click on " Search " button in cite
  Then I click on " Search " button in cite
  #Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.MSISDN" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.DetailOrgPortal"
  Then I Switch tab
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  Then I change Language with value "English" and Remark as "Test"
  When static text "Language edited successfully" is visible
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue           | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Language | Yes |
  Then I report "Language change is successfull when till is in Active state"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ChangeTilllanguage_TillstatusisPendingActivechangeTillLanguageviaWeb
Scenario: Change Till language_Till status is Pending Active change Till Language via Web
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.MSISDN"
  Then I enter text in "Label.MSISDN" with value "Till.MpatOrgOne.Till_MSISDN_Pending1"
  Then I click on " Search " button in cite
  Then I click on " Search " button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.MSisdnInPending" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I change Language in OrgPortal with value "English" and Remark as "test"
  Then I change Language in OrgPortal with value "Southern Sotho" and Remark as "test"
  When static text "Language edited successfully" is visible
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue           | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Language | Yes |
  Then I report "Language change is successfull when till is in Pending Active state"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_WhenTheTillOrganizationisinthefrozenstateToChangeTillDevice!
Scenario: When The Till Organization is in the frozen state To Change Till Device
  #Pre-Requisite
  Given I login to Fintech as "sp" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Active |
  Then I edit Identity Status in "Organization" with value "Frozen"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I click on left child menu "Identity" in the "Home" Page
  When I search for "Till" with below details
  | TableId    | TableValues                  | Query Condition                       | SearchBy          | Organization Short Code | SearchValue                  | Status        |
  | Table.Till | Till.MpatOrgOne.TillNumber10 | Till Number + Organization Short Code | Label.Till Number | ShortCode.ShortCode2    | Till.MpatOrgOne.TillNumber10 | Status.Active |
  Then I scroll "GenericLocators.ScrollDevice" to view using "false" parameter
  Then I edit Device MSISDN with value "MSISDN"
  Then I edit Device MSISDN with value "Till.MpatOrgOne.MSISDN4"
  Then I verify Portal Log with below details
  | Table                  | Log                | Tablevalue         | Sp  |
  | Table.IdentityAuditlog | Identity Audit Log | Change Till Device | Yes |
  Then I report "Sp can change device when Till and organization are in Frozen State"
  #Post Requisite
  When I search for "Organization" with below details
  | TableId            | TableValues          | SearchBy                      | SearchValue          | Status        |
  | Table.Organization | ShortCode.ShortCode2 | Label.Organization Short Code | ShortCode.ShortCode2 | Status.Frozen |
  Then I edit Identity Status in "Organization" with value "Active"
  When MakerChecker is on "Approve" task from group task for "Approve 'Change Organization Status'"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_TillCreation_Exception_TillNumberAlreadyUsedByAnotherTill
Scenario:Till Creation_Exception_Till Number Already Used By Another Till
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I click on "Create" button in cite
  Then I Switch tab
  Then I enter text in "Label.Organization Short Code" with value ""
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber"
  Then I enter text in "Label.Organization Short Code" with value ""
  When static text "till number has been used" is visible
  Then I report "The static text is visible that the till number is already been used "
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TillClose_Exception_TillstatusisPendingActivecolsetheTill
Scenario: Till Close_Exception_Till status is Pending Active colse the Till in Org Portal
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.Till_PendingActive1"
  Then I click on " Search " button in cite
  Then I report "There is no option for closing the till when its in pending state"
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TillClose_TillstatusisFrozencolsetheTill
#need An frozen till to run this test case.
Scenario: Till Close_Till status is Frozen colse the Till	In org Portal
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.ClosedTill"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.ClosedTill" and click on "Close" of "Operation" column
  Then I enter text area "Remark" with value "Testing" in the popup dialog window
  Then I click on "Confirm" button in cite
  #When static text "TIll close successfully" is visible
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.ClosedTill" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I wait "6"
  Then I click on the "Audit Log" tab
  Then I select drop down "Category" with option "Identity Management"
  Then I select drop down "Event Group" with option "DropDown.Till"
  Then I select drop down "GenericLocators.TillEvent" with the "DropDown.EventClosetill"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "DropDown.EventClosetill" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.Closebutton"
  Then I wait "6"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TillClose_TillstatusisActivecolsetheTill
#need An Active till to run this test case.
Scenario: Till Close_Till status is Active colse the Till	In org Portal
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber3"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber3" and click on "Close" of "Operation" column
  Then I enter text area "Remark" with value "Testing" in the popup dialog window
  Then I click on "Confirm" button in cite
  #When static text "TIll close successfully" is visible
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber3" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I wait "6"
  Then I click on the "Audit Log" tab
  Then I select drop down "Category" with option "Identity Management"
  Then I select drop down "Event Group" with option "DropDown.Till"
  Then I select drop down "GenericLocators.TillEvent" with the "DropDown.EventClosetill"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "DropDown.EventClosetill" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.Closebutton"
  Then I wait "6"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_QueryCustomerbyIdentityID!
Scenario: Query Customer by Identity ID
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Customer " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.IdentityID"
  Then I select drop down "Identity ID" with option "DropDown.RegisteredCustomer"
  Then I enter text for "GenericLocators.selectLabel" with value "Customer.Registered_Customer_Eleven"
  Then I click on "Search" button in cite
  Then I wait "3"
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_SPOperatortoSearchforWorkflowHistoryontheSPportal!
Scenario:Search for Workflow History on the SP portal
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Task Center" in the "Home" Page
  Then I click on "GenericLocators.TaskManagement"
  Then I click on "GenericLocators.WorkflowHistory"
  Then I click on " Search " button in cite
  Then I report "all of Canceled & Completed & expired & Rejected Workflows"
  Then I logout the "sp" portal and close the browser


@TC_FINLSO_TILLAuditLogAuditLogsAreRecordedwhenTheTillLanguageIsChanged!
Scenario: TILL Audit Log_Audit Logs Are Recorded when The Till Language Is Changed.
  Given I login to Fintech as "orgnew" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber"
  Then I click on " Search " button in cite
  Then I click on " Search " button in cite
  #Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.DetailsOrg"
  Then I Switch tab
  Then I change Language with value "Southern Sotho" and Remark as "Test"
  Then I change Language with value "English" and Remark as "Test"
  When static text "Language edited successfully" is visible
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue           | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Language | Yes |
  Then I report "Language change is successfull and Audit Logs Are Recorded"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TILLAuditLogAuditLogsAreRecordedwhenTheTillMSISDNIsChanged!
Scenario: TILL Audit Log_Audit Logs Are Recorded when The Till MSISDN Is Changed
  Given I login to Fintech as "org" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.MSISDN"
  Then I enter text in "Label.MSISDN" with value "Till.MpatOrgOne.MSISDN"
  Then I wait "4"
  Then I click on " Search " button in cite
  Then I click on " Search " button in cite
  #Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.DetailsOrg"
  Then I Switch tab
  Then I click on "GenericLocators.EditMSISDNOrg"
  Then I enter text in "New MSISDN" with value "MSISDN"
  Then I enter text area "Remark" with value "Test"
  Then I click on "GenericLocators.TillMsisdnSubmit"
  Then I click on "GenericLocators.EditMSISDNOrg"
  Then I enter text in "New MSISDN" with value "Till.MpatOrgOne.MSISDN"
  Then I enter text area "Remark" with value "Test"
  Then I click on "GenericLocators.TillMsisdnSubmit"
  #Then I edit Device MSISDN with value "MSISDN"
  #Then I edit Device MSISDN with value "Till.MpatOrgOne.MsisdnNo7"
  When static text "MSISDN edited successfully" is visible
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue         | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Device | Yes |
  # Then I click on the "Audit Log" tab
  # Then I select drop down "Category" with option "Identity Management"
  # Then I click on "Search" button in cite
  # Then I check table "Table.OrgAuditLog" with multiple values as "Change Till Device" and click on "Detail" of "Operation" column
  # Then I wait "6"
  # Then I click on "GenericLocators.Closebutton"
  Then I report "Device change is successfull and Audit Logs Are Recorded"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ChangeTillService_Exception_TillStatusInvalid
Scenario: Change Till Service_Exception_Till Status Invalid
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber_Closed"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber_Closed" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I wait "6"
  Then I click on "GenericLocators.ConfirmException"
  Then I wait "3"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ChangeTillService_RemoveTillProduct
Scenario: Change Till Service_Remove Till Product
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.MSISDN"
  Then I enter text in "Label.MSISDN" with value "Till.MpatOrgOne.MSISDN1"
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.MSISDN1" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I check table "Table.ProductAdd" with multiple values as "Product Name|Super Agent Till" and click on "Delete" of "Operation" column
  Then I wait "3"
  Then I click on "GenericLocators.ConfirmButton"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  When static text "Product edited successfully" is visible
  Then I scroll page to top
  Then I click on the "Audit Log" tab
  Then I select drop down "Category" with option "Identity Management"
  Then I select drop down "Event Group" with option "DropDown.Till"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "GenericLocators.TillEvent|DropDown.Change Till Product" and click on "Detail" of "Operation" column
  Then I wait "6"
  Then I click on "GenericLocators.Closebutton"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ChangeTillService_AddTillProduct
Scenario: Change Till Service_Add Till Product
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.MSISDN"
  Then I enter text in "Label.MSISDN" with value "Till.MpatOrgOne.MSISDN1"
  Then I click on "Search" button in cite
  Then I click on "Search" button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.MSISDN1" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I Add product in till as "Super Agent Till"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  When static text "Product edited successfully" is visible
  Then I scroll page to top
  Then I click on "Edit" button in cite
  Then I check table "Table.ProductAdd" with multiple values as "Product Name|Super Agent Till" and click on "Delete" of "Operation" column
  Then I click on "GenericLocators.ConfirmButton"
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  When static text "Product edited successfully" is visible
  Then I scroll page to top
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue          | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Product | Yes |
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TILLAuditLogAuditLogsAreRecordedwhenTheTillProductIsChanged!
Scenario: TILL Audit Log_Audit Logs Are Recorded when The Till Product Is Changed.
  Given I login to Fintech as "orgnew" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber"
  Then I click on " Search " button in cite
  Then I click on " Search " button in cite
  #Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.DetailsOrg"
  Then I Switch tab
  Then I click on the "Product" tab
  Then I click on "Edit" button in cite
  Then I click on "Add" button in cite
  Then I wait "3"
  Then I click on "AddProduct.AllProduct" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I enter text area "Remark" with value "Test"
  Then I click on "Submit" button in cite
  When static text "Product edited successfully" is visible
  Then I report "The Product is successfully modified. The modification is successfully submitted."
  Then I scroll "GenericLocators.Status" to view using "false" parameter
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue          | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Product | Yes |
  Then I report "Product change is successfull and Audit Logs Are Recorded"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_QueryAccountInfoinOrganizationInfo!
#Pending -unable to access the table
Scenario: Query Account Info in Organization Info
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on "GenericLocators.OrganizationORG"
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I click on "Search" button in cite
  Then I scroll "GenericLocators.DetailsOrg" to view using "false" parameter
  #Then I check table "Table.CustomerAuditLog" with multiple values as "ShortCode.ShortCode1" and click on "Detail " of "Operation" column
  Then I click on "GenericLocators.DetailOrgPortal"
  Then I Switch tab
  Then I wait "4"
  Then I report "Account Info in Organization Info"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TILLAuditLogAuditLogsAreRecordedwhenTheTillDefaultOperatorIDIsChanged!
Scenario: TILL Audit Log_Audit Logs Are Recorded when The Till Default Operator ID Is Changed.
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.TillNumber7"
  Then I click on " Search " button in cite
  Then I click on " Search " button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.TillNumber7" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I wait "5"
  Then I edit Default Operator Id with value "012345" and Remark as "Reason Description"
  Then I wait "3"
  When static text "Default Operator Id edited successfully" is visible
  Then I report "Org Operator Change Till Default Operator Id "
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue                     | Org |
  | Table.OrgAuditLog | Identity Management | Change Till Default OperatorId | Yes |
  Then I report "Default OperatorId change is successfull and Audit Logs Are Recorded"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_GenerateRecReportReject!
Scenario: Generate Reconciliation Report - Reject
  Given I login to Fintech as "sp" operator
  Then I click on left child menu "Fund Management" in the "Home" Page
  Then I click on left child menu "E-money Management" in the "Home" Page
  Then I click on left child menu "Bank Reconciliation" in the "Home" Page
  Then I click on left child menu "Generate Reconciliation Report" in the "Home" Page
  Then I click on "Generate Summary" button in cite
  Then I click on "Confirm" button in cite
  Then I enter text area "Remark" with value "Reason Description"
  Then I wait "15"
  Then I click on "Submit" button in cite
  Then I click on left child menu "Approve Reconciliation Report" in the "Home" Page
  Then I check table "Table.ApproveReconciliation" with multiple values as "Login.sp.UserID" and click on "Process" of "Operation" column
  Then I click on "Reject " radio
  Then I enter text area "Remark" with value "Reason Description"
  Then I click on "Submit" button in cite
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_TransferFromMerchantPayToMerchantViaWEB!
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

@TC_FINLSO_SPCreateOrgOperatorViaWeb!
Scenario:Create Organization Operator - SP Operator Create WEB Organization Operator via Web
  Given I login to Fintech as "sp" operator
  Given I generate name "userName" with value "spoperator_RAND_4"
  Given I generate name "MSISDN" with value "861330000_RAND_4"
  Given I generate name "FirstName" with value "Test"
  Given I generate name "LastName" with value "Automation"
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "SP Operator" in the "Home" Page
  Then I click on "GenericLocators.CreateButton"
  Then I select drop down "Language" with option "DropDown.English"
  Then I enter text in "Label.Username" with value "userName"
  Then I click on "Next" button in cite
  Then I click on "Add" button in cite
  Then I click on "SpRole.SPOperatorRole" checkbox in dialog window
  Then I click on "Confirm" button in cite
  Then I click on "Next" button in cite
  Then I enter text in "Label.First Name" with value "FirstName"
  Then I enter text in "Label.LastName" with value "LastName"
  Then I enter text in "Label.Email" with value "Test Email"
  Then I select drop down "Preferred Notification Channel" with option "Label.Email"
  Then I enter text in "Label.Notification Receiving E-MAIL" with value "Test Email"
  Then I click on "Next" button in cite
  Then I click on "Submit" button in cite
  Then I report "SP Operator Create WEB Organization Operator via Web"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_ChangeOrganizationOperatorsLanguage
Scenario: Change Organization Operator's Language
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Org Operator " in org of the "Identity Center" Page
  Then I enter text in "Label.Organization Short Code" with value "OrgOperator.ShortCode1"
  Then I enter text in "Label.Username" with value "Prak"
  Then I click on "Search" button in cite
  Then I check table "Table.OrganizationOperator" with multiple values as "Label.Username|Prak" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I wait "5"
  Then I change Language in OrgPortal with value "Southern Sotho" and Remark as "test"
  When static text "Change Language success!" is visible
  #post-requsite
  Then I change Language in OrgPortal with value "English" and Remark as "test"
  When static text "Change Language success!" is visible
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_DownloadBulkPaymentTaskTemplatebyOrgOperator
Scenario: Download Bulk Payment Task Template by Org Operator
  Given I login to Fintech as "org" operator
  Then I click on "Business Center" on button in top menu
  Then I click on left child menu "Bulk Task Template Download " in org of the "Business Center" Page
  Then I enter text in "Label.Tamplate Name" with value "Payment"
  Then I click on " Search " button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "Label.Tamplate Name|PAYMENT" and click on "Download" of "Operation" column
  Then I check file is downloaded in "csv" format
  Then I wait "10"
  Then I click on "homepage.ProfileOrg"
  Then I click on "homepage.OrgMypreference"
  Then I click on "GenericLocators.MyprefAuditLog"
  Then I select drop down "Category" with option "Task"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "Event" and click on "Detail" of "Operation" column
  Then I wait "5"
  Then I click on "GenericLocators.Closebutton"
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_ExportNotificationType!
Scenario: Export Notification Type
  Given I login to Fintech as "sp" operator
  Then I click on "GenericLocators.Configuration"
  Then I click on left child menu "Config Portal" in the "Home" Page
  Then I click on "GenericLocators.OKButton"
  Then I Switch tab
  When I click on top menu "My Functions" and select sub menu "Operational Configuration"
  Then I click on Left child menu "Notification Type" in config
  Then I click on "GenericLocators.AllNotificationTypeEntry"
  Then I wait "5"
  Then I click on "Export" button in Notification Type Window
  Then I check file is downloaded in "excel" format
  Then I switch to previousTab
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_TopOrgValidationModeSPPortal!
Scenario: Top Organization set the Validation Mode Validation in SP Portal
  Given I login to Fintech as "sp" operator
  Given I generate name "OrgName" with value "TopOrg_Name_RAND_5"
  Given I generate name "BankAccName" with value "BankAccName_RAND_5"
  Given I generate name "BankAccNo" with value "RAND_10"
  Given I generate name "ShortCode" with value "RAND_6"
  Then I click on "Create" button in cite
  Then I select the "GenericLocators.Create_Identity" and click on " Create Top Organization "
  Then I create top organization with below details
  | Product                               | ShortCode | OrgName | Region             | Type Of Business                               | Company Registration Certificate Number | Organisation Category Code                           | Preferred Notification Channel | Email      | Preferred Notification Language          | Contact ID Number | Validation Mode | Commission Settlement Configuration | Bank Head Office | Bank            | Asset Type     | Currency      | Account Name | Account Number |
  | Product.C2B Business - Utlity Payment | ShortCode | OrgName | Region.Butha-Buthe | Type Of Business.Non-Governmental Organisation | 1234                                    | Organisation Category Code.0742 -Veterinary services | Email                          | Test Email | Preferred Notification Language.Language | 123456789         | No Validation   | default settle template             | Bank.HeadOffice  | Bank.TopOrgBank | Bank.AssetType | Bank.Currency | BankAccName  | BankAccNo      |
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_TILLAuditLogCloseTillandRecordAuditLogs!
#Pending: need an Active till to run this test case.
Scenario: TILL Audit Log_Close Till and Record Audit Logs
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I select drop down "Query Condition" with option "DropDown.TillqueryCondition"
  Then I enter text in "Label.Till Number" with value "Till.MpatOrgOne.ClosedTill"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.ClosedTill" and click on "Close" of "Operation" column
  Then I enter text area "Remark" with value "Testing" in the popup dialog window
  Then I click on "Confirm" button in cite
  When static text "TIll close successfully" is visible
  Then I check table "Table.OrgTill" with multiple values as "Till.MpatOrgOne.ClosedTill" and click on "Detail" of "Operation" column
  Then I Switch tab
  Then I wait "6"
  Then I click on the "Audit Log" tab
  Then I select drop down "Category" with option "Identity Management"
  Then I select drop down "Event Group" with option "DropDown.Till"
  Then I select drop down "GenericLocators.TillEvent" with the "DropDown.EventClosetill"
  Then I click on "Search" button in cite
  Then I check table "Table.OrgAuditLog" with multiple values as "DropDown.EventClosetill" and click on "Detail" of "Operation" column
  Then I click on "GenericLocators.Closebutton"
  Then I wait "6"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TILLAuditLogRecordingforTillCreation!
Scenario: TILL Audit Log_Audit Log Recording for Till Creation
  Given I login to Fintech as "org" operator
  Given I generate name "MSISDN" with value "2665000_RAND_4"
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I click on "GenericLocators.CreateTillOrg"
  Then I Switch tab
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I enter text in "Label.MSISDN" with value "MSISDN"
  Then I select drop down "Language" with option "DropDown.English"
  Then I scroll "GenericLocators.SelectedProduct" to view using "false" parameter
  Then I click on "GenericLocators.AvaliableProduct"
  Then I click on "GenericLocators.ArrowRightButton"
  Then I click on "Submit" button in cite
  Then I scroll page to top
  Then I click on " View Detail >> " to check
  Then I verify Portal Log with below details
  | Table             | Log                 | Tablevalue  | Org |
  | Table.OrgAuditLog | Identity Management | Create Till | Yes |
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_SANITY_FINLSO_BusinessOp-VerifySPOperatorisabletosearchtransactionbyreceiptno!
Scenario:Business Op -Verify SP Operator is able to search transaction by receipt no
  Given I login to Fintech as "spBackoff" operator
  Then I click on left child menu "Identity" in the "Home" Page
  Then I click on left child menu "Organization" in the "Home" Page
  Then I enter text in "Label.Organization Short Code" with value "ShortCode.ShortCode1"
  Then I click on " Search " button in cite
  Then I check table "Table.Organization" with multiple values as "ShortCode.MpatOrgOne" and click on "Detail" of "Operation" column
  Then I wait "5"
  Then I click on "GenericLocators.Transaction"
  Then I click on "GenericLocators.InitiateTransaction"
  Then I click on "GenericLocators.Transactionservices"
  Then I click on "GenericLocators.TransferofFundsFromOrganization"
  Then I click on "GenericLocators.Identifier"
  Then I click on "GenericLocators.Identifiertype"
  Then I enter text for "GenericLocators.Amount" with value "5"
  Then I enter text area "Remark" with value "Reason Description"
  Then I select drop down "Reason" with option "Input Manually ..."
  Then I enter text for "GenericLocators.Reason" with value "Reason Description"
  Then I click on "Submit" button in cite
  When static text "Initiate Transaction submitted successfully." is visible
  Then I click on " View Detail >> " to check
  Then I get value from label in " Receipt No.  " and store it in "TransReceipt"
  Then I click on left child menu "Transaction" in the "Home" Page
  Then I enter text in "Label.ReceiptNo" with value "TransReceipt"
  Then I click on "GenericLocators.SearchReceipt"
  Then I report "Transfer From Merchant Pay To Merchant Via WEB is Successfully Completed"
  Then I logout the "sp" portal and close the browser

@TC_FINLSO_TillCreation_Exception_TillMSISDNAlreadyUsedByAnotherTill!
Scenario: Till Creation_Exception_Till MSISDN Already Used By Another Till
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I click on "Create" button in cite
  Then I Switch tab
  Then I enter text in "Label.Organization Short Code" with value ""
  Then I enter text in "Label.MSISDN" with value "Till.MpatOrgOne.MSISDN"
  Then I enter text in "Label.Organization Short Code" with value ""
  When static text "The MSISDN already exists." is visible
  Then I report "The static text is visible that the Till MSISDN is already been used By Another Till"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser

@TC_FINLSO_TillCreation_Exception_TillMSISDNAlreadyUsedByCustomer!
Scenario: Till Creation_Exception_Till MSISDN Already Used By Customer
  Given I login to Fintech as "org" operator
  Then I click on "Identity Center" on button in top menu
  Then I click on left child menu "Till " in org of the "Identity Center" Page
  Then I click on "Create" button in cite
  Then I Switch tab
  Then I enter text in "Label.Organization Short Code" with value ""
  Then I enter text in "Label.MSISDN" with value "Customer.Registered_Customer1"
  Then I enter text in "Label.Organization Short Code" with value ""
  When static text "The MSISDN already exists." is visible
  Then I report "The static text is visible that the Till MSISDN is already been used By Customer"
  Then I switch to previousTab
  Then I click on "Home" on button in top menu
  Then I logout the "org" portal and close the browser