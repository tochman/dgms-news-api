class AddSubscriptionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscribed, :bool, default: false
  end
end
