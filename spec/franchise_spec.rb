require 'spec_helper'

describe '#Franchise' do

  describe('.all') do
    it('returns an empty array when there are no franchises') do
      expect(Franchise.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a franchise') do
      franchise1 = Franchise.new({:name => 'Call of Duty', :id => nil})
      franchise1.save()
      franchise2 = Franchise.new({:name => 'Halo', :id => nil})
      franchise2.save()
      expect(Franchise.all).to(eq([franchise1, franchise2]))
    end
  end

  describe('#==') do
    it('is the same franchise if they have the same attributes') do
      franchise1 = Franchise.new({:name => "Naima", :id => nil})
      franchise2 = Franchise.new({:name => "Naima", :id => nil})
      expect(franchise1).to(eq(franchise2))
    end
  end

  describe('.clear') do
    it('clears all franchises') do
      franchise1 = Franchise.new({:name => 'Dark Souls', :id => nil})
      franchise1.save()
      franchise2 = Franchise.new({:name => 'Final Fantasy', :id => nil})
      franchise2.save()
      Franchise.clear()
      expect(Franchise.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a franchise by id') do
      franchise1 = Franchise.new({:name => 'Dark Souls', :id => nil})
      franchise1.save()
      franchise2 = Franchise.new({:name => 'Final Fantasy', :id => nil})
      franchise2.save()
      expect(Franchise.find(franchise1.id)).to(eq(franchise1))
    end
  end

  describe('#update') do
    it('updates a franchise by id') do
      franchise = Franchise.new({:name => 'Dark Souls', :id => nil})
      franchise.save()
      franchise.update('Resident Evil')
      expect(franchise.name).to(eq('Resident Evil'))
    end
  end

  describe('#delete') do
    it('deletes a franchise by id') do
      franchise1 = Franchise.new({:name => 'Dark Souls', :id => nil})
      franchise1.save()
      franchise2 = Franchise.new({:name => "Call of Duty", :id => nil})
      franchise2.save()
      franchise1.delete()
      expect(Franchise.all).to(eq([franchise2]))
    end
  end

  describe('#games') do
    it("returns a franchise's games") do
      franchise = Franchise.new({:name => "Halo", :id => nil})
      franchise.save()
      game = Game.new({:name => "Halo 3", :franchise_id => franchise.id, :id => nil})
      game.save()
      game2 = Game.new({:name => "Halo Reach", :franchise_id => franchise.id, :id => nil})
      game2.save()
      expect(franchise.games).to(eq([game, game2]))
    end
  end

  describe('#delete') do
    it("deletes all games belonging to a deleted franchise") do
      franchise = Franchise.new({:name => "A Love Supreme", :id => nil})
      franchise.save()
      game = Game.new({:name => "Naima", :franchise_id => franchise.id, :id => nil})
      game.save()
      franchise.delete()
      expect(Game.find(game.id)).to(eq(nil))
    end
  end

end