class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.text :image
      t.text :caption

      t.timestamps
    end
  end
end
