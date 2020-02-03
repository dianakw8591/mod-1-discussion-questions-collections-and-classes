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

    @@all = []
    def self.all
        @@all
    end

    attr_accessor :user
    def initialize
        @@all << self
    end

    def comments
        Comment.all.select {|comment| comment.photo == self}
    end

    def make_comment(comment)
        new_comment = Comment.new(comment)
        new_comment.photo = self
    end
end

class Comment

    @@all = []
    def self.all
        @@all
    end

    attr_accessor :comment, :photo
    def initialize(comment)
        @comment = comment
        @@all << self
    end
end


sophie = User.new("Sophie")
sandwich_photo = Photo.new
sandwich_photo.user = sophie
sandwich_photo.user.name
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]

binding.pry
