class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |table|
  		table.string :name
  	end
  end
end
