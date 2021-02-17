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
require "rails_helper"

RSpec.describe Article, type: :model do
  describe "正常系テスト" do
  context "レコードの title,body にテキストが入力された時" do
    # user が存在しないといけない、Userによって作られた記事だから
    # let(:user) { build(:user) }
    let(:article) { build(:article) } # ここから続き！let に全て帰る！
    it "記事が投稿される" do
      # article = user.articles.new(title: "title", body: "body")
      # article = build(:article)

      expect(article).to be_valid
    end
    end
  end

  describe "異常系テスト" do
  context "レコードの body にテキストが入力されていない時" do
    # let(:user) { build(:user) }
    let(:article) { build(:article, body: nil)}
    it " 記事が投稿されない（エラー発生）" do
      # article = user.articles.new(title: "title", body: nil)
      # article = build(:article, body: nil)

      expect(article).to be_invalid
      expect(article.errors.details[:body][0][:error]).to eq :blank

    end
  end

  context "レコードの body に 141文字以上入力されている時" do
    # let(:user) { build(:user) }
    let(:article) { build(:article, body: "A" * 141)}
    it "記事が投稿されない（エラー発生）" do
      # article = user.articles.new(title: "title", body: "A" * 141 )
      # article = build(:article, body: "A"*141)
      expect(article).to be_invalid
      expect(article.errors.details[:body][0][:error]).to eq :too_long
      expect(article.errors.details[:body][0][:count]).to eq 140
    end
  end

  context "ユーザーが存在しない時" do
    let(:article) { build(:article, user: nil) }
    it "記事が投稿されない（エラーが発生）" do
      # article = Article.new(title: "title", body: "body")
      # article = build(:article, user: nil)

      expect(article).not_to be_valid
      expect(article.errors.details[:user][0][:error]).to eq :blank
    end
  end
  end
end
