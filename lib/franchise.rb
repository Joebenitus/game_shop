class Franchise
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_franchises = DB.exec("SELECT * FROM franchises;")
    franchises = []
    returned_franchises.each() do |fran|
      name = fran.fetch("name")
      id = fran.fetch("id").to_i
      franchises.push(Franchise.new({:name => name, :id => id}))
    end
    franchises
  end

  def self.clear
    DB.exec("DELETE FROM franchises *;")
  end

  def self.find(id)
    franchise = DB.exec("SELECT * FROM franchises WHERE id = #{id};").first
    name = franchise.fetch("name")
    id = franchise.fetch("id")
    Franchise.new({:name => name, :id => id})
  end

  def save
    result = DB.exec("INSERT INTO franchises (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(franchise_to_compare)
    self.name() == franchise_to_compare.name()
  end

  def update(name)
    @name = name
    DB.exec("UPDATE franchises SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM franchises WHERE id = #{@id};")
  end

  def games
    Game.find_by_franchise(self.id)
  end
end