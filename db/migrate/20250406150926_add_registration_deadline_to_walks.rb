class AddRegistrationDeadlineToWalks < ActiveRecord::Migration[8.0]
  def change
    add_column :walks, :registration_deadline, :datetime
  end
end
