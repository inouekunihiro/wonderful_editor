require "rails_helper"

RSpec.describe User, type: :model do
  describe "正常系テスト" do
    context "レコード作成に必要な情報が揃っている時(名前、メールアドレス、パスワードが入力されている場合)" do
      let(:user) { build(:user) }
      it "ユーザーのレコードが作成される（ユーザー登録できる）" do
        # user = FactoryBot.build(:user)
        # expect(user.valid?).to eq true
        expect(user).to be_valid
      end
    end
  end

  describe "異常系テスト" do
    context "レコードに name のみで email, password を指定していない時" do
      let(:user) { build(:user, email: nil, password: nil) }

      it "ユーザーの作成に失敗する（エラーが発生する）" do
        # expect(user.valid?).to eq false
        # expect(user).not_to be_valid
        expect(user).to be_invalid

        # expect(user.errors.details[:email][0][:error]).to eq :blank
        # expect(user.errors.details[:password][0][:error]).to eq :blank
      end
    end

    context "レコードに email がない場合" do
      let(:user) { build(:user, email: nil) }

      it "エラーが発生する" do
        # expect(user.valid?).to eq false
        expect(user).to be_invalid

        # expect(user.errors.details[:email][0][:error]).to eq :blank
      end
    end

    context "レコードに password がない場合" do
      let(:user) { build(:user, password: nil) }

      it "エラーが発生する" do
        # expect(user.valid?).to eq false
        expect(user).to be_invalid
        # expect(user.errors.details[:password][0][:error]).to eq :blank
      end
    end
  end
end
