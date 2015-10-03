FactoryGirl.define do
  %w(login name string).each do |name|
    sequence(name) { |n| "#{name}#{n}" }
  end

  sequence :email do |n|
    "person-#{n}@example.com"
  end

  sequence :integer, aliases: [:id] do |n|
    n
  end

  sequence :phone_number do |n|
    '+7917' + sprintf("%07d", n)
  end

  sequence :date do |n|
    Date.today + n.days
  end

end
