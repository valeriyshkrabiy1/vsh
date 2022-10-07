# Glassbox automated UI tests

## Installation

1. Clone the current repository by either:
   - `git clone git@bitbucket.org:glassbox_automation/gb_ui_automation.git`; or
   - Searching for `gb_ui_automation` in GitKraken and cloning.
1. Open a command window or a Powershell window in the cloned directory
1. Run `npm install`

## Running the tests

In the same directory as step 3 above, open `package.json` and locate your team in the list of scripts.
Change the domain to match your test stack and save the file. Then run:

`npm run cy:<environment>`

This will bring up a window with the currently defined tests. You can click on any one of them to start the tests running for that area, or click "Run all specs" to run all of them.

## Docker!

* Build and local run (for creating tests):

   `docker build -t gb_ui_automation:latest .`

   `docker-compose -f  docker-compose.yml -f docker/local.yml up`

### Running the container locally?

Set the following variables in the `.env` file (make a copy of `.env.default`, named `.env` - this is in the .gitignore file so your local details won't be sent back to the repo):
- SPECS="cypress/integration/test-only/\*,cypress/integration/\*" (Add all the locations of the test files you wish to run, comma, delimited)
- DOMAIN="localhost" (set to domain of your teststack ec2 domain)
- VERSION="0.0.0" (Set this to the Console version number you are expecting)
- TESTENV="test" (Setting this to live prefixes the logged in users with 'production_')
- RESOURCEPREFIX="" (Your teststack resource prefix)
- DISPLAY="" (your ip address)

Alternatively, override the variables when calling docker-compose:

`VERSION=1.2.3ee6yt docker-compose up`

### Docker on the deployment box

To be automated:
-  understand the expected console version number and run the docker compose command
   -  `VERSION=4.5.6 docker-compose up`

### Docker Interactive mode!

-  Install an X11 server for windows `choco install vcxsrv`
   - run through the wizard to start the server
-  from the repo, run `docker-compose -f docker-compose.override.yml -f docker-compose.open.yml up`

- ToDo: a way for linux users..

