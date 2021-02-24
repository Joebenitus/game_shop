require 'rspec'
require 'game'
require 'franchise'
require 'pry'

describe '#Game' do

  before(:each) do
    Franchise.clear()
    Game.clear()
    @franchise = Franchise.new("Giant Steps", nil)
    @franchise.save()
  end

  describe('#==') do
    it("is the same game if it has the same attributes as another game") do
      game = Game.new("Naima", @franchise.id, nil)
      game2 = Game.new("Naima", @franchise.id, nil)
      expect(game).to(eq(game2))
    end
  end

  describe('.all') do
    it("returns a list of all games") do
      game = Game.new("Giant Steps", @franchise.id, nil)
      game.save()
      game2 = Game.new("Naima", @franchise.id, nil)
      game2.save()
      expect(Game.all).to(eq([game, game2]))
    end
  end

  describe('.clear') do
    it("clears all games") do
      game = Game.new("Giant Steps", @franchise.id, nil)
      game.save()
      game2 = Game.new("Naima", @franchise.id, nil)
      game2.save()
      Game.clear()
      expect(Game.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a game") do
      game = Game.new("Naima", @franchise.id, nil)
      game.save()
      expect(Game.all).to(eq([game]))
    end
  end

  describe('.find') do
    it("finds a game by id") do
      game = Game.new("Giant Steps", @franchise.id, nil)
      game.save()
      game2 = Game.new("Naima", @franchise.id, nil)
      game2.save()
      expect(Game.find(game.id)).to(eq(game))
    end
  end

  describe('#update') do
    it("updates an game by id") do
      game = Game.new("Naima", @franchise.id, nil)
      game.save()
      game.update("Mr. P.C.", @franchise.id)
      expect(game.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an game by id") do
      game = Game.new("Giant Steps", @franchise.id, nil)
      game.save()
      game2 = Game.new("Naima", @franchise.id, nil)
      game2.save()
      game.delete()
      expect(Game.all).to(eq([game2]))
    end
  end

  describe('.find_by_franchise') do
    it("finds games for an franchise") do
      franchise2 = Franchise.new("Call of Duty", nil)
      franchise2.save
      game = Game.new("Call of Duty 2", @franchise.id, nil)
      game.save()
      game2 = Game.new("Call of Duty 3", franchise2.id , nil)
      game2.save()
      expect(Game.find_by_franchise(franchise2.id)).to(eq([game2]))
    end
  end

  describe('#franchise') do
    it("finds the franchise a game belongs to") do
      game = Game.new("Five Nights at Freddy's 4", @franchise.id, nil)
      game.save()
      expect(game.franchise()).to(eq(@franchise))
    end
  end
end
