class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :content
      t.boolean :done, default: false
      t.references :list, index: true

      t.timestamps
    end
  end
end
