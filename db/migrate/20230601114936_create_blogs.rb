class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :user_id, limit:10, default:'NULL', null:true,
      t.string :title, limit:100, default:'NULL', null:true,
      t.string :slug, limit:100, default:'NULL', null:true,
      t.string :body, default:'NULL', null:true,
      t.string :image, default:'NULL', null:true,
      t.timestamps
    end
  end
end
