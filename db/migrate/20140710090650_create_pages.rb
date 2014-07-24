class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
    	t.integer "subject_id"
    	t.string "name", :limit => 50
    	t.string "permalink"
    	t.integer "posistion"
    	t.boolean "visible", :default => false
      t.timestamps
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end
  def down
  	drop_table :pages
  end
end
