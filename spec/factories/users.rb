FactoryBot.define do

  factory :user do
    nickname              {"taro"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {Faker::Internet.password(min_length: 6)} 
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_date            {"2000-1-1"}
  end
end
