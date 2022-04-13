# Infrastructure

## Setup localstack config and credentials

> will modify `~/.aws/config` & `~/.aws/credentials` files

```
aws configure set region us-east-1 --profile localstack
aws configure set aws_access_key_id localstack --profile localstack
aws configure set aws_secret_access_key localstack --profile localstack
```

<!-- ## Install aws-cdk and aws-cdk-local

Use the npm version so the `aws-cdk-local` wrapper will work. `aws-cdk-local` is a wrapper around `aws-cdk`

> **DO NOT** INSTALL IT USING BREW OR APT

```
npm install -g aws-cdk aws-cdk-local
``` -->

## Create python environment

```
python -m venv venv
source ./venv/bin/activate
pip install -r requirements.txt
```

> To leave the python virtual environment, simply run `deactivate`.
> You may want to wait, since you'll need to be in the python environment
> in a later step, anyway

## Turn on localstack and other infrastructure

```
docker compose up -d
```

## Using cdk with localstack

> If you exited the python virtual environment with `deactivate` earlier,
> you'll need to re-enter it by running `source ./venv/bin/activate` here.

```
source ./venv/bin/activate

npm run cdk-bootstrap
npm run cdk-deploy-all

deactivate
```

# Helpers

create an alias for working with localstack

```
# For bash
echo "alias awsl='aws --profile=localstack --endpoint-url=http://localhost:4566'" >> ~/.bash_profile

# For Zsh
echo "alias awsl='aws --profile=localstack --endpoint-url=http://localhost:4566'" >> ~/.zshrc
```

Usage Example:

```
awsl dynamodb list-tables
```
