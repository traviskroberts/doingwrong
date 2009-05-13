namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Entry, Comment, Vote].each(&:delete_all)
    
    Entry.populate 25 do |entry|
      entry.to = Populator.words(3..10).capitalize
      entry.message = Populator.sentences(2..5)
      entry.approved = true
      Comment.populate 0..5 do |comment|
        comment.entry_id = entry.id
        comment.name = Faker::Name.name
        comment.message = Populator.sentences(2..5)
      end
    end
  end
end