require_relative '../classes/book'

describe Book do
  context 'Testing the book class' do
    before(:context) do
      title = 'Harry Potter'
      author = 'J.K. Rowling'
      @book = Book.new(title, author)
    end

    it 'is an instance of Person' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'Its title is equal to Harry Potter' do
      expect(@book.title).to eq('Harry Potter')
    end

    it 'Its author is equal to J.K. Rowling' do
      expect(@book.author).to eq('J.K. Rowling')
    end
  end
end
