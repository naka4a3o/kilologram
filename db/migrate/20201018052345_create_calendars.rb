class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.string :weight
      t.text :content
      t.datetime :start_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
