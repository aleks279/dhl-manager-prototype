require 'faker'

namespace :load_products do

  desc 'Loads all'
  task all: :environment do
    Rake::Task['load_products:categories'].invoke
    Rake::Task['load_products:types'].invoke
    Rake::Task['load_products:brands'].invoke
    Rake::Task['load_products:presentations'].invoke
    Rake::Task['load_products:products'].invoke
    Rake::Task['load_products:admin_user'].invoke
  end

  desc "Creates admin user"
  task admin_user: :environment do
    AdminUser.create email: "admin@example.com", password: "password", password_confirmation: "password"
  end

  desc 'Loads categories'
  task categories: :environment do
    categories = [
      'Granos basicos',
      'Lacteos de larga duracion',
      'Dulces'
    ]

    categories.each do |c|
      update_or_create_category(name: c)
    end
  end

  desc 'Loads types'
  task types: :environment do
    types = [
      '80% grano entero',
      '85% grano entero',
      '90% grano entero',
      '95% grano entero',
      'Negros',
      'Rojos',
      'Semidescremanda',
      'Deslactosada',
      'Descremada',
      'Normal',
      'Light',
      'En polvo',
      'Negro dulce',
      'Blanco dulce',
      'Negro amargo',
      'Sirope',
      'Con galleta',
      'Chispas',
      'Con almendras',
      'con mani'
    ]

    types.each do |t|
      update_or_create_type(name: t)
    end
  end

  desc 'Loads brands'
  task brands: :environment do
    brands = [
      'KirGood',
      'Don Jaime',
      'Del Laguito',
      'Baratico',
      'Dos Cipreses',
      'Ventaka',
      'Anil'
    ]

    brands.each do |b|
      update_or_create_brand(name: b)
    end
  end

  desc 'Loads presentations'
  task presentations: :environment do
    presentations = [
      '2kg',
      '3kg',
      '5kg',
      '1kg',
      '2L',
      '350ml',
      '1L',
      '300g',
      '500g',
      '400g',
      '700g'
    ]

    presentations.each do |p|
      update_or_create_presentation(name: p)
    end
  end

  desc 'Create products'
  task products: :environment do
    50.times do
      update_or_create_products(
        name: Faker::Name.first_name,
        weight: Random.rand(1000),
        price: Random.rand(1000),
        type_id: 1 + rand(Type.all.count),
        category_id: 1 + rand(Category.all.count),
        brand_id: 1 + rand(Brand.all.count),
        presentation_id: 1 + rand(Presentation.all.count)
      )
    end
  end

  # Helpers

  def update_or_create_products(attributes)
    product = Product.find_or_initialize_by(name: attributes.delete(:name))
    product.update_attributes(attributes)
  end

  def update_or_create_category(attributes)
    category = Category.find_or_initialize_by(name: attributes.delete(:name))
    category.update_attributes(attributes)
  end

  def update_or_create_type(attributes)
    type = Type.find_or_initialize_by(name: attributes.delete(:name))
    type.update_attributes(attributes)
  end

  def update_or_create_presentation(attributes)
    presentation = Presentation.find_or_initialize_by(name: attributes.delete(:name))
    presentation.update_attributes(attributes)
  end

  def update_or_create_brand(attributes)
    brand = Brand.find_or_initialize_by(name: attributes.delete(:name))
    brand.update_attributes(attributes)
  end
  
end