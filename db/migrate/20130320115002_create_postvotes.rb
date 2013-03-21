class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.references :user
      t.references :post
      t.timestamps 
    end 
  end
end
