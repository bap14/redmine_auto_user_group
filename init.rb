require 'redmine'
require 'auth_source'

Redmine::Plugin.register :redmine_auto_user_group do
	name 'Redmine Automatic User Group Association'
	author 'Brett Patterson'
	description 'Adds ability for users to automatically be assigned to groups upon registration'
	version '0.0.1'
	
	settings :default => {'empty' => true}, :partial => 'settings/redmine_auto_user_group'

	requires_redmine :version_or_higher => '2.0.3'
end

require 'redmine_auto_user_group/hooks/redmine_auto_user_group_hooks'

ActionDispatch::Callbacks.to_prepare do
	require_dependency 'settings_controller'
	unless SettingsController.included_modules.include?(RedmineAutoUserGroup::Patches::SettingsControllerPatch)
		SettingsController.send(:include, RedmineAutoUserGroup::Patches::SettingsControllerPatch)
	end
end
