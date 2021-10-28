class PeopleList
  attr_accessor :people

  def initialize
    file = File.open('data/people.json', 'a+')
    @people = file.size == 0 ? [] : JSON.parse(file.read)
    file.close
  end

  def show
    file = File.open('data/people.json', 'r')
    @people.each { |person| puts "[#{person['className']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}" }
    file.close
  end

  def add(person)
    file = File.open('data/people.json', 'w')
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    case person
    when 1
      puts 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp
      student = Student.new(age, name, parent_permission)
      student = student.to_json
      @people.push(student)
    when 2
      puts 'Specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      teacher = teacher.to_json
      @people.push(teacher)
    end
    file.write(JSON[@people])
    file.close
    puts 'Person created successfully'
  end
end
