FactoryBot.define do
  
  factory :product do
     title             {"test"}
     text              {"test"}
     category_id       {2}
     condition_id      {2}
     cost_id           {2}
     prefecture_id     {2}
     days_id           {2}
     price             {1000}
     after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.image.png'), filename: 'test.image.png')
    end
    association :user
  end
end
