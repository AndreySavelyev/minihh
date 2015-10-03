class Skill < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :vacancy_skills
  has_many :vacancies, through: :vacancy_skills

  has_many :employee_skills
  has_many :employees, through: :employee_skills
end
# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_skills_on_name  (name)
#
