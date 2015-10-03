class VacancySerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  attributes :added_at
  attributes :expires_at
  attributes :salary
  attributes :contact_info

  has_many :skills
end
