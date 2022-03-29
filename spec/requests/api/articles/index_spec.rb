RSpec.describe 'GET /api/articles', type: :request do
  let(:sports_category) { create(:category, name: 'Sports')}
  let(:business_category) { create(:category, name: 'Business')}
  let!(:sports_articles) { create_list(:article, 5, category: sports_category) }
  let!(:business_articles) { create_list(:article, 5, category: business_category) }

  before do
    get '/api/articles'
  end

  subject { response }

  it { is_expected.to have_http_status 200 }

  it 'is expected to return articles grouped by category' do
    expect(response_json['articles'].keys).to match ['sports', 'business']
  end

  it 'is expected to include 5 articles in the sports category' do
    expect(response_json['articles']['sports'].size).to eq 5
  end
end
