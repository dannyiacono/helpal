namespace :request do
  desc "Checks all requests to see if the due date has passed"
  task update_all: :environment do
    requests = Request.all
    puts "Enqueuing update of #{requests.size} requests..."
    requests.each { |request| request.expire if request.due_date < Date.today}
    puts "Job complete!"
  end
end
