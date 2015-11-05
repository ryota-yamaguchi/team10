Redmine::Plugin.register :team10 do
  name 'Team10 plugin'
  author 'Ryota Yamaguchi'
  description 'This is a plugin for Redmine'
  version '0.0.0.00036'
  url 'https://github.com/ryota-yamaguchi/team10'
  author_url 'https://github.com/ryota-yamaguchi/'

  permission :team10, { :team10 => [:index]}, :public => true
  menu :project_menu, :team10, { :controller => 'team10', :action => 'index'}, :caption => 'Team10', :after => :activity, :param => :project_id

end
