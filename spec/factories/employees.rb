FactoryGirl.define do
  factory :employee do
    name 'Иванов Иван Иванович'
    contact_info 'email@example.com'
    job_search_status { true }
    salary { generate :integer}

    trait :incorrect_name do
      name { generate :string }
    end

    trait :incorrect_contact_info do
      contact_info { generate :string }
    end

    trait :dont_search_job do
      job_search_status false
    end
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
