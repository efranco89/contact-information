FactoryBot.define do
  factory :contact do
    name { 'John Doe' }
    birthday { '2000/10/22' }
    phone { '(+57) 310 618 44 74' }
    address { 'La calle primera' }
    franchise { '' }
    email { 'luisfrancoz1@gmail.com' }
    user_id { 1 }

    trait :visa_good_number do
      credit_card { '4123456789123456' }
    end

    trait :visa_bad_number do
      credit_card { '0123456789123456' }
    end
  end
end
