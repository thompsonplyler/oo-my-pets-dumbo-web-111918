class Fish

  attr_reader :name, :species
  attr_accessor :mood

  def initialize(name)
    @name = name
    @mood = "nervous"
    @species = "fish"
  end
end
