class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
    	t.integer "page_id"
    	t.string "name", :limit => 50
    	t.integer "posistion"
    	t.boolean "visible", :default => false 
    	t.string "content_type"
    	t.text "content"
      t.timestamps
    end
    add_index("sections", "page_id")
  end
end
