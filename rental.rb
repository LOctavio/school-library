class Rental
  attr_accessor :date

  def initialize(date)
    @date = date
    @book = "Uknown"
  end

  def book=(book)
    @book = book
    book.rental.push(self) unless book.rental.include?(self)
  end
end
