ActiveRecord::Schema.define(version: 20190613034814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feeds", force: :cascade do |t|
    t.text "image"
    t.text "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
