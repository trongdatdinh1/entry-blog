class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :text
      t.belongs_to :user
      t.belongs_to :blog
      t.timestamps
    end
  end
end
