require "open-uri"
require "faker"

puts "Cleaning database..."
User.destroy_all
Contact.destroy_all
Property.destroy_all
Bill.destroy_all
Contract.destroy_all
ContractPrice.destroy_all
Incident.destroy_all
IncidentUpdate.destroy_all
Settlement.destroy_all

puts "Creating..."

user = User.create(
  first_name: "Ezequiel",
  email: "epuyosdacosta@gmail.com",
  agency_name: "Agenda prop",
  password: "Agendaprop+23"
)
puts "User with id: #{user.id} has been created"

5.times do
  owner = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: "owner",
    notes: Faker::Lorem.sentence(word_count: 3),
    user: user
  )
  puts "Owner with id: #{owner.id} has been created"

  tenant = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: "tenant",
    notes: Faker::Lorem.sentence(word_count: 3),
    user: user
  )
  puts "Tenant with id: #{tenant.id} has been created"

  guarantor = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: "guarantor",
    notes: Faker::Lorem.sentence(word_count: 3),
    user: user
  )
  puts "Guarantor with id: #{guarantor.id} has been created"

  contact = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: ["guarantor", "tenant", "owner", "supplier"].sample,
    notes: Faker::Lorem.sentence(word_count: 3),
    user: user
  )
  puts "Contact with id: #{contact.id} has been created"
end

puts '<-> Contacts created'

5.times do |index|
  index += 1
  puts index
  owner = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: "owner",
    notes: Faker::Lorem.sentence(word_count: 3),
    user: user
  )
  puts "Owner with id: #{owner.id} has been created"

  tenant = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: "tenant",
    notes: Faker::Lorem.sentence(word_count: 3),
    user: user
  )
  puts "Tenant with id: #{tenant.id} has been created"

  guarantor = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: "guarantor",
    notes: Faker::Lorem.sentence(word_count: 3),
    user: user
  )
  puts "Guarantor with id: #{guarantor.id} has been created"

  contact = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: ["guarantor", "tenant", "owner", "supplier"].sample,
    notes: Faker::Lorem.sentence(word_count: 3),
    user: user
  )
  puts "Contact with id: #{contact.id} has been created"

  property = Property.create(
    reference: Faker::Ancient.hero,
    cadastral_reference: Faker::Number.hexadecimal(digits: 3),
    kind: ["Lote", "Depto", "Casa"].sample,
    address: Faker::Address.street_address,
    apartment: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    postal_code: Faker::Address.zip,
    total_area: rand(400..800),
    covered_area: rand(50..300),
    rooms: rand(1..10),
    bathrooms: rand(1..10),
    amenities: Faker::House.furniture,
    price: rand(100000..2000000),
    notes: Faker::Books::CultureSeries.culture_ship,
    owner: owner,
    user: user
  )
  file = URI.open('https://loremflickr.com/400/400/house')
  property.photos.attach(io: file, filename: "photo#{index}.jpg")
  file = URI.open('https://loremflickr.com/400/400/house')
  property.photos.attach(io: file, filename: "photo#{index+1}.jpg")
  puts "Property with id: #{property.id} has been created"

  bill = Bill.create(
    bill_date: Faker::Time.between(from: DateTime.now - 10, to: DateTime.now),
    kind: ["payout", "collection"].sample,
    property: property,
    contact: contact,
    price: rand(400..800),
    concept: Faker::Lorem.sentence(word_count: 3),
    payment_method: ["Efectivo", "Transferencia"].sample,
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    user: user
  )
  puts "Bill with id: #{bill.id} has been created"

  contract = Contract.create(
    kind: Faker::Lorem.word,
    property: property,
    start_date: Faker::Time.between(from: DateTime.now - 20, to: DateTime.now),
    end_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1095),
    price: rand(300..1000),
    comision: rand(3..9),
    guarantor_identity_kind: "DNI",
    guarantor_identity_number: rand(40000..80000),
    guarantee_address: Faker::Address.street_address,
    security_deposit_amount_cents: rand(300..1000),
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    tenant: tenant,
    guarantor: guarantor,
    user: user
  )
  puts "Contract with id: #{contract.id} has been created"

  contract_price = ContractPrice.create(
    contract: contract,
    start_date: Faker::Time.between(from: DateTime.now - 10, to: DateTime.now),
    end_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
    price: rand(300..1000),
    user: user
  )
  puts "Contract price with id: #{contract_price.id} has been created"

  incident = Incident.create(
    property: property,
    contact: contact,
    kind: Faker::Lorem.word,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    user: user
  )
  file = URI.open("#{Faker::LoremFlickr.image(size: "400x400", search_terms: ['house'])}")
  incident.documents.attach(io: file, filename: "document#{index}.jpg")
  puts "Incident with id: #{incident.id} has been created"

  incident_update = IncidentUpdate.create(
    incident: incident,
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    status: ["pending", "doing", "rejected", "done"].sample,
    user: user
  )
  file = URI.open("#{Faker::LoremFlickr.image(size: "400x400", search_terms: ['house'])}")
  incident_update.documents.attach(io: file, filename: "document#{index}.jpg")
  puts "Incident updates with id: #{incident_update.id} has been created"

  settlement = Settlement.create(
    property: property,
    bill: bill,
    price: rand(400..800),
    payment_method: ["Efectivo", "Transferencia"].sample,
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    user: user
  )
  puts "Settlement with id: #{settlement.id} has been created"
end

puts "Finished!"
