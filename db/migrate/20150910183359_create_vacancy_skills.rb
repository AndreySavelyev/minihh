class CreateVacancySkills < ActiveRecord::Migration
  def change
    create_table :vacancy_skills do |t|
      t.references :vacancy, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
