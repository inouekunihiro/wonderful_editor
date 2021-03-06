# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :article do
    # title { Faker::ProgrammingLanguage.name }
    # body { Faker::ProgrammingLanguage.creator }

    title { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
    # user { nil }
    # user { build(:user) } # 金子さんのアドバイスをもらう前の記述
    # association :user, factory: :user # 過去動画を見た後の記述
    user
  end
end
