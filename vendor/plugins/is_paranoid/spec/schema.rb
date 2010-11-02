ActiveRecord::Schema.define(:version => 20090317164830) do
  create_table "androids", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dents", :force => true do |t|
    t.integer  "android_id"
    t.string   "description"
    t.datetime "deleted_at"
  end

  create_table "dings", :force => true do |t|
    t.integer  "dent_id"
    t.string   "description"
    t.boolean  "not_deleted"
  end

  create_table "scratches", :force => true do |t|
    t.integer  "dent_id"
    t.string   "description"
    t.datetime "deleted_at"
  end

  create_table "androids_places", :force => true, :id => false do |t|
    t.integer  "android_id"
    t.integer  "place_id"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.datetime "deleted_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components", :force => true do |t|
    t.string   "name"
    t.integer  "android_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_components", :force => true do |t|
    t.string "name"
    t.integer "component_id"
    t.datetime "deleted_at"
  end

  create_table "memories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "deleted_at"
  end

  create_table "stickers", :force => true do |t|
    t.string   "name"
    t.integer  "android_id"
    t.datetime "deleted_at"
  end

  create_table "ninjas", :force => true do |t|
    t.string   "name"
    t.boolean  "visible", :default => false
  end

  create_table "pirates", :force => true do |t|
    t.string   "name"
    t.boolean  "alive", :default => true
  end

  create_table "uuids", :id => false, :force => true  do |t|
    t.string   "uuid",     :limit => 36,  :primary => true
    t.string   "name"
    t.datetime "deleted_at"
  end

end
