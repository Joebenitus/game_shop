require 'spec_helper'

describe '#Game' do

  before(:each) do
    @franchise = Franchise.new({:name => "Halo", :id => nil})
    @franchise.save()
  end

  describe('#==') do
    it("is the same game if it has the same attributes as another game") do
      game = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game2 = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      expect(game).to(eq(game2))
    end
  end

  describe('.all') do
    it("returns a list of all games") do
      game = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game.save()
      game2 = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game2.save()
      expect(Game.all).to(eq([game, game2]))
    end
  end

  describe('.clear') do
    it("clears all games") do
      game = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game.save()
      game2 = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game2.save()
      Game.clear()
      expect(Game.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a game") do
      game = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game.save()
      expect(Game.all).to(eq([game]))
    end
  end

  describe('.find') do
    it("finds a game by id") do
      game = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game.save()
      game2 = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game2.save()
      expect(Game.find(game.id)).to(eq(game))
    end
  end

  describe('#update') do
    it("updates an game by id") do
      game = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game.save()
      game.update("My Name Jeff", @franchise.id)
      expect(game.name).to(eq("My Name Jeff"))
    end
  end

  describe('#delete') do
    it("deletes an game by id") do
      game = Game.new({:name => "Naima", :franchise_id => @franchise.id, :id => nil})
      game.save()
      game2 = Game.new({:name => "Hello World", :franchise_id => @franchise.id, :id => nil})
      game2.save()
      game.delete()
      expect(Game.all).to(eq([game2]))
    end
  end

  describe('.find_by_franchise') do
    it("finds games for an franchise") do
      franchise2 = Franchise.new({:name => "Halo", :id => nil})
      franchise2.save
      game = Game.new({:name => "Halo Reach", :franchise_id => @franchise.id, :id => nil})
      game.save()
      game2 = Game.new({:name => "Halo 4", :franchise_id => franchise2.id, :id => nil})
      game2.save()
      expect(Game.find_by_franchise(franchise2.id)).to(eq([game2]))
    end
  end

  describe('#franchise') do
    it("finds the franchise a game belongs to") do
      game = Game.new({:name => "Minecraft", :franchise_id => @franchise.id, :id => nil})
      game.save()
      expect(game.franchise()).to(eq(@franchise))
    end
  end
end
