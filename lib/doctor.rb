require 'pry'

class Doctor

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def appointments
    Appointment.all.select do |apt|
      apt.doctor == self
    end
  end

  def patients
    appointments.map do |apt|
      apt.patient
    end
  end
end