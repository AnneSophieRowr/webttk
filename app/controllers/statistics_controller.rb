class StatisticsController < ApplicationController

	def show
		@name = params[:id]
	end

	def chart_data
		data = Statistic.send(params[:id])
		options = chart_options(data.values)
		dataset = [{:fillColor => "rgba(151,187,205,0.5)", :strokeColor => "rgba(151,187,205,1)", :pointColor => "rgba(220,220,220,1)", :pointStrokeColor => "#fff", :data => data.values}]
		json_data = {:data => {:labels => data.labels, :datasets => dataset}, :options => options}
		render :json => json_data
	end

	private
  def chart_options(data)
    scale = 10 
    max = data.max_by {|w| w.value}.value + 5 
    steps = (max - min) / scale
    return {scaleOverride: true, scaleSteps: steps, scaleStepWidth: scale, scaleStartValue: 0}
  end 

end
