class StaticPagesController < ApplicationController
  def index
    if logged_in?
      redirect_to posts_url
    end
  end

  def about
  end

  def contact
  end
end
