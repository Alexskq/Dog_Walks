class RemoveRegistrationDeadlineFromWalks < ActiveRecord::Migration[8.0]
  def change
    remove_column :walks, :registration_deadline, :datetime
  end
end
