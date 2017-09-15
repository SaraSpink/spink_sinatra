class Word
  @@Word = []
  attr_reader :id
  attr_accessor :word, :definition

  def initialize(attribute)
    @word = attribute.fetch(:word)
    @definition = attribute.fetch(:definition)
    @id = @@Word.length + 1
  end

  def word
    @word
  end

  def definition
    @definition
  end

  def save
    @@Word.push(self)
  end

  def self.all()
    @@Word
  end

  def self.sort
    @@Word.sort_by! {|word_id| word_id.word}
  end

  def self.find(id)
     item_id = id.to_i()
     @@Word.each do |item|
       if item.id == item_id
         return item
       end
     end
   end

  def self.clear()
    @@Word = []
  end
end
