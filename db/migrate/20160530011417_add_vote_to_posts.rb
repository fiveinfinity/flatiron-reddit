class AddVoteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :vote, :integer, :default => 0
  end
end
