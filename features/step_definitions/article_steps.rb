Given /^they have published articles:$/ do |articles|
  articles.hashes.each do |article|
  article_created = Article.create!(article)
  article_created.published = true
  @user.articles << article_created
  end
end
