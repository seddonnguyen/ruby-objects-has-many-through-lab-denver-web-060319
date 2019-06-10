class Patient
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select do |apt|
      apt.patient == self
    end
  end

  def doctors
    appointments.map do |apt|
      apt.doctor
    end
  end
end