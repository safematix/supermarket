FactoryGirl.define do
  factory :cookbook do
    association :category
    sequence(:name) { |n| "redis-#{n}" }
    description 'An awesome cookbook!'
    maintainer 'Chef Software, Inc'
    external_url 'http://example.com'
    deprecated false

    ignore do
      cookbook_versions_count 2
    end

    after(:create) do |cookbook, evaluator|
      create_list(:cookbook_version, evaluator.cookbook_versions_count, cookbook: cookbook)
    end
  end
end
