class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    puts "#{user.email} is being updated"
    sleep 5
    puts "#{user.email} updated successfully"
  end
end
