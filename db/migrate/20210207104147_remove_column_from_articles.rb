class RemoveColumnFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :user_id, :bigint
  end
end
