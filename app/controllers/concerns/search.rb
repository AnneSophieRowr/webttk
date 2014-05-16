module Concerns
  module Search
    extend ActiveSupport::Concern

    def search
      q = "%#{params[:q].downcase}%"
      model = controller_name.classify.constantize

      objects = q.empty? ? model.all : model.search(q).page(params[:page])
      results = objects.collect {|o| {label: o.label , url: o.respond_to?(:show_path) ? o.show_path : polymorphic_url(o)}}

      respond_to do |format|
        format.html { render partial: "#{controller_name}/listing", locals: { controller_name.to_sym => objects }, layout: false }
        format.json { render json: results }
      end
    end   

    def filter
      filters = params[:filters]
      model = controller_name.classify.constantize

      @objects = filters.collect {|k, v| model.send("by_#{k}", v)}
      @objects = @objects.inject {|acc, elem| acc & elem}.flatten
      @objects = Kaminari.paginate_array(@objects).page(params[:page])

      render partial: "#{controller_name}/listing", locals: { controller_name.to_sym => @objects }, layout: false
    end   
  end
end
