class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  def up
    create_table :admin_users_pages, :id => false do |t|
    	t.integer "admin_user_id"
    	t.integer "page_id"
#inside that migration we create two columnss of interger 
#values, that will hold the two foreign keys
#BECAUSE we create/have a join table, we don't need
#a promary key, do we set :id => false 

    end

    add_index :admin_users_pages, ["admin_user_id", "page_id"]
    #we create only one index, that has table's name, and in that index
    #we add an array, the element's of that array will be the names of the columns
    #of our table
  end

  def down
  drop_table :admin_users_pages
  end
end
