module Exportable
  extend ActiveSupport::Concern

  module ClassMethods
    require 'csv'
    def to_csv
      column_names.delete 'id'
      belongs = {}
      reflections.each {|k,v| belongs[v.foreign_key.to_s] = k.to_s unless v.macro != :belongs_to}
      CSV.generate do |csv|
        csv << column_names.collect {|c| I18n.t("#{name.underscore}.#{c}")}
        all.each do |obj|
          csv << column_names.collect {|c| (belongs.keys.include? c) ? obj.send(belongs[c]).nil? ? nil : obj.send(belongs[c]).name : obj.send(c) } 
        end
      end
    end 
  end 

end
