class CreateEmployeeSkills < ActiveRecord::Migration
  def change
    create_table :employee_skills do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
