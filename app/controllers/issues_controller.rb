class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
	before_action :fix_datetime_params, only: [:create, :update]

  def index
		@objects = Issue.order(Issue.sort_column).page(params[:page])
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

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issues_path, notice: 'Issue was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issues_path, notice: 'Issue was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
			params.require(:issue).permit(:status_id, :report_date, :description, :created_by_id, :notified_by_id, :equipment, :application, :action, :next_action, :detailed_cause, :start_time, :end_time, :closure_date, :detection, :app_status, :category_id, :problem)
    end

		def fix_datetime_params
			%w[report_date start_time end_time closure_date].each do |date_attr|
				unless params[date_attr].empty?
					short_date = DateTime.parse(params[:issue][date_attr])
					full_date = DateTime.parse(params[date_attr])
					full_date = full_date.change({:hour => short_date.hour, :minute => short_date.minute})
					params[:issue].merge!({date_attr => full_date})
				end
			end
		end
end
