FactoryBot.define do
  factory :contact_log_failure do
    data { "MyText" }
    error { "MyText" }
    user_id { "" }
    log_file_id { "" }
  end
end
