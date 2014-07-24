class CreateSectionEdits < ActiveRecord::Migration
  def up
    create_table :section_edits do |t|
    	t.references :section
    	t.references :admin_user
    	# the references will give us the table id
    	#it is the same like the t.integer "admin_user_id"
    	t.string :summary
      t.timestamps
    end
    add_index :section_edits, ["admin_user_id", "section_id"]
  end

  def down
  	drop_table :section_edits
  end
  #here we do want a primary key because it's a model, so we don't set it to false
end
