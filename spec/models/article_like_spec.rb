# == Schema Information
#
# Table name: article_likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_article_likes_on_article_id  (article_id)
#  index_article_likes_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe ArticleLike, type: :model do
  describe "正常系テスト" do
  context "user と article が存在する時" do
    let(:article_like) { build(:article_like) }
    it "いいねのレコードが作成される" do
      expect(article_like).to be_valid
    end
    end
  end

  describe "異常系テスト" do
  context "user が存在しない場合" do
    let(:article_like) { build(:article_like, user: nil) }
    it "いいねのレコードが作成されない（エラー発生）" do
      expect(article_like).not_to be_valid

      expect(article_like.errors.details[:user][0][:error]).to eq :blank
    end
  end

  context "article が存在しない場合" do
    let(:article_like) { build(:article_like, article: nil) }
    it "いいねのレコードが作成されない（エラーが発生する）" do
      expect(article_like).to be_invalid

      expect(article_like.errors.details[:article][0][:error]).to eq :blank
    end
  end

  context "user と article が存在しない場合" do
    let(:article_like) { build(:article_like, user: nil, article: nil) }
    it "いいねのレコードが作成されない（エラーが発生する）" do
      expect(article_like).to be_invalid

      expect(article_like.errors.details[:user][0][:error]).to eq :blank
      expect(article_like.errors.details[:article][0][:error]).to eq :blank
    end
  end
  end
end
