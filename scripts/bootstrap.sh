#!/bin/bash

pushd $(dirname $0) >> /dev/null; SCRIPTPATH=$(pwd); popd >> /dev/null

source $SCRIPTPATH/info_box.sh
source $SCRIPTPATH/pretty_tasks.sh
LOG=$SCRIPTPATH/../bootstrap.log

# Reset bootstrap log
echo '' > $LOG

echo_start
echo -n "Setting up AWS Profile 'localstack'"
    aws configure set region us-east-1 --profile localstack >> $LOG 2>&1
    aws configure set aws_access_key_id localstack --profile localstack >> $LOG 2>&1
    aws configure set aws_secret_access_key localstack --profile localstack >> $LOG 2>&1
test_for_success $?

echo_start
echo -n "Installing node dependencies"
    npm install >> $LOG 2>&1
test_for_success $?

echo_start
echo -n "Set up python virtual environment (venv)"
    python3 -m venv venv >> $LOG 2>&1
test_for_success $?

echo_start
echo -n "Activate python virtual environment"
    source venv/bin/activate >> $LOG 2>&1
test_for_success $?

echo_start
echo -n "Install python dependencies"
    pip install -r requirements.txt >> $LOG 2>&1
test_for_success $?

echo_start
echo -n "Bootstrap AWS localstack infrastructure"
    npx cdklocal bootstrap >> $LOG 2>&1
test_for_success $?

echo_start
echo -n "Deploy to AWS localstack"
    npx cdklocal deploy --all >> $LOG 2>&1
test_for_success $?
