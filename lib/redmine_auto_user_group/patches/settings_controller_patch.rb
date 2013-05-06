module RedmineAutoUserGroup
  module Patches
    module SettingsControllerPatch
      def self.included(base) # :nodoc:
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        
        base.class_eval do
          unloadable
          
          helper RedmineAutoUserGroup::RedmineAutoUserGroupHelper
        end
      end
      
      module ClassMethods
      end
      
      module InstanceMethods
      end
    end
  end
end