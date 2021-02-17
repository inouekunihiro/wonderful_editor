# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "正常系テスト" do
    context "レコードの body にコメントが入力されている時" do
      let(:comment) { build(:comment) }
      it "コメントが投稿される" do
        # comment = build(:comment)
        expect(comment).to be_valid
      end
    end
  end

  describe "異常系テスト" do
    context "レコードの body にコメントが入力されていない時" do
      let(:comment) { build(:comment, body: nil) }
      it "コメントが投稿されない（エラーが発生する）h" do
        # comment = build(:comment, body: nil)
        expect(comment).not_to be_valid
        # expect(comment.errors.details[:body][0][:error]).to eq :blank
      end
    end

    context " user と artcile が存在しない場合" do
      let(:comment) { build(:comment, user: nil, article: nil) }
      it "コメントが投稿されない（エラーが発生する）h" do
        expect(comment).to be_invalid

        # expect(comment.errors.details[:user][0][:error]).to eq :blank
        # expect(comment.errors.details[:article][0][:error]).to eq :blank
      end
    end
  end
end
