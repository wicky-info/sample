class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :judul_website
      t.string :judul_footer

      t.timestamps
    end
  end
end
