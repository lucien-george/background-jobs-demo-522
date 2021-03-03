class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "======================"
    puts "Hello from my fake job"
    puts "======================"
    sleep 3
    puts "======================"
    puts "Fake job over and out"
    puts "======================"
  end
end
