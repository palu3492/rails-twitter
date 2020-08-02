class PagesController < ApplicationController
  def about
    @title = 'About Simple Blog'
    @content = 'This is the about page'
  end
end
