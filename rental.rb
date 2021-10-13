class Rental
  attr_accessor :date

  def initialize(date)
    @date = date
    @book = "Uknown"
    @person = "Uknown"
  end

  def book=(book)
    @book = book
    book.rental.push(self) unless book.rental.include?(self)
  end

  def person=(person)
    @person = person
    person.rental.push(self) unless person.rental.include?(self)
end
