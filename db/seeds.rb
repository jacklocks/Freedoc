require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all


10.times do
    city = City.create!(name: Faker::Address.city)
  end

10.times do
    doctor = Doctor.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        zip_code: Faker::Address.zip_code,
        city_id: City.all.sample.id
    )
end

10.times do
    patient = Patient.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        city_id: City.all.sample.id
    )
end

10.times do
    appointment = Appointment.create!(
    doctor: Doctor.all.sample,
    patient: Patient.all.sample,
    date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
    city_id: City.all.sample.id
    )
end
