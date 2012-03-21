class QueryRankingController < ApplicationController
  before_filter :find_projects

  helper :issues
  include IssuesHelper
  helper :queries
  include QueriesHelper
  helper :sort
  include SortHelper

  # ランキングを表示
  def index
    retrieve_query # クエリ取得
    if @query
      @query.group_by ||= 'project' # デフォルトのグループ化はプロジェクト
      @issue_count_by_group = @query.issue_count_by_group
      # 最大のチケット数（比率を出すため）
      @max_count = 1
      @issue_count_by_group.each{|k, v| @max_count = v if v > @max_count } if @issue_count_by_group
    end
  end

  private
  # プロジェクトの取得
  def find_projects
    if params[:project_ids].present?
      @projects = Project.find(:all, :conditions => [Project.visible_condition + ' and id in (?)', params[:project_ids]])
    else
      @projects = Project.visible
    end
  end
end
