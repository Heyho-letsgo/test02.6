class CreateIdees < ActiveRecord::Migration
  def change
    create_table :idees do |t|

      t.timestamps
    end
  end
end
