class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date)
    @date = date
    @book = 'Uknown'
    @person = 'Uknown'
  end

  def book=(book)
    @book = book
  end

  def person=(person)
    @person = person
  end

  def to_json(_options = {})
    {
      'className' => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person
    }
  end
end
