ActiveAdmin.register Product do
  permit_params :name, :waight, :price, :category, :type, :presentation, :brand

  menu parent: 'Warehouses'

  index do
    selectable_column
    id_column
    column :name
    column :weight
    column :price
    column 'Category', sortable: :category_id do |product|
      category = product.category
      category.name if category
    end
    column 'Presentation', sortable: :presentation_id do |product|
      presentation = product.presentation
      presentation.name if presentation
    end
    column 'Type', sortable: :type_id do |product|
      type = product.type
      type.name if type
    end
    column 'Brand', sortable: :brand_id do |product|
      brand = product.brand
      brand.name if brand
    end
    actions
  end

  filter :name

  form do |f|
    f.inputs "Payment Type Details" do
      f.input :name
      f.input :weight
      f.input :price
      f.input :category, label: 'Category', collection: Category.all
      f.input :presentation, label: 'Presentation', collection: Presentation.all
      f.input :type, label: 'Type', collection: Type.all
      f.input :brand, label: 'Brand', collection: Brand.all
    end
    f.actions
  end

end
