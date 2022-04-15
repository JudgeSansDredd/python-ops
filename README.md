# Python-Ops

The purpose of this repository is to create docker containers with the infrastructure needed for the following projects:

> clone the following repos as siblings to the `python-ops` project.

- [argo-emulator](https://github.com/JudgeSansDredd/argo-emulator)
- [mep-emulator](https://github.com/JudgeSansDredd/mep-emulator)

your project directory structure should look similar to the following:

```
project-directory
├── argo-emulator
├── mep-emulator
└── python-ops
```

## Minimum system requirements

- [docker](https://docs.docker.com/get-docker/) >= 20.10.12
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) >= 2.4.23
- [nodeJs](https://nodejs.org/en/download/package-manager/) == 16LTS

### PIP

- #### MacOS

```
python3 -m pip install --user --upgrade pip
```

- #### Linux (Ubuntu)

```
sudo apt install python3-pip
```

### Python Virtualenv

- #### MacOS

```
python3 -m pip install --user virtualenv
```

- #### Linux (Ubuntu)

```
sudo apt install python3.8-venv
```

#### Lazydocker

- #### MacOS

```
brew install lazydocker
```

- #### Linux

```
 curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash && sudo mv lazydocker /usr/local/bin/
```

## M1 Architecture

I have an M1 Mac. Do I need to do something special?

- Of course you do. You'll need to export `DOCKER_DEFAULT_PLATFORM`. (You may want to add it to your profile so you don't forget)
  ```
  export DOCKER_DEFAULT_PLATFORM=linux/amd64
  ```

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
