class Franchise
  attr_reader :id, :name

  @@franchises = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@franchises.values()
  end

  def save
    @@franchises[self.id] = Franchise.new(self.name, self.id)
  end

  def ==(franchise_to_compare)
    self.name() == franchise_to_compare.name()
  end
end