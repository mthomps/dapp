module User
  def is_doctor?
    self.class.name == 'Doctor'
  end
end
