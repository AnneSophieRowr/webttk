class HomeController < ApplicationController

	def search
    q = "%#{params[:q].downcase}%"
    klass = params[:klass]
    nested_id = params[:nested]
    model = klass.singularize.camelize.constantize
    q = [q, nested_id] unless nested_id.nil?

    @objects = q.empty? ? model.all : model.search(*q).page(params[:page])
    @results = []
    @results = @objects.collect {|o| {:label => o.label , :url => o.respond_to?(:show_path) ? o.show_path : polymorphic_url(o)}}

    respond_to do |format|
      format.html { render :partial => "#{klass}/listing", :locals => { klass.to_sym => @objects }, :layout => false }
      format.json { render :json => @results }
    end   
  end   

  def filter
    filters = params[:filters]
    klass = params[:klass]
    nested_id = params[:nested]
    model = klass.singularize.camelize.constantize

    @objects = Array.new
    filters.each do |k, v|
      method = "by_#{k}"
      v = [v, nested_id] unless nested_id.nil?
      @objects << model.send(method, *v)
    end   
    @objects = @objects.inject {|acc, elem| acc & elem}.flatten
    @objects = Kaminari.paginate_array(@objects).page(params[:page])

    render :partial => "admin/#{klass}/listing", :locals => { klass.to_sym => @objects }, :layout => false
  end   

  def reset
    klass = params[:format]
    model = klass.singularize.camelize.constantize
    @objects = model.order(model.sort_column).page(params[:page])

    render :partial => "admin/#{klass}/listing", :locals => { klass.to_sym => @objects }, :layout => false
  end   
end
