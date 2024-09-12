@ECHO OFF
::Example command execute.bat lso uat2 "@TC_CreateCentrallyOwnedOrganisation" "@TC_CreateMNOOrganization"

:: Setting up variables
SET TEST_IDS=
SET GAF_TEST_MARKET=
SET GAF_TEST_ENVIRONMENT=

SET GAF_TEST_MARKET=%~1
SET GAF_TEST_ENVIRONMENT=%~2

SHIFT
SHIFT

:generate_ids
IF "%1"=="" GOTO execute
SET TEST_IDS=%TEST_IDS% %1
SHIFT
GOTO generate_ids

:execute
SET TEST_IDS=%TEST_IDS:~1%
ECHO %TEST_IDS%
SET TEST_IDS=%TEST_IDS: =^^^|%
ECHO %TEST_IDS%

node lib\main.js run --steps --grep "\"%TEST_IDS%\"
allure generate output/allure/results --clean -o ./generated/allure-report