class StaticPagesController < ApplicationController
	layout "home", only: [:home]

  def home
  end

  def about
  end
end
