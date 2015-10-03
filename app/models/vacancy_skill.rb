class VacancySkill < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :skill
end

# == Schema Information
#
# Table name: vacancy_skills
#
#  id         :integer          not null, primary key
#  vacancy_id :integer
#  skill_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_vacancy_skills_on_skill_id    (skill_id)
#  index_vacancy_skills_on_vacancy_id  (vacancy_id)
#
