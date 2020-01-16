class CreateIndividuals< ActiveRecord::Migration[5.2]
  def change
    create_table(:individuals) do |t|
      t.column(:name, :string)
      t.column(:division_id, :integer)

      t.timestamps()
    end
  end
end
