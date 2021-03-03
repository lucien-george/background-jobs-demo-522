namespace :user do
  desc "Updating all users"
  task update_all: :environment do
    User.all.each do |user|
      UpdateUserJob.perform_later(user)
    end
  end

  desc "Enriching a given user with Clearbit (async)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_later(user)
    puts "Enriching done for #{user.email}"
    # rake task will return when job is _done_
  end
end
