# Python-Ops

The purpose of this repository is to create docker containers with the infrastructure needed
for the following projects:

- [argo-emulator](https://github.com/JudgeSansDredd/argo-emulator)
- [mep-emulator](https://github.com/JudgeSansDredd/mep-emulator)

## Setup

### What do I need to do?

The environment setup has been abstracted behind npm scripts.

- To start the argo emulator, run `npm run start-argo`
- To start the mep emulator, run `npm run start-mep`

### Yeah, but what is it doing?

> The bootstrap script being run will output to `./bootstrap.log`

1. Setup localstack config and credentials

   ```
   aws configure set region us-east-1 --profile localstack
   aws configure set aws_access_key_id localstack --profile localstack
   aws configure set aws_secret_access_key localstack --profile localstack
   ```

2. Install node dependencies

   ```
   npm install
   ```

3. Create python environment

   ```
   python -m venv venv
   source ./venv/bin/activate
   pip install -r requirements.txt
   ```

4. Bootstraps the Localstack environment and deploys to it

   ```
   npm run cdk-bootstrap
   npm run cdk-deploy-all
   ```

## Helpers

- You may find it helpful to create an alias for working with localstack

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
