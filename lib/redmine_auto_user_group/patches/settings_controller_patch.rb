module RedmineAutoUserGroup
  module Patches
    module SettingsControllerPatch
      def self.included(base) # :nodoc:
        base.class_eval do
          helper RedmineAutoUserGroup::RedmineAutoUserGroupHelper
        end
      end
    end
  end
end