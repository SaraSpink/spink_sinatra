require ('rspec')
require ('define_word')
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

  describe ('#my_word') do
    it ("takes a user's word and returns it") do
      userword = Word.new({"my_word" => "Chrysanthemum"})
      expect(userword.my_word).to(eq("Chrysanthemum"))
    end
  end

  describe ('#save') do
    it ("saves a user's word to a list") do
      userword = Word.new({"my_word" => "Chrysanthemum"})
      userword.save()
      expect(Word.all()).to(eq([userword]))
    end
  end

  describe ('#sort') do
    it ("sorts the words alphabetically") do
      poodle = Word.new({"my_word" => "Poodle"})
      poodle.save()
      great_dane = Word.new({"my_word" => "Great Dane"})
      great_dane.save()
      husky = Word.new({"my_word" => "Husky"})
      husky.save()
      Word.sort()

      expect(Word.all()).to(eq([great_dane, husky, poodle]))

    end
  end

  describe ('#initialize id') do
    it ("assigns an id to each word on the list") do
      userword1 = Word.new({"my_word" => "Chrysanthemum"})
      userword1.save
      userword2 = Word.new({"my_word" => "Poodle"})
      userword2.save
      expect(userword1.id()).to(eq(1))
      expect(userword2.id()).to(eq(2))
    end
  end
end
