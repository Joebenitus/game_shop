class Game
  attr_reader :id
  attr_accessor :name, :franchise_id

  @@games = {}
  @@total_rows = 0

  def initialize(name, franchise_id, id)
    @name = name
    @franchise_id = franchise_id
    @id = id || @@total_rows += 1
  end

  def ==(game_to_compare)
    (self.name() == game_to_compare.name()) && (self.franchise_id() == game_to_compare.franchise_id())
  end

  def self.all
    @@games.values
  end

  def save
    @@games[self.id] = Game.new(self.name, self.franchise_id, self.id)
  end

  def self.find(id)
    @@games[id]
  end

  def update(name, franchise_id)
    self.name = name
    self.franchise_id = franchise_id
    @@games[self.id] = Game.new(self.name, self.franchise_id, self.id)
  end

  def delete
    @@games.delete(self.id)
  end

  def self.clear
    @@games = {}
  end

  def self.find_by_franchise(fran_id)
    games = []
    @@games.values.each do |game|
      if game.franchise_id == fran_id
        games.push(game)
      end
    end
    games
  end

  
end