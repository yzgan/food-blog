class HomeController < ApplicationController
  layout 'home'

  def index
    @articles = Article.all.order(created_at: :desc).limit(30)
  end
end
