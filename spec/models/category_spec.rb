RSpec.describe Category, type: :model do

  describe 'Databese' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'Associations' do
    it { is_expected.to have_many :articles }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:category)).to be_valid
    end
  end

end