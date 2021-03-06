class EmployeeSkill < ActiveRecord::Base
  belongs_to :employee
  belongs_to :skill
end

# == Schema Information
#
# Table name: employee_skills
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  skill_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_skills_on_employee_id  (employee_id)
#  index_employee_skills_on_skill_id     (skill_id)
#
