require 'json'

class BookList
  attr_accessor :books

  def initialize
    file = File.open('data/books.json', 'a+')
    @books = file.size == 0 ? [] : JSON.parse(file.read)
    file.close
  end

  def show
    file = File.open('data/books.json', 'r')
    @books.each { |book| puts "Title: \"#{book['title']}\", Author: #{book['author']}" }
    file.close
  end

  def add
    file = File.open('data/books.json', 'w')
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    book = book.to_json
    @books.push(book)
    file.write(JSON[@books])
    file.close
    puts 'Book created successfully'
  end
end
