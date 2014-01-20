class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.text      :description, null: false
      t.date      :date,        null: false
      t.integer   :user_id,     null: false
      t.integer   :issue_id,    null: false

      t.timestamps
      
    end
  end
end
