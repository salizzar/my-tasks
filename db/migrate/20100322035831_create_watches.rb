class CreateWatches < ActiveRecord::Migration
  def self.up
    create_table :watches, :id => false do |t|
      t.references :user
      t.references :list
    end
  end

  def self.down
    drop_table :watches
  end
end
