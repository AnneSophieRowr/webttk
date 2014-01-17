class IssuesController < ApplicationController
  include Concerns::Search
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :fix_datetime_params, only: [:create, :update]

  def index
    @objects = Issue.where('status_id = 1').order(sort_column + ' ' + sort_direction).page(params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data Issue.to_csv }
    end
  end

  def new
    @issue = Issue.new
    @issue.report_date = DateTime.now 
    @issue.created_by_id = current_user.id
  end

  def show
  end

  def edit
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.created_by_id = current_user.id

    if @issue.save
      redirect_to issues_path, notice: t('issues.create') 
    else
      render action: 'new' 
    end
  end

  def update
    if @issue.update(issue_params)
      redirect_to issues_path, notice: t('issues.update') 
    else
      render action: 'edit' 
    end
  end

  def destroy
    @issue.destroy
    redirect_to issues_url 
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:status_id, :report_date, :description, :created_by_id, :notified_by_id, :device_id, :application, :action, :next_action, :detailed_cause, :start_time, :end_time, :closure_date, :detection, :app_status, :category_id, :problem, :followed_by_id)
    end

    def sort_column
      Issue.column_names.include?(params[:sort]) ? params[:sort] : "report_date"
    end 

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end 

    def fix_datetime_params
      %w[report_date start_time end_time closure_date].each do |date_attr|
        unless params[:issue][date_attr].empty?
          short_date = DateTime.parse(params[:issue][date_attr])
        full_date = DateTime.parse(params[:issue][date_attr])
        full_date = full_date.change({:hour => short_date.hour, :minute => short_date.minute})
        params[:issue].merge!({date_attr => full_date})
      end
    end
  end
end
