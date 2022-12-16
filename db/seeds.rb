require "open-uri"
require "faker"

puts "Cleaning database..."
Property.destroy_all
Bill.destroy_all
Contact.destroy_all
ContractPrice.destroy_all
Contract.destroy_all
IncidentUpdate.destroy_all
Incident.destroy_all
Settlement.destroy_all

puts "Creating..."
i = 1

11.times do
  puts i
  user = User.create(
    first_name: "Ezequiel",
    email: "epuyosdacosta@gmail.com",
    agency_name: "Agenda prop",
    password: "Agendaprop+23"
  )
  puts "User with id: #{user.id} has been created"

  owner = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: "owner",
    notes: Faker::Lorem.sentence(word_count: 3),
    user_id: 1
  )
  puts "Owner with id: #{owner.id} has been created"

  tenant = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: "tenant",
    notes: Faker::Lorem.sentence(word_count: 3),
    user_id: 1
  )
  puts "Tenant with id: #{tenant.id} has been created"

  contact = Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::Number.number(digits: 8),
    kind: ["guarantor", "tenant", "owner", "supplier"].sample,
    notes: Faker::Lorem.sentence(word_count: 3),
    user_id: 1
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
    price: rand(400..800),
    price_currency: "USD",
    notes: Faker::Books::CultureSeries.culture_ship,
    owner_id: 1,
    user_id: 1
    # photo.attach(filename: 'photo.jpg', io: URI.open('https://loremflickr.com/400/400/house'))
  )
  puts "Property with id: #{property.id} has been created"

  bill = Bill.create(
    bill_date: Faker::Time.between(from: DateTime.now - 10, to: DateTime.now),
    kind: ["payout", "collection"].sample,
    property_id: i,
    contact_id: i,
    amount: rand(400..800),
    amount_currency: "USD",
    concept: Faker::Lorem.sentence(word_count: 3),
    payment_method: ["Efectivo", "Transferencia"].sample,
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: 1
  )
  puts "Bill with id: #{bill.id} has been created"

  contract = Contract.create(
    kind: Faker::Lorem.word,
    property_id: i,
    start_date: Faker::Time.between(from: DateTime.now - 20, to: DateTime.now),
    end_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1095),
    base_price: rand(300..1000),
    base_price_currency: "USD",
    comision: rand(3..9),
    guarantor_identity_kind: "DNI",
    guarantor_identity_number: rand(40000..80000),
    guarantee_address: Faker::Address.street_address,
    security_deposit_amount: rand(300..1000),
    security_deposit_amount_currency: "USD",
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    tenant_id: 2,
    guarantor_id: i,
    user_id: 1
  )
  puts "Contract with id: #{contract.id} has been created"

  contract_price = ContractPrice.create(
    contract_id: i,
    start_date: Faker::Time.between(from: DateTime.now - 10, to: DateTime.now),
    end_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
    price: rand(300..1000),
    price_currency: "USD",
    user_id: 1
  )
  puts "Contract price with id: #{contract_price.id} has been created"

  incident = Incident.create(
    property_id: i,
    contact_id: i,
    kind: Faker::Lorem.word,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: 1
    # document.attach(Faker::LoremFlickr.image(size: "400x400", search_terms: ['house']))
  )
  puts "Incident with id: #{incident.id} has been created"

  incident_update = IncidentUpdate.create(
    incident_id: i,
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    status: ["pending", "doing", "rejected", "done"].sample,
    user_id: 1
    # documents: Faker::LoremFlickr.image(size: "400x400", search_terms: ['house'])
  )
  puts "Incident updates with id: #{incident_update.id} has been created"

  settlement = Settlement.create(
    property_id: i,
    bill_id: i,
    amount: rand(400..800),
    amount_currency: "USD",
    payment_method: ["Efectivo", "Transferencia"].sample,
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: 1
  )
  puts "Settlement with id: #{settlement.id} has been created"
  i += 1
end

puts "Finished!"
