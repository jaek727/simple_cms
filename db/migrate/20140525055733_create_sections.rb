class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :page     # same as  t.integer "page_id"
      t.string  "name"
      t.integer "position"
      t.boolean "visible"
      t.string  "content_type"
      t.text    "text"
      t.timestamps
    end
  end
end
