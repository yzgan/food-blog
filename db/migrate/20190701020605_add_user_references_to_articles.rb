class AddUserReferencesToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user, foreign_key: true, index: true, null: false
  end
end
