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
      Category.find(product.category_id).name if product.category_id
    end
    column 'Presentation', sortable: :presentation_id do |product|
      Presentation.find(product.presentation_id).name if product.presentation_id
    end
    column 'Type', sortable: :type_id do |product|
      Type.find(product.type_id).name if product.type_id
    end
    column 'Brand', sortable: :brand_id do |product|
      Brand.find(product.brand_id).name if product.brand_id
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
