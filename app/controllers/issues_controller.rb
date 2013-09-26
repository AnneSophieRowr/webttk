class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  def index
		@objects = Issue.order(Issue.sort_column).page(params[:page])
  end

  def new
    @issue = Issue.new
		@issue.report_date = DateTime.now 
		@issue.user_id = current_user.id
  end

	def show
	end

  def edit
  end

  def create
    @issue = Issue.new(issue_params)

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
			params.require(:issue).permit(:id, :report_date, :description, :detailed_cause, :start_time, :end_time, :duration_1, :duration_2, :closure_date, :reactivity, :app_status, :formal_description, :status_id, :category_id, :problem, :user_id)
    end
end
