require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /articles" do
    subject { get(api_v1_articles_path) }
    # let(:user) { build(:user) }
    # let(:article) { create(:article) }
    # before { create(:article) }
    # before { 3.times { create(:article) } } 3.times で3つのデータを作成

    before { create_list(:article, 3) } # FactoryBot の create_lisk メソッドを利用して3つのデータを作成

    it "記事の一覧が取得できる" do
      # 3.times { create(:article) }
      # Article.create!(title: "title", body: "body", user: user)
      # article.save
      subject
      aggregate_failures "最後まで通過" do
        # get api_v1_articles_path

        # テストで確認したいこと ①データが全て返ってきていること ② 返ってきたデータは body 以外の全てのデータをもっていること ③ステータスコードが200であること
        res = JSON.parse(response.body) # JSON形式に整形
        expect(res.length).to eq 3 # ①データが全て返ってきていることを確認
        expect(res[0].keys).to eq ["id", "title", "updated_at", "user"] # ② 返ってきたデータは body 以外の全てのデータをもっていること
        expect(response.status).to eq 200 # ③ステータスコードが200であること
      end
    end
  end

  describe "GET /articles/:id" do
    subject { get(api_v1_article_path(article_id)) }

    context "指定した id の記事が存在する時" do
      let(:article_id) { article.id }
      let(:article) { create(:article) }

      it "指定した id の記事の詳細が取得できる" do
        subject
        # get "/api/v1/articles/show"
        aggregate_failures "最後まで通過" do
          res = JSON.parse(response.body)

          # テストで確認したいこと
          # データが全て帰ってきていること
          expect(res.length).to eq 5
          # 全てのデータが入っていること（帰ってきているデータの確認）
          expect(res.keys).to eq ["id", "title", "body", "updated_at", "user"]
          # ステータスコードが200であること
          expect(response.status).to eq 200
          expect(res["id"]).to eq article.id
          expect(res["title"]).to eq article.title
          expect(res["body"]).to eq article.body
          expect(res["updated_at"]).to be_present
          # expect(res["user"]).to eq article.user
          expect(res["user"]["id"]).to eq article.user.id
          expect(res["user"].keys).to eq ["id", "name", "email"]
        end
      end
    end

    context "指定した id が存在しない時" do
      let(:article_id) { 1000 }

      it "指定した id の記事の詳細が取得できない" do
        # binding.pry で subject の挙動（エラー）を確認する。
        # subject

        expect { subject }.to raise_error(ActiveRecord::RecordNotFound) # subject は {} で囲んであげて、 matcher には raise_error を指定して引数にエラーを書く。
      end
    end
  end

  describe "POST /articles" do
    subject { post(api_v1_articles_path, params: params) }

    context "ログインユーザーとして適切なパラメーターを送信した時" do
      let(:params) { { article: attributes_for(:article) } }
      let(:current_user) { create(:user) }

      # stub
      before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }
      # let(:current_user) (stub)

      it "記事のレコードを作成できる" do
        aggregate_failures "最後まで通過" do
          expect { subject }.to change { Article.where(user_id: current_user.id).count }.by(1)
          res = JSON.parse(response.body)
          expect(res["title"]).to eq params[:article][:title]
          expect(res["body"]).to eq params[:article][:body]
          expect(res["user"]["id"]).to eq current_user[:id]
          expect(res["user"]["email"]).to eq current_user[:email]
          expect(res["user"]["name"]).to eq current_user[:name]
          expect(response).to have_http_status(:ok)
        end
      end
    end

    # context "不適切なパラメーターを送信した時" do
    #   let(:params) { attributes_for(:article) }
    #   let(:current_user) { create(:user) }

    #   # stub
    #   before do
    #     allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user)
    #   end
    #   # let(:current_user) (stub)

    #   fit "記事のレコードが作成できない" do
    #     # binding.pry
    #     expect(subject).to raise_error(ActionController::ParameterMissing)
    #   end
    # end
  end

  #   describe "PATCH /update" do
  #     it "指定した任意の記事を更新することができる" do
  #       get "/api/v1/articles/update"
  #       expect(response).to have_http_status(:success)
  #     end
  #   end

  #   describe "DELETE /destory" do
  #     it "指定した記事を削除することができる" do
  #       get "/api/v1/articles/destory"
  #       expect(response).to have_http_status(:success)
  #     end
  #   end
end
