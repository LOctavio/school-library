require_relative '../classes/teacher'

describe Teacher do
  context 'Testing the teacher class' do
    before(:context) do
      age = 30
      name = 'jhon'
      specialization = false
      @teacher = Teacher.new(age, name, specialization)
    end

    it 'It is an instance of Student' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end

    it 'his is age is equal to 30' do
      expect(@teacher.age).to eq(30)
    end

    it 'his is name is equal to jhon' do
      expect(@teacher.name).to eq('jhon')
    end

    it 'A teacher always can use the services' do
      expect(@teacher.can_use_services?).to eq(true)
    end

    it 'The name is validated' do
      expect(@teacher.validate_name).to eq('Jhon')
    end

    it 'A rental is added' do
      @teacher.add_rental(Rental.new('12/12/12'))
      expect(@teacher.rental.length).to eq(1)
    end
  end
end
