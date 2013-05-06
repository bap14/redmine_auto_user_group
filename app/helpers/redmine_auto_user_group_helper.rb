module RedmineAutoUserGroupHelper
  include Redmine::I18n
  
  def get_group_select_options
    Group.find(:all)
  end
end