class User < ActiveRecord::Base

  include Searchable

  devise :database_authenticatable, :trackable, :validatable

  has_many :issues
  has_many :acts

  validates_confirmation_of :password
  validates_presence_of :last_name, :first_name, :email

  SEARCH_FIELDS = %w[last_name first_name email]

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
  alias :label :name

  def self.by_admin(admin)
    admin == '0' ? all : where(:admin => admin)
  end
end
