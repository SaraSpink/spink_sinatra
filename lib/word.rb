class Word
  @@Word = {}
  attr_reader :id
  attr_accessor :term, :definition

  def initialize(attribute)
    @term = attribute.fetch(:term)
    @definition = attribute.fetch(:definition)
    @id = @@Word.length + 1
  end

  def save
    @@Word[id] = self
  end

  def self.all()
    @@Word.values
  end

  def self.sort
    @@Word.sort_by! {|word| word.term}
  end

  def self.find(id)
     @@Word[id.to_i]
   end

  def self.clear()
    @@Word = []
  end
end
