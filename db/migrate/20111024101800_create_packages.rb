class CreatePackages < ActiveRecord::Migration
  def self.up
  	create_table :packages do |p|
  		p.integer :length
  		p.text :articles
  		
  		p.timestamps
  	end
  end

  def self.down
  end
end