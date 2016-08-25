class CreateMicroevents < ActiveRecord::Migration
  def change
    create_table :microevents do |t|
      t.text :description
      t.references :user, index: true
      t.datetime :eventdate

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
