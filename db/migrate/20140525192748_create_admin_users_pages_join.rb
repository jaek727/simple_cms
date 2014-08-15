class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  def change
    # turn the :id field off as primary index because this is a join table. 
    # the id will be a combined key on both fields.  See index section below
    create_table :admin_users_pages, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "page_id"
    end
    add_index :admin_users_pages, ["admin_user_id", "page_id"]
  end
end
