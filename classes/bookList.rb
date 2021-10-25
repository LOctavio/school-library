class BookList
  attr_accessor :books

  def initialize
    @books = []
  end

  def show
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def add
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end
end