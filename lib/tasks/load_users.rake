require 'faker'

namespace :load_users do
  
  desc "Create drivers"
  task drivers: :environment do
    15.times do |d|
      update_or_create_driver(
        name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: "test-driver-#{d}@test.com",
        password: "password",
        address: Faker::Address.street_address,
        identity_card_number: "#{d}-0000-0000",
        phone: Faker::PhoneNumber.cell_phone
      )
    end
  end

  desc "Create trucks"
  task trucks: :environment do
    15.times do |t|
      update_or_create_truck(
        plate_number: "10000#{t}",
        year: 2010,
        weight_capacity: Random.rand(100000),
        model: "T-2000",
        latitude: 9.8580844,
        longitude: -83.915223
      )
    end
  end

  desc "Create routes"
  task routes: :environment do

    client_names = ['Pali', 'RTV', 'Terramall', 'Chino', 'TEC']
    client_lats  = [9.8421981, 9.8466741, 9.9021496, 9.8394956, 9.8540489]
    client_long  = [-83.9483253, -83.988442, -84.0312686, -83.9804959, -83.9445921]

    6.times do |r|
      route = update_or_create_route(
        name: "Route #{r}"
      )

      5.times do |c|
        client = update_or_create_client(
          name: client_names[c],
          email: Faker::Internet.free_email,
          phone: Faker::PhoneNumber.cell_phone,
          latitude: client_lats[c],
          longitude: client_long[c],
          route_id: route.id
        )
      end
    end
  end

  # Helpers

  def update_or_create_client(attributes)
    client = Client.find_or_initialize_by(name: attributes.delete(:name))
    client.update_attributes(attributes)
    client
  end

  def update_or_create_route(attributes)
    route = Route.find_or_initialize_by(name: attributes.delete(:name))
    route.update_attributes(attributes)
    route
  end

  def update_or_create_truck(attributes)
    truck = Truck.find_or_initialize_by(plate_number: attributes.delete(:plate_number))
    truck.update_attributes(attributes)
    truck
  end

  def update_or_create_driver(attributes)
    driver = Driver.find_or_initialize_by(email: attributes.delete(:email))
    driver.update_attributes(attributes)
    driver
  end
end