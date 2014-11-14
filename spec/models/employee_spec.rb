require 'rails_helper'

RSpec.describe Employee, :type => :model do
  describe 'Validations' do
    before do
      subject.valid?
    end

    it 'requires the presence of the name attribute' do
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'requires the presence of the title attribute' do
      expect(subject.errors[:name]).to include("can't be blank")
    end
  end
end
