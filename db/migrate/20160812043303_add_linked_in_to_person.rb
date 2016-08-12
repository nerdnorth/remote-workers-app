class AddLinkedInToPerson < ActiveRecord::Migration
  def change
    add_column :people, :linkedin, :string, limit: 1024
  end
end
