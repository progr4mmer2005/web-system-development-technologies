
ActiveRecord::Schema[8.1].define(version: 2026_09_20_100151) do
  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.datetime "updated_at", null: false
  end
end
