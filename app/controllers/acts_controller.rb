class ActsController < ApplicationController
  before_action   :set_act, only: [:show, :edit, :update, :destroy]
  before_action   :set_issue, except: [:create, :update, :destroy]
  before_action  :fix_datetime_params, only: [:create, :update]

  def index
    @objects = @issue.acts.page(params[:page])
  end

  def new
    @act = @issue.acts.build
  end

  def show
    @act = @act.decorate
  end

  def edit
  end

  def create
    @act = Act.new(act_params)
    @issue = @act.issue

    if @act.save
      redirect_to issue_acts_path(@issue), notice: t('act.create')
    else
      render action: 'new' 
    end
  end

  def update
    @issue = @act.issue
    if @act.update(act_params)
      redirect_to issue_acts_path(@issue), notice: t('act.update') 
    else
      render action: 'edit' 
    end
  end

  def destroy
    @issue = @act.issue 
    @act.destroy
    redirect_to issue_acts_path(@issue), notice: t('act.destroyed') 
  end

  private
  def set_act
    @act = Act.find(params[:id])
  end

  def set_issue
    @issue = Issue.find(params[:issue_id])
  end

  def act_params
    params.require(:act).permit(:description, :user_id, :issue_id, :report_date, :report_time)
  end

  def fix_datetime_params
    unless params[:act][:report_date].empty? or params[:act][:report_time].empty?
      date = Date.parse(params[:act][:report_date])
      time = Time.parse(params[:act][:report_time])
      datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min) 
      params[:act].merge!({report_date: datetime})
    end
    params[:act].delete :report_time
  end
end
