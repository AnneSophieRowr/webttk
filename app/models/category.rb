class Category < ActiveRecord::Base

  include Searchable

  has_many :issues

  validates_presence_of :name

end
