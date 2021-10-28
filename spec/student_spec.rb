require_relative '../classes/student'

describe Student do
  context 'Testing the student class' do
    before(:context) do
      age = 15
      name = 'octavio'
      parent_permission = false
      @student = Student.new(age, name, parent_permission)
    end
    

    it 'It is an instance of Student' do
      expect(@student).to be_an_instance_of(Student)
    end

    it 'It is age is equal to 15' do
      expect(@student.age).to eq(15)
    end

    it 'It is author is equal to octavio' do
      expect(@student.name).to eq('octavio')
    end

    it 'A student who does not have parent permission can not use the services' do
      expect(@student.can_use_services?).to eq(false)
    end

    it 'A student who have parent permission can use the services' do
      @student.parent_permission = true
      expect(@student.can_use_services?).to eq(true)
    end

    it 'The name is validated' do
      expect(@student.validate_name).to eq('Octavio')
    end

    it 'A rental is added' do
      @student.add_rental(Rental.new('12/12/!2'))
      expect(@student.rental.length).to eq(1)
    end
  end
end