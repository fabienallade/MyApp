class ChangeColumnInPublications < ActiveRecord::Migration[5.2]
  def change
    change_column :publications, :description ,:text
  end
end
