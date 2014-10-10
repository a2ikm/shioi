namespace :feed do
  task :fetch do
    Feed.all.each(&:fetch!)
  end
end
