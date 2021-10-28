class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(rental)
    @rental.push(rental)
    rental.book = self
  end

  def to_json(_options = {})
    {
      'className' => self.class.name,
      'title' => @title,
      'author' => @author
    }
  end
end
