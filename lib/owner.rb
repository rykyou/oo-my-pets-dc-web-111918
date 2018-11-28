class Owner
  @@all = []

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []} #same as {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear  #self here, b/c it's in body of class method, refers to class
  end

  def say_species
    "I am a #{species}." #species here is looking at another already defined instance method (of Owner). Implicit "self" here.
  end

  def buy_fish(fish_name)
    self.pets[:fishes] << Fish.new(fish_name)
  end

  def buy_cat(cat_name)
    self.pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    self.pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    self.pets[:dogs].each { |dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each { |cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each { |fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |species, animals|
      animals.each { |animal| animal.mood = "nervous"}
      animals.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end
end
