Redmine::Plugin.register :sample do
  name 'Sample plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  # 引数はplugin名
  project_module :sample do
    # 引数は権限名, controllerとactionからなるhash
    permission :view_pivot, :pivot => [:index]
  end

  # 引数はメニューのタイプ, メニュー名, メニュークリック時に呼び出されるaction, オプション
  menu :project_menu, :pivot, { :controller => 'pivot', :action => 'index' }, :param => :project_id
end
