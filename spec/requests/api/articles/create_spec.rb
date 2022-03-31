RSpec.describe 'POST /api/articles' do

  before do
    post '/api/articles', params: {
      article: { title: 'News about coding', body: 'Lorem ipsum...' }
    }

    @article = Article.last
    # without ... expect(Article).not_to be nil
  end

  subject { response }

  it { is_expected.to have_http_status 201 }

  it 'is expected to create an instance of an Article' do
    expect(@article).not_to be nil
  end

  it 'is expected to have a title' do
    expect(@article.title).to eq 'News about coding'
  end

  it 'is expected to have a body' do
    expect(@article.body).to eq 'Lorem ipsum...'
  end

end