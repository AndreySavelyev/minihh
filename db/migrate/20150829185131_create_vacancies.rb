class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.date :added_at
      t.date :expires_at
      t.integer :salary
      t.text :contact_info

      t.timestamps null: false
    end
  end
end
