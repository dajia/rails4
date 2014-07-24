class AlterUsers < ActiveRecord::Migration
  def up
  	#rename_table("users", "admin_users")
  	#ο πινακας μετονομαζεται
  	#add_column("admin_users", "username", :string, :limit => 35, :after => "email")
  	##χρησιμοποιω το ΝΕΟ ονομα του πίνακα
  	#change_column("admin_users", "email", :string, :limit => 100)
  	#γραφω το ονομα του πινακα και το ονομα της στήλης, τον τυπο των δεδομενων και τις options που θελουμε να αλλάξουμε
  	#αν δεν γραψω κάποια option, τότε δεν θα αλλαξει
  	#rename_column("admin_users", "password", "hashed_password")
  	#γραφω το ονομα του πινακα, το τρεχων ονομα της στηλης και το νεο ονομα της στηλης
  	#add_index("admin_users", "username")
  end


  def down
  	#remove_index("admin_users", "username")
	#rename_column("admin_users", "hashed_password", "password")
	#change_column("admin_users", "email", :sting, :default => "", :null => false)
	#remove_column("admin_users", "username")
 	#rename_table("admin_users", "users")

  end
end
