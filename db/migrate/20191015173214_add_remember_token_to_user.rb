# frozen_string_literal: true

class AddRememberTokenToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :remember_digest, :string
  end
end
