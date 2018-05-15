namespace :db do

  desc "Erase and fill database"
  task :populate => :environment do

    [Task, List, User].each(&:delete_all)

    User.create!(name: 'Chuck Norris', email: 'chuck@norris.com',
                 password: '123456')

    20.times do
      User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.unique.email,
        password: '123456'
      )
    end

    User.all.each do |user|
      5.times { user.lists.create! name: Faker::Job.unique.title }
    end

    List.all.each do |list|
      10.times do
        list.tasks.create! title: Faker::Job.field,
                           done: [true, false].sample
      end
    end
  end
end
