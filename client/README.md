# Client

## Prerequisites
Node.js + npm (8.9.1) (https://nodejs.org/en/);

In order to verify node.js is installed properly run:
```bash
node -v
```
This command should output your node version.


After doing that you have to install angular-cli globally.
In order to do that run:
```bash
npm install -g @angular/cli
```
In order to verify your installation run:
```bash
ng --version
```
This command should output your angular-cli version.


## Install external packages
```bash
cd LetsCode2017-test
npm run install
```

## Development
For active development use
```bash
npm run start:dev
```

If you want to only create build use
```bash
npm run build:dev
```

## Production
To start production version run:
```bash
npm run start:prod
```

If you want to create production build use
```bash
npm run build:prod
```