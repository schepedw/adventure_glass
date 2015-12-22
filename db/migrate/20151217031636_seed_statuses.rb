class SeedStatuses < ActiveRecord::Migration
  def change
    %w[new confirmed processing processed shipping complete].each do |status|
      Status.create(status: status)
    end
  end
end
