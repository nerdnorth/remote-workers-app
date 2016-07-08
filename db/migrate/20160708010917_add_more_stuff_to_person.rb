class AddMoreStuffToPerson < ActiveRecord::Migration
  def change
    add_column :people, :job_opportunities_design, :boolean
    add_column :people, :job_opportunities_development, :boolean
    add_column :people, :job_opportunities_other, :boolean
    Person.all.each do |p|
      p.job_opportunities_design = true if p.job_opportunities == 'design'
      p.job_opportunities_development = true if p.job_opportunities == 'software-development'
      p.job_opportunities_other = true if p.job_opportunities == 'other-roles'
      p.save!
    end
  end
end
