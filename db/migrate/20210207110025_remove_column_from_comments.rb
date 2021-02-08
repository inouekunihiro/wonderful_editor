class RemoveColumnFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :user_id, :bigint
    remove_column :comments, :article_id, :bigint
  end
end
