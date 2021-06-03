class Api::V1::ArticlePreviewSerializer < ActiveModel::Serializer
  # 出力したいカラムを記述( body は無し)
  attributes :id, :title, :updated_at

  # アソシエーション、関連を記述しておく.モデルと同じように書けばいいのかな？
  belongs_to :user, serializer: Api::V1::UserSerializer # これはどう言う意味なんだろう？なぜ serializer ??
end
