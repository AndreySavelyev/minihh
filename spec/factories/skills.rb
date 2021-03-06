FactoryGirl.define do
  factory :skill do
    name { generate :string }
  end

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
