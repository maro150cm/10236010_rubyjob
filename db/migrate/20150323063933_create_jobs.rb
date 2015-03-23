class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string   :title
      t.string   :job_type
      t.string   :job_name
      t.string   :company_name
      t.string   :location
      t.string   :url
      t.text     :description
      t.text     :apply_information
      t.date     :deadline
      t.string   :aasm_state
      t.integer  :user_id
      t.timestamps null: false
    end
    add_index :jobs, :user_id
  end
end
