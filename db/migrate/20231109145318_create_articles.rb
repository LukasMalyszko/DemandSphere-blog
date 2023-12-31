class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :link
      t.date :pub_date
      t.string :creator
      
      t.timestamps
    end
  end
end
