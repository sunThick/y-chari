class AddReferencesToParts < ActiveRecord::Migration[7.0]
  def change
    add_reference :parts, :post, null: false, foreign_key: true
  end
end
