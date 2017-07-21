# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require 'pry'
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def photos
    Photo.all.select {|photo| photo.user == self}
  end

end

class Photo
  #new photos not being added to @@photo array
  attr_accessor :user, :photo

  @@all = []

  def initialize(photo="filter")
    @photo = photo
    @@all << self
  end

  def self.all
    @@all
  end

  def comments
    Comment.all.select {|comment| comment.photo == self}
  end

  def make_comment(message)
    comment = Comment.new(message)
    comment.photo = self
    Comment.all << comment
    message
  end
end

class Comment
  attr_accessor :photo, :text

  @@all = []

  def initialize(text)
    @text = text
  end

  def self.all
    @@all
  end
end

photo = Photo.new
user = User.new("Sophie")
photo.user = user
photo.user.name
# => "Sophie"
user.photos
# => [<photo 1>]


photo.comments
# => []

photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
photo.comments
# => [<comment1>]

Comment.all
