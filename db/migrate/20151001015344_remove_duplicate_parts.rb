class RemoveDuplicateParts < ActiveRecord::Migration
  def change
    Part.delete([1022, 1024])
  end
end
