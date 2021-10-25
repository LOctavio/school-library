class PeopleList
  attr_accessor :people

  def initialize
    @people = []
  end

  def show
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def add(person)
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    case person
    when 1
      puts 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp
      @people.push(Student.new(age, name, parent_permission))
    when 2
      puts 'Specialization:'
      specialization = gets.chomp
      @people.push(Teacher.new(age, name, specialization))
    end
    puts 'Person created successfully'
  end
end