class Issue < ActiveRecord::Base
  
  include Searchable

  belongs_to 	:category
  belongs_to 	:status
  belongs_to 	:creator, :class_name => 'User', :foreign_key => 'created_by_id'
  belongs_to 	:notifier, :class_name  => 'User', :foreign_key => 'notified_by_id'
  belongs_to 	:follower, :class_name  => 'User', :foreign_key => 'followed_by_id'
  belongs_to 	:device
  has_many      :acts, dependent: :destroy

  validates_presence_of :device_id, :status_id, :report_date, :description, :created_by_id, :notified_by_id, :application

  DETECTIONS = %w[Reactif Proactif]
  IMPACTS = %w[weak average strong total].collect {|c| I18n.t("issue.#{c}")}
  APP_STATUSES = %w[OK Down]
  SEARCH_FIELDS = %w[report_date description application]

  scope :this_year, where('report_date between ? and ?', DateTime.now - 1.year, DateTime.now)

  def label
    "#{description.truncate(25, :omission => "...")} - #{status.name}"
  end

  def duration1
    time = 'test'
    unless start_time.nil?
      end_time = Time.now if end_time.nil?
      time = distance_of_time_in_words(start_time, end_time)
    end
    return time
  end

  require 'csv'
  class << self

    def to_csv
      columns = column_names.reject {|c| c == 'id'}
      belongs = {}
      reflections.each {|k,v| belongs[v.foreign_key.to_s] = k.to_s}
      CSV.generate do |csv|
        csv << columns.collect {|c| I18n.t("issue.#{c}")}
        all.each do |issue|
          csv << columns.collect {|c| (belongs.keys.include? c) ? issue.send(belongs[c]).nil? ? nil : issue.send(belongs[c]).name : issue.send(c)} 
        end
      end
    end

    def by_status(status)
      puts "status: #{status}"
      status == '0' ? all  : where(status_id: status)
    end

    def by_category(category)
      puts "cat: #{category}"
      category == '0' ? all  : where(category_id: category)
    end

    def by_user(user)
      puts "user: #{user}"
      user == '0' ? all : where(followed_by_id: user)
    end
  end

end
