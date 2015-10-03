class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.text :contact_info
      t.boolean :job_search_status
      t.integer :salary

      t.timestamps null: false
    end
  end
end
