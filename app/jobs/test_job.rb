# app/jobs/test_job.rb
class TestJob < ApplicationJob
  def perform
    puts "Test job running!"
  end
end
