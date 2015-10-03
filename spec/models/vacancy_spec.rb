require 'rails_helper'

RSpec.describe Vacancy, type: :model do

  describe '#search_by employee' do
    let(:skill) { create :skill }
    let(:common_skill) { create :skill }
    let(:another_skill) { create :skill }
    let(:vacancy1) { create :vacancy }
    let(:vacancy2) { create :vacancy }
    let(:vacancy3) { create :vacancy, :dont_search_job }
    let(:employee) { create :employee }

    before do
      vacancy1.skills << [skill, common_skill]
      vacancy2.skills << [common_skill, another_skill]
      employee.skills << [skill, common_skill]
    end

    it 'returns employees' do
      full, part = Vacancy.search_by(employee)
      expect(full).to match_array [vacancy1]
      expect(part).to match_array [vacancy2]
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
