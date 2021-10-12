class Corrector
  def correct_name(name)
    new_name = name.capitalize
    new_name = new_name[0, 10] if name.length > 10
    new_name
  end
end
