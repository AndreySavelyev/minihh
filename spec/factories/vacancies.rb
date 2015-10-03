FactoryGirl.define do
  factory :vacancy do
    name { generate :string }
    added_at { generate :date }
    expires_at { generate :date }
    salary { generate :integer }
    contact_info { generate :string }
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
