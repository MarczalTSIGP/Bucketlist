FactoryBot.define do
  factory :user do
    name 'Diego'
    sequence(:email) { |n| "user#{n}@bucketlist.br" }
    password 'password'
    password_confirmation 'password'
  end
end
