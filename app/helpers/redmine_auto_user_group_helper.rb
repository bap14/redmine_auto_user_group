module RedmineAutoUserGroupHelper
  include Redmine::I18n
  
  def get_group_select_options
    Group.sorted.to_a
  end
end