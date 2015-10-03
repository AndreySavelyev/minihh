require 'rails_helper'

RSpec.describe Employee, type: :model do

  describe '#validations' do
    let(:attrs) { attributes_for(:employee) }
    let(:attrs_invalid) { attributes_for(:employee, :incorrect_name, :incorrect_contact_info) }

    it 'validates' do
      e1 = Employee.new(attrs)
      e2 = Employee.new(attrs_invalid)
      expect(e1.valid?).to be_truthy
      expect(e2.valid?).to be_falsey
    end
  end

  describe '#search_by vacancy' do
    let(:skill) { create :skill }
    let(:common_skill) { create :skill }
    let(:another_skill) { create :skill }
    let(:employee1) { create :employee }
    let(:employee2) { create :employee }
    let(:employee3) { create :employee, :dont_search_job }
    let(:vacancy) { create :vacancy }

    before do
      employee1.skills << [skill, common_skill]
      employee2.skills << [common_skill, another_skill]
      vacancy.skills << [skill, common_skill]
    end

    it 'returns employees' do
      full, part = Employee.search_by(vacancy)
      expect(full).to match_array [employee1]
      expect(part).to match_array [employee2]
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
