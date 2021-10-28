class Rental
  attr_accessor :date, :book, :person

  def initialize(date)
    @date = date
    @book = 'Uknown'
    @person = 'Uknown'
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
