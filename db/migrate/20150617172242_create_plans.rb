class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :tax
      t.decimal :monthly_fee

      t.timestamps
    end
    add_column :users, :plan_id , :integer , index: true
  end
end
