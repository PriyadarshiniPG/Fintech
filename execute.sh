#!/bin/bash

if [ $# -lt 3 ]
then
        echo "ERROR: Argument missing"
        echo "Usage: execute.sh <country> <environment>  <list of test cases>"
        echo "Example: execute.sh tza uat TC1 TC2 TC3"
        exit 1
fi

export GAF_TEST_ENVIRONMENT=$2
export GAF_TEST_MARKET=$1

echo "TEST MARKET is $GAF_TEST_MARKET"
echo "TEST ENVIRONMETN is $GAF_TEST_ENVIRONMENT"
shift
shift
## Getting total number of test cases
export NUMBER_OF_TCS=$#

## Getting list of test cases and storing in an array
export TEST_LIST=( "$@" )
## Getting last test case name ro replace later without suffix
export LAST_TC=${TEST_LIST[$NUMBER_OF_TCS-1]}

## Adding suffix ^| at the end of each test case
export TEST_LIST_WITH_SUFFIX=( $(echo ${TEST_LIST[*]}|sed "s/\(\b[^ ]\+\)/\1|/g") )

## Removing suffix from last test case
#
TEST_LIST_WITH_SUFFIX[$NUMBER_OF_TCS-1]=${LAST_TC}

echo "TEST CASE LIST ${TEST_LIST_WITH_SUFFIX[@]}"
## Preparing string to pass to node command

#export COMPLETE_COMMAND='"\"'${TEST_LIST_WITH_SUFFIX[@]}'\""'
export COMPLETE_COMMAND=${TEST_LIST_WITH_SUFFIX[@]}
COMPLETE_COMMAND="$(echo -e "${COMPLETE_COMMAND}" | tr -d '[:space:]')"

node lib/main.js run --steps --grep "\"${COMPLETE_COMMAND}\""
/usr/bin/allure generate output/allure/results --clean -o ./generated/allure-report
