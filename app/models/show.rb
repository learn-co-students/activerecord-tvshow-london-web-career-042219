require 'pry'

class Show < ActiveRecord::Base

  def self.highest_rating
    all.maximum(:rating)
    #binding.pry
    #"yes"
  end

  def self.most_popular_show
    find_by(rating: highest_rating)
  end

  def self.lowest_rating
    all.minimum(:rating)
  end

  def self.least_popular_show
    find_by(rating: lowest_rating)
  end

  def self.ratings_sum
    all.sum(:rating)
  end

  def self.popular_shows
    all.where("rating > ?", 5)
  end

  def self.shows_by_alphabetical_order
    all.order("name")
    #binding.pry
   # "yes"
  end









end