class Person
  attr_reader :id
  attr_accessor :age, :name

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown', parent_permission = true)
    # rubocop:enable Style/OptionalBooleanParameter
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    # rubocop:enable Naming/PredicateName
    @age >= 18
  end
end
