class CreateTables < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :username
      t.timestamps
    end

    create_table :tweets do |t|
      t.string :text
      t.string :tweet_id
      t.timestamps
      t.references :user
      
    end
  end
end
