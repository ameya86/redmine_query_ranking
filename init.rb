require 'redmine'

Redmine::Plugin.register :redmine_query_ranking do
  name 'Redmine Query Ranking plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/ameya86/redmine_query_ranking'
  author_url 'http://blog.livedoor.jp/ameya86/'

  menu :application_menu, :query_ranking, {:controller => 'query_ranking', :action => 'index'}, :caption => :label_query_ranking
end
