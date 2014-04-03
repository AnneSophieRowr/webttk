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
      redirect_to issues_path, notice: t('issue.create') 
    else
      render action: 'new' 
    end
  end

  def update
    current_status = @issue.status_id
    if @issue.update(issue_params)
      redirect_to @issue, notice: t('issue.update') 
    else
      if current_status.to_s == '1' and issue_params[:status_id].to_s == '4'
        @issue.status_id = 4
        @issue.closure_date = Time.now
      end
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
      params.require(:issue).permit(:status_id, :report_date, :report_time, :description, :created_by_id, :notified_by_id, :device_id, :application, :detailed_cause, :start_date, :start_time, :end_date, :end_time, :closure_date, :closure_dtime, :detection, :app_status, :impact, :category_id, :problem, :followed_by_id)
    end

    def sort_column
      Issue.column_names.include?(params[:sort]) ? params[:sort] : "report_date"
    end 

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end 

    def fix_datetime_params
      %w[report start end closure].each do |attr|
        unless params[:issue]["#{attr}_date"].empty? or params[:issue]["#{attr}_time"].empty?
          date = Date.parse(params[:issue]["#{attr}_date"])
          time = Time.parse(params[:issue]["#{attr}_time"])
          datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min) 
          params[:issue].merge!({"#{attr}_date" => datetime})
        end
      end
      params[:issue].reject! {|k| k.to_s.include? 'time'}
    end
end
