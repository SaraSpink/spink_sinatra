require ('rspec')
require ('word')
require ('pry')

describe ('Word') do
  before() do
    Word.clear()
  end

  describe (".all") do
    it("is empty at first") do
    expect(Word.all()).to(eq([]))
    end
  end

  describe ('#word') do
    it ("takes a user's word and returns it") do
      userword = Word.new({:term => "Chrysanthemum", :definition => "definition"})
      expect(userword.term).to(eq("Chrysanthemum"))
    end
  end

  describe ('#save') do
    it ("saves a user's word to a list") do
      userword = Word.new({:term => "Chrysanthemum", :definition => "definition"})
      userword.save()
      expect(Word.all()).to(eq([userword]))
    end
  end

  describe ('#sort') do
    it ("sorts the words alphabetically") do
      poodle = Word.new({:term => "Poodle", :definition => "definition"})
      # poodle.save()
      great_dane = Word.new({:term => "Great Dane", :definition => "definition"})
      # great_dane.save()
      husky = Word.new({:term => "Husky", :definition => "definition"})
      # husky.save()
      Word.sort()

      expect(Word.sort()).to(eq([great_dane, husky, poodle]))

    end
  end

  describe ('#initialize id') do
    it ("assigns an id to each word on the list") do
      userword1 = Word.new({:term => "Chrysanthemum", :definition => "definition"})
      userword1.save
      userword2 = Word.new({:term => "Poodle", :definition => "definition"})
      userword2.save
      expect(userword1.id()).to(eq(1))
      expect(userword2.id()).to(eq(2))
    end
  end

  describe ('#add_definitions') do
    it ("returns multiple definitions for a word") do
      userword1 = Word.new({:term => "Chrysanthemum", :definitions => @definitions})
      userword1.save
      userword1.add_definitions("a flower")
      userword1.add_definitions("an umbrella")
      userword1.add_definitions("a plant")

      expect(userword1.definitions()).to(eq(["a flower", "an umbrella", "a plant"]))
    end
  end
end
