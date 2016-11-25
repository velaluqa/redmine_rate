class AddBillableToTimeEntries < ActiveRecord::Migration
  def self.up
    add_column :time_entries, :billable, :boolean, default: true, null: false
  end

  def self.down
    remove_column :time_entries, :billable
  end
end
