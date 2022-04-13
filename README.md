# Python-Ops

The purpose of this repository is to create docker containers with the infrastructure needed
for the following projects:

- argo-emulator
- mep-emulator

## Setup

1. Setup localstack config and credentials

   > will modify `~/.aws/config` & `~/.aws/credentials` files

   ```
   aws configure set region us-east-1 --profile localstack
   aws configure set aws_access_key_id localstack --profile localstack
   aws configure set aws_secret_access_key localstack --profile localstack
   ```

2. Create python environment

   ```
   python -m venv venv
   source ./venv/bin/activate
   pip install -r requirements.txt
   ```

   > To leave the python virtual environment, simply run `deactivate`.
   > You may want to wait, since you'll need to be in the python environment
   > in a later step, anyway

3. Install node dependencies

   ```
   npm install
   ```

4. Turn on localstack and other infrastructure

   ```
   docker compose up -d
   ```

5. Using cdk with localstack

   > If you exited the python virtual environment with `deactivate` earlier,
   > you'll need to re-enter it by running `source ./venv/bin/activate` here.

   ```
   source ./venv/bin/activate

   npm run cdk-bootstrap
   npm run cdk-deploy-all

   deactivate
   ```

## Helpers

- Create an alias for working with localstack

  ```
  # For bash
  echo "alias awsl='aws --profile=localstack --endpoint-url=http://localhost:4566'" >> ~/.bash_profile

  # For Zsh
  echo "alias awsl='aws --profile=localstack --endpoint-url=http://localhost:4566'" >> ~/.zshrc
  ```

- Usage Example:

  ```
  awsl dynamodb list-tables
  ```
