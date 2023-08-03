class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :text
      t.boolean :is_completed

      t.timestamps
    end
  end
end
