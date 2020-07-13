class Show < ActiveRecord::Base

  def self.highest_rating
    # this method should return the highest value in the ratings column
    maximum("rating")
  end

  def self.most_popular_show
    # this method should return the show with the highest rating
    highest = Show.find_by rating: highest_rating
    Show.find(highest.id)
  end

  def self.lowest_rating
    # returns the lowest value in the ratings column.
    minimum("rating")
  end

  def self.least_popular_show
    # returns the show with the lowest rating.
    lowest = Show.find_by rating: lowest_rating
    Show.find(lowest.id)
  end

  def self.ratings_sum
    # returns the sum of all of the ratings.
    Show.sum("rating")
  end

  def self.popular_shows
    # returns an array of all of the shows that have a rating greater than 5
    Show.where("rating > ?", 5)
  end

  def self.shows_by_alphabetical_order
    # returns an array of all of the shows sorted by alphabetical order according to their names
    Show.order(:name)
  end
end
