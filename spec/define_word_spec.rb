require ('rspec')
require ('define_word')
require ('pry')

describe ('Define::Word') do
  before() do
    Define::Word.clear()
  end

  describe ('#my_word') do
    it ("takes a user's word and returns it") do
      userword = Define::Word.new({:my_word => "Chrysanthemum"})
      expect(userword.my_word).to(eq("Chrysanthemum"))
    end
  end

  describe ('#save') do
    it ("saves a user's word to a list") do
      userword = Define::Word.new({:my_word => "Chrysanthemum"})
      userword.save()
      expect(Define::Word.all()).to(eq([userword]))
    end
  end

  describe ('#sort') do
    it ("sorts the words alphabetically") do
      userword = Define::Word.new({:my_word => "Poodle"})
      userword.save()
      userword = Define::Word.new({:my_word => "Great Dane"})
      userword.save()
      userword = Define::Word.new({:my_word => "Husky"})
      userword.save()
      Define::Word.sort()
      expect(Define::Word.all()).to(eq(["Great Dane", "Husky", "Poodle"]))

    end
  end

  describe ('#initialize id') do
    it ("assigns an id to each word on the list") do
      userword1 = Define::Word.new({:my_word => "Chrysanthemum"})
      userword1.save
      userword2 = Define::Word.new({:my_word => "Poodle"})
      userword2.save
      expect(userword1.id()).to(eq(1))
      expect(userword2.id()).to(eq(2))
    end
  end
end
