class CreateTracks < ActiveRecord::Migration[4.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.string :link
    end
  end
end
