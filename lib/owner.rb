require 'pry'
require_relative 'dog.rb'
require_relative 'cat.rb'
require_relative 'fish.rb'
class Owner
  @@all =[]

  attr_accessor :pets, :name
  attr_reader :species

  def initialize(name)
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
    @name = name
    @species = "human"
  end

  def say_species
    "I am a #{species}."
  end

  def buy_cat(cat)
    cat = Cat.new(cat)
    self.pets[:cats] << cat
  end

  def buy_dog(dog)
    dog = Dog.new(dog)
    self.pets[:dogs] << dog
  end

  def buy_fish(fish)
    fish = Fish.new(fish)
    self.pets[:fishes] << fish
  end

  def play_with_cats
    self.pets[:cats].collect do |cat|
      cat.mood = "happy"
    end
  end

  def walk_dogs
    self.pets[:dogs].collect do |dog|
      dog.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].collect do |fish|
      fish.mood = "happy"
    end
  end

  def clear_pets
    self.pets[:fishes].clear
    self.pets[:dogs].clear
    self.pets[:cats].clear
  end

  def pets_nerves
    self.pets[:fishes].collect do |fish|
      fish.mood = "nervous"
    end
    self.pets[:dogs].collect do |dog|
      dog.mood = "nervous"
    end
    self.pets[:cats].collect do |cat|
      cat.mood = "nervous"
    end
  end

  def sell_pets
    pets_nerves
    clear_pets
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    self.all.clear
  end
end

# thompson = Owner.new("Thompson")
# thompson.buy_fish("Goldie")
# thompson.buy_fish("Red")
# thompson.buy_fish("Mikey")
# thompson.buy_dog("Virgil")
# thompson.buy_dog("Julep")
# thompson.buy_dog("Lucky")
# thompson.buy_cat("Layla")
# thompson.buy_cat("Ring")
# thompson.buy_cat("Garfield")
#
# binding.pry
#
# thompson.list_pets
