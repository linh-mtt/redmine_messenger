# Messenger plugin for Redmine

This plugin posts updates to issues in your Redmine installation to [Slack](https://slack.com/) or [Mattermost](https://about.mattermost.com/) channel.

## Features

- Post information to messenger channel
  - post issue updates
  - post private issue updates
  - display watchers
  - convert username to mentions
  - post wiki updates
- overwrite messenger settings at project level
- parent project support (inherit messenger settings from parent project)

## Screenshot

Mattermost output:

![screenshot](https://raw.githubusercontent.com/linh-mtt/redmine_messenger/master/screenshots/screenshot_mattermost.png)

## Prepare your messenger service

### Slack

Go to Slack documentation [Incoming Webhooks](https://api.slack.com/incoming-webhooks) for more information to set up Incoming WebHook

### Mattermost

Go to Mattermost documentation [Incoming Webhooks](https://docs.mattermost.com/developer/webhooks-incoming.html) for more information to set up Incoming WebHook

## Requirements

- Redmine version >= 3.0.0
- Ruby version >= 2.3.0

## Installation

Install `redmine_messenger` plugin for `Redmine`

    cd $REDMINE_ROOT
    git clone https://github.com/linh-mtt/redmine_messenger.git plugins/redmine_messenger
    bundle install --without development test
    bundle exec rake redmine:plugins:migrate RAILS_ENV=production

Restart Redmine, and you should see the plugin show up in the Plugins page.
Under the configuration options, set the Messenger API URL to the URL for an
Incoming WebHook integration in your Slack/Mattermost account.

## Uninstall

Uninstall `redmine_messenger`

    cd $REDMINE_ROOT
    bundle exec rake redmine:plugins:migrate NAME=redmine_messenger VERSION=0 RAILS_ENV=production
    rm -rf plugins/redmine_messenger

Restart Redmine (application server)

## Customized Routing

You can also route messages to different channels on a per-project basis. To
do this, create a project custom field (Administration > Custom fields > Project)
named `Messenger Channel`. If no custom channel is defined for a project, the parent
project will be checked (or the default will be used). To prevent all notifications
from being sent for a project, set the custom channel to `-`.

For more information, see http://www.redmine.org/projects/redmine/wiki/Plugins.

## Credits

The source code is forked from

- [redmine-slack](https://github.com/sciyoshi/redmine-slack)

Special thanks to the original author and contributors for making this awesome hook for Redmine.
