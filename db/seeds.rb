# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Patient.delete_all
Doctor.delete_all
Reading.delete_all

doc = Doctor.create!({
  name: "John Bartlow",
  email: 'john@dapp.com',
  password:'j',
  phone_number: '1-254-555-6982'
})

doc2 = Doctor.create!({
  name: "Sushruta Samhita",
  email: 'sus@dapp.com',
  password:'s',
  phone_number: '1-321-543-2543'
})

pat = Patient.create!({
  name: 'Michael Thompson',
  email: 'mroythompson@gmail.com',
  phone_number: '1-234-567-8910',
  password: 'abc123',
  age: '23',
  doctor_id: doc.id
})

pat2 = Patient.create!({
  name: 'Steven Thorton',
  email: 'st@dapp.com',
  phone_number: '1-234-567-8910',
  password: 'foo',
  age: '45',
  doctor_id: doc.id
})

pat3 = Patient.create!({
  name: 'Jimmy Beggs',
  email: 'jb@dapp.com',
  phone_number: '1-234-567-8910',
  password: 'bar',
  age: '65',
  doctor_id: doc2.id
})

pat4 = Patient.create!({
  name: 'Heihachi Mishima',
  email: 'heiyo@dapp.com',
  phone_number: '1-234-567-8910',
  password: 'abc123',
  age: '63',
  doctor_id: doc.id
})

pat6 = Patient.create!({
  name: 'Cloud Strife',
  email: 'cloud@dapp.com',
  phone_number: '1-234-567-8910',
  password: 'abc123',
  age: '20',
  doctor_id: doc2.id
})

pat6 = Patient.create!({
  name: 'Chell Plotra',
  email: 'chell@dapp.com',
  phone_number: '1-234-567-8910',
  password: 'apperture',
  age: '28',
  doctor_id: doc2.id
})

start = Time.now

70.times do |i|
  bg = rand(300) + 80
  carbs = rand (200) + 100
  insulin = rand(4)
  exersised = rand(2) == 1
  pat_id = rand(6) + 1
  start = start - 3.hours + 27.minutes
  read = Reading.create!({
    blood_glucose: bg,
    carbs: carbs,
    insulin: insulin,
    exercised: exersised,
    patient_id: pat_id
  })
  read.created_at = start
  read.updated_at = start
  read.save
end



