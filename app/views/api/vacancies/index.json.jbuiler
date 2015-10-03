json.array!(@vacancies) do |vacancy|
  json.extract! vacancy, :id, :name, :added_at, :expires_at, :salary, :contact_info
  json.url vacancy_url(vacancy, format: :json)
end
