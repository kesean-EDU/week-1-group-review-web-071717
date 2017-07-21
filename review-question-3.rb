# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class

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
  attr_accessor :user

  @@all = []

  def self.all
    @@all
  end

  def comments
    Comment.all.select {|comment| comment.photo == self}
  end

  def make_comment(comment)
    comment = Comment.new
    comment.photo = self
    Comment.all << comment
  end
end

class Comment
  attr_accessor :photo

  @@all = []

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
#=> [<comment1>]
