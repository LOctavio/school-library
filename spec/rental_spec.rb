require_relative '../classes/rental'
require_relative '../classes/book'
require_relative '../classes/student'
require_relative '../classes/teacher'

describe Rental do
  context 'Testing the rental class' do
    before(:context) do
      date = '12/12/12'
      @rental = Rental.new(date)
    end

    it 'is an instance of Rental' do
      expect(@rental).to be_an_instance_of(Rental)
    end

    it 'adds a person to the rental' do
      @rental.person = Student.new(12, 'luis', true)
      expect(@rental.person).to be_an_instance_of(Student)
    end
    it 'adds a book to the rental' do
      @rental.book = Book.new('Harry Potter', 'JK Rowling')
      expect(@rental.book).to be_an_instance_of(Book)
    end
  end
end
