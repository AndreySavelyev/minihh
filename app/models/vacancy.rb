class Vacancy < ActiveRecord::Base
  has_many :vacancy_skills
  has_many :skills, through: :vacancy_skills

  accepts_nested_attributes_for :skills, :reject_if => :all_blank, :allow_destroy => true

  def self.search_by(employee)
    employee_skill_ids = employee.skill_ids
    if employee_skill_ids.any?
      vacancies = Vacancy.joins(:vacancy_skills).
        select("vacancies.id, vacancies.*, \
         array_agg(vacancy_skills.skill_id) @> ARRAY[#{employee_skill_ids.join(',')}] as full_matched,
         array_agg(vacancy_skills.skill_id) && ARRAY[#{employee_skill_ids.join(',')}] as matched" ).
        group('vacancies.id').
        order('full_matched desc, salary desc').
        where('expires_at >= ?', Date.today)
      matched, not_matched = vacancies.partition{|e| e.matched? }
      full_matched, partially_matched = matched.partition{|e| e.full_matched? }
    else
      full_matched, partially_matched = [], Vacancy.where('expires_at >= ?', Date.today).order(salary: :desc)
    end
  end

end

# == Schema Information
#
# Table name: vacancies
#
#  id           :integer          not null, primary key
#  name         :string
#  added_at     :date
#  expires_at   :date
#  salary       :integer
#  contact_info :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
