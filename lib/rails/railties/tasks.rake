namespace :cheese do
  
  desc "example gem rake task"
  task :report => :environment do
    puts "you just ran the example gem rake task"
  end

end