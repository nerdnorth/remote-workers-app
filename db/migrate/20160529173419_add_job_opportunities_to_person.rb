class AddJobOpportunitiesToPerson < ActiveRecord::Migration
  def change
    add_column :people, :job_opportunities, :string
  end
end
