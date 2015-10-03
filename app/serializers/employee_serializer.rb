class EmployeeSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  attributes :job_search_status
  attributes :salary
  attributes :contact_info

  has_many :skills
end
