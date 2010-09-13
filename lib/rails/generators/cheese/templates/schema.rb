ActiveRecord::Schema.define(:version => 0) do

    create_table :cheese_widgets, :force => true do |t|
      t.string    :title
      t.datetime  :created_at
      t.datetime  :updated_at
    end

    add_index :cheese_widgets, [:title]

end