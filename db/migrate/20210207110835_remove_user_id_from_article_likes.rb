class RemoveUserIdFromArticleLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :article_likes, :user_id, :bigint
    remove_column :article_likes, :article_id, :bigint
  end
end
