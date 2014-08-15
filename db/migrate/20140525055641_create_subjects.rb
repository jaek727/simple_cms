class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.references :page
      # same as t.integer "page_id"
      t.string  "name"
      t.integer "position"
      t.boolean "visible", :default => false

      t.timestamps
    end
  end
end
