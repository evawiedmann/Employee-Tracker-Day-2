class JoinIndividualsAndProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :individuals_projects, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :individual, index: true
    end
  end
end
