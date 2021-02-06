FactoryBot.define do
  factory :product do
     title             {"test"}
     text              {"test"}
     category_id       {1}
     condition_id      {1}
     cost_id           {1}
     prefecture_id     {1}
     days_id           {1}
     price             {1000}
     after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.image.png'), filename: 'test.image.png')
    end
  end
end
