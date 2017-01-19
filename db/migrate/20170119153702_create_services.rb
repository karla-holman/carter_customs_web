class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :header
      t.string :body
      t.boolean :enabled, null: false, default: true
      t.timestamps null: false
    end

    add_attachment :services, :main_image
  end
end
