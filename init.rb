require 'redmine'

require_dependency 'redmine_messenger/listener'

Redmine::Plugin.register :redmine_messenger do
	name 'Redmine Messenger'
	author 'Linh Le'
	url 'https://github.com/linh-mtt/redmine_messenger'
	author_url 'https://www.mttjsc.com'
	description 'Slack/Mattermost chat integration'
	version '1.0'

	requires_redmine :version_or_higher => '0.8.0'

	settings \
		:default => {
			'callback_url' => nil,
			'channel' => nil,
			'icon' => 'https://raw.githubusercontent.com/linh-mtt/redmine_messenger/master/screenshots/redmine-icon.png',
			'username' => 'REDMINE',
			'display_watchers' => 'no'
		},
		:partial => 'settings/messenger_settings'
end

((Rails.version > "5")? ActiveSupport::Reloader : ActionDispatch::Callbacks).to_prepare do
	require_dependency 'issue'
	unless Issue.included_modules.include? RedmineMessenger::IssuePatch
		Issue.send(:include, RedmineMessenger::IssuePatch)
	end
end
