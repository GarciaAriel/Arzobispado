class AddEventToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :evento, index: true

  end
end
