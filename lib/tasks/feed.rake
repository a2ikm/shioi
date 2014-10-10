namespace :feed do
  task :fetch => :environment do
    Feed.all.each(&:fetch!)
  end
end
