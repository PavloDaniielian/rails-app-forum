class AddUseremailToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :useremail, :string
  end
end
