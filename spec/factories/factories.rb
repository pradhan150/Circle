FactoryBot.define do
  factory :user do
    name {"joe"}
    email {"joe@gmail.com"}
    password {"123456"}
    mobile_number {23412342}
    date_of_birth {"1975-02-10"}
    gender {"male"}
    confirmed_at {Time.now}
  end

  factory :group do
    name {"Test Group"}
  end

  factory :member_ship do
    user
    group
    role {}
  end

  factory :post do
    user
    group
    body {"test post"}
  end
end
