require('rspec')
require('franchise')

describe '#Franchise' do
  before(:each) do
    Franchise.clear()
  end

  describe('.all') do
    it('returns an empty array when there are no franchises') do
      expect(Franchise.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a franchise') do
      franchise1 = Franchise.new('Call of Duty', nil)
      franchise1.save()
      franchise2 = Franchise.new('Halo', nil)
      franchise2.save()
      expect(Franchise.all).to(eq([franchise1, franchise2]))
    end
  end

  describe('#==') do
    it('is the same franchise if they have the same attributes') do
      franchise1 = Franchise.new('Call of Duty', nil)
      franchise2 = Franchise.new('Call of Duty', nil)
      expect(franchise1).to(eq(franchise2))
    end
  end

  describe('.clear') do
    it('clears all franchises') do
      franchise1 = Franchise.new('Dark Souls', nil)
      franchise1.save()
      franchise2 = Franchise.new('Final Fantasy', nil)
      franchise2.save()
      Franchise.clear()
      expect(Franchise.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a franchise by id') do
      franchise1 = Franchise.new('Dark Souls', nil)
      franchise1.save()
      franchise2 = Franchise.new('Final Fantasy', nil)
      franchise2.save()
      expect(Franchise.find(franchise1.id)).to(eq(franchise1))
    end
  end
end