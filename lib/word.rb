class Word
  @@Word = {}
  attr_reader :id
  attr_accessor :term, :definitions

  def initialize(attribute)
    @term = attribute.fetch(:term)
    # @definition = attribute.fetch(:definition)
    @definitions = []
    @id = @@Word.length + 1
  end

  def save
    @@Word[id] = self
  end

  def self.all()
    @@Word.values
  end

  def self.find(id)
     @@Word[id.to_i]
   end

  def self.clear()
    @@Word = {}
  end

  def add_definitions(new_definition)
    @definitions.push(new_definition)
  end

  def show_definitions
    @definitions
  end

end
