class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
