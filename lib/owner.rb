class Owner
  @@all = []
  
  attr_accessor :name, :pets
  attr_reader :species
  
  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
  def self.count
    self.all.count
  end 
  
  def self.reset_all 
    self.all.clear
  end 
  
  def say_species
    "I am a #{species}."
  end 
  
  def buy_fish(fish_name)
    @pets[:fishes] << Fish.new(fish_name)
  end 
  
  def buy_cat(cat_name)
    @pets[:cats] << Cat.new(cat_name)
  end 
  
  def buy_dog(dog_name)
    @pets[:dogs] << Dog.new(dog_name)
  end 
  
  def walk_dogs 
    @pets[:dogs].each { |dog| dog.mood = "happy"}
  end 
  
  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy"}
  end 
  
  def feed_fish 
    @pets[:fishes].each { |fish| fish.mood = "happy"}
  end 
  
  def sell_pets
    @pets.each do |species, animals| 
      animals.each { |animal| animal.mood = "nervous"}
      animals.clear
    end
  end 
  
  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end 
end