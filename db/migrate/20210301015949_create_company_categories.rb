class CreateCompanyCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :company_categories do |t|
      t.string :name, limit: 50

      t.timestamps
    end
  end
end
