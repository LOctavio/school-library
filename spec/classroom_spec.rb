require_relative '../classes/classroom'

describe Classroom do
  context 'Testing the classroom class' do
    before(:context) do
      label = 'B'
      @classroom = Classroom.new(label)
    end
    

    it 'It is an instance of Classroom' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end

    it 'The classroom label is equal to B' do
      expect(@classroom.label).to eq('B')
    end

    it 'It add students to the classroom' do
      @classroom.add_student(Student.new(12, 'luis', true))
      expect(@classroom.students.length).to eq(1)
    end
  end
end