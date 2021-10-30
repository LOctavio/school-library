require_relative '../classes/corrector'

describe Corrector do
  context 'Testing the corrector class' do
    before(:context) do
      @corrector = Corrector.new
    end

    it 'is an instance of Corrector' do
      expect(@corrector).to be_an_instance_of(Corrector)
    end

    it 'Capitalizes the name' do
      expect(@corrector.correct_name('luis')).to eq('Luis')
    end
    it 'trim the name if has more than 10 characters' do
      expect(@corrector.correct_name('luis octavio')).to eq('Luis octav')
    end
  end
end
