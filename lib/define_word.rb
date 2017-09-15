class Word
  @@word_list = []
  attr_reader :id
  attr_accessor :word, :my_word

  def initialize (attribute)

    @my_word = attribute.fetch("my_word")
    @id = @@word_list.length + 1
  end

  def my_word
    @my_word
  end

  def save
    @@word_list.push(self)
  end

  def self.all()
    @@word_list
  end

  def self.sort()
    @@word_list.sort_by! {|word| word.my_word}
  end

  def self.clear()
    @@word_list = []
  end

  def self.find(id)
    item_id = id.to_i()
    @@word_list.each do |item|
       if item.id == item_id
         return item
       end
    end
  end
end
