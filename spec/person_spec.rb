require_relative '../classes/person'
require_relative '../classes/rental'

describe Person do
  context 'Testing the person class' do
    before(:context) do
      age = 12
      name = 'luis'
      @person = Person.new(age, name, parent_permission: false)
    end
    

    it 'It is an instance of Person' do
      expect(@person).to be_an_instance_of(Person)
    end

    it 'It is age is equal to 12' do
      expect(@person.age).to eq(12)
    end

    it 'It is author is equal to luis' do
      expect(@person.name).to eq('luis')
    end

    it 'A person who is 12 years old can not use the services' do
      expect(@person.can_use_services?).to eq(false)
    end

    it 'A person who is 20 years old can use the services' do
      @person.age = 20
      expect(@person.can_use_services?).to eq(true)
    end

    it 'The name is validated' do
      expect(@person.validate_name).to eq('Luis')
    end

    it 'A rental is added' do
      @person.add_rental(Rental.new('12/12/!2'))
      expect(@person.rental.length).to eq(1)
    end
  end
end