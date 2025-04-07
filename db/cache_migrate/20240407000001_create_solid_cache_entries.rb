# frozen_string_literal: true

class CreateSolidCacheEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :solid_cache_entries do |t|
      t.binary :key, null: false, limit: 1024
      t.binary :value, null: false, limit: 536870912
      t.datetime :created_at, null: false
      t.bigint :key_hash, null: false
      t.integer :byte_size, null: false, limit: 4
      
      t.index :key_hash, unique: true
      t.index :byte_size
      t.index [:key_hash, :byte_size]
    end
  end
end 