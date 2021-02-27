class Game
  attr_reader :id
  attr_accessor :name, :franchise_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @franchise_id = attributes.fetch(:franchise_id)
    @id = attributes.fetch(:id)
  end

  def ==(game_to_compare)
    if game_to_compare
      (self.name() == game_to_compare.name()) && (self.franchise_id() == game_to_compare.franchise_id())
    else
      false
    end
  end

  def self.all
    returned_games = DB.exec("SELECT * FROM games;")
    games = []
    returned_games.each() do |game|
      name = game.fetch("name")
      franchise_id = game.fetch("franchise_id").to_i
      id = game.fetch("id").to_i
      games.push(Game.new({:name => name, :franchise_id => franchise_id, :id => id}))
    end
    games
  end

  def save
    result = DB.exec("INSERT INTO games (name, franchise_id) VALUES ('#{@name}', #{@franchise_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
    @franchise_id
  end

  def self.find(id)
    game = DB.exec("SELECT * FROM games WHERE id = #{id};").first()
    if game
      name = game.fetch("name")
      franchise_id = game.fetch("franchise_id").to_i
      id = game.fetch("id").to_i
      Game.new({:name => name, :franchise_id => franchise_id, :id => id})
    else
      nil
    end
  end

  def update(name, franchise_id)
    @name = name
    @franchise_id = franchise_id
    DB.exec("UPDATE games SET name = '#{@name}', franchise_id = #{@franchise_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM games WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM games *;")
  end

  def self.find_by_franchise(fran_id)
    games = []
    returned_games = DB.exec("SELECT * FROM games WHERE franchise_id = #{fran_id};")
    returned_games.each do |game|
      name = game.fetch("name")
      id = game.fetch("id")
      games.push(Game.new({:name => name, :franchise_id => fran_id, :id => id}))
    end
    games
  end

  def franchise
    Franchise.find(@franchise_id)
  end
end