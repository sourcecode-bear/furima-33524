FactoryBot.define do

  factory :user do
    nickname              {"taro"}
    email                 {"test@gmail.com"}
    password              {"123456"}
    password_confirmation {"123456"}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_date            {"2000-1-1"}
  end
end
