class Employee < ActiveRecord::Base
  has_many :employee_skills
  has_many :skills, through: :employee_skills

  validate :name_validation, :contact_info_validation

  accepts_nested_attributes_for :skills, :reject_if => :all_blank, :allow_destroy => true

  def self.search_by(vacancy)
    vacancy_skill_ids = vacancy.skill_ids
    if vacancy_skill_ids.any?
      employees = Employee.joins(:employee_skills).
        select("employees.id, employees.*, \
         array_agg(employee_skills.skill_id) @> ARRAY[#{vacancy_skill_ids.join(',')}] as full_matched,
         array_agg(employee_skills.skill_id) && ARRAY[#{vacancy_skill_ids.join(',')}] as matched" ).
        group('employees.id').
        order('full_matched desc, salary').
        where(job_search_status: true)
      matched, not_matched = employees.partition{|e| e.matched? }
      full_matched, partially_matched = matched.partition{|e| e.full_matched? }
    else
      full_matched, partially_matched = [], Employee.where(job_search_status: true).order(:salary)
    end
    [full_matched, partially_matched]
  end

  def name_validation
    unless name_valid?
      errors[:name] << 'Неверный формат имени'
    end
  end

  def contact_info_validation
    if !(contact_include_email? || contact_include_phone_number?)
      errors[:contact_info] << 'Отсутствует контактная информация'
    end
  end

  def name_valid?
    name =~ /^([А-Яа-я]+\ ){2}[а-яА-Я]+$/
  end

  def contact_include_email?
    (contact_info =~ /.+@.+/).present?
  end

  def contact_include_phone_number?
    (contact_info =~ /\+[0-9]{11}/).present?
  end
end

# == Schema Information
#
# Table name: employees
#
#  id                :integer          not null, primary key
#  name              :string
#  contact_info      :text
#  job_search_status :boolean
#  salary            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
