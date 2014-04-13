class CreateUneautrepages < ActiveRecord::Migration
  def change
    create_table :uneautrepages do |t|
      t.string :civilite
      t.string :prenom
      t.string :nom

      t.timestamps
    end
  end
end
