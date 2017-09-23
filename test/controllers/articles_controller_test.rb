require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get articles" do
    get '/articles'
    assert_response :success
  end

  test "article data should be invalid" do
        get '/articles/new'
        assert_response :success
        assert_no_difference 'Article.count' do
        post '/articles/', params: { article: { title:  "",
                                         text: "", } }
        end
  end

   test "article data should be valid" do
        get '/articles/new'
        assert_response :success
        assert_difference 'Article.count' do
        post '/articles/', params: { article: { title:  "Toto et mickey",
                                                text: "Toto et Mickey vont a la plage", } }
        end
        follow_redirect!
        assert_template 'articles/show'
  end

  test "should find article" do
    article = Article.first
        get "/articles/#{article.id}"
        assert_response :success
  end

  test "should edit article" do
    article = Article.first
        get "/articles/#{article.id}/edit"
        assert_response :success
  end


end
