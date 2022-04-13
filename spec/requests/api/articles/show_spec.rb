RSpec.describe 'GET /api/articles/:id', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:article) { create(:article, title: 'Article 1') }
  let!(:another_article) { create(:article, title: 'Article 2') }

  subject { response }

  describe 'as an authenticated user' do
    describe 'successfully' do
      before do
        get "/api/articles/#{article.id}", headers: credentials
      end

      it { is_expected.to have_http_status 200 }

      it 'is expected to return 1 article' do
        expect(response_json.size).to eq 1
      end

      it 'is expected to include article title' do
        expect(response_json['article']['title']).to eq 'Article 1'
      end

      it 'is expected to include the right article title' do
        expect(response_json['article']['title']).not_to eq 'Article 2'
      end
    end
  end

  describe 'as an unauthenticated user' do
    before do
      get "/api/articles/#{article.id}", headers: nil
    end

    it { is_expected.to have_http_status 401 }

    it 'is expected to respond with an error message' do
      expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
    end
  end
end
