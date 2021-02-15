FactoryBot.define do
  factory :user_purchase do
    post_number       { '123-4567' }
    phone_number      { '09000000000'}
    city              { '東京都'}
    house_number      { '1-1'}
    prefecture_id     { 2 }
    token             { 'testaaaaaaaaaaaaaaaaa'}
  end
end
