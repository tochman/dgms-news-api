RSpec.describe Article, type: :model do

  describe 'Database' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:body).of_type(:text) }
    it { is_expected.to have_db_column(:author).of_type(:string) }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:article)).to be_valid
    end
  end

end
