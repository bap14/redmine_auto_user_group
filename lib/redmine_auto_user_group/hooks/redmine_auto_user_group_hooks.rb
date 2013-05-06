module RedmineAutoUserGroup
  module Hooks
    class RedmineAutoUserGroupHooks < Redmine::Hook::ViewListener
      def controller_account_success_authentication_after(context = {})
        user = context[:user]
        
        if user.is_a?(User)
          groupId = Setting.plugin_redmine_auto_user_group['group_id']
          
          if !groupId.nil? && groupId.length > 0
            group = Group.find(groupId)
            
            if !user.is_or_belongs_to?(group)
              user.group_ids = [groupId]
              user.save
              user.reload
            end
          end
        end
      end
    end
  end
end