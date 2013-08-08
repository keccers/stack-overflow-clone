  # encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130807162749) do

  create_table "answers", :force => true do |t|
    t.text     "text",         :null => false
    t.integer  "question_id",  :null => false
    t.integer  "responder_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "text",             :null => false
    t.integer  "commentable_id",   :null => false
    t.string   "commentable_type", :null => false
    t.integer  "commenter_id",     :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "title",          :null => false
    t.text     "text",           :null => false
    t.integer  "asker_id",       :null => false
    t.integer  "best_answer_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "questions_tags", :force => true do |t|
    t.integer  "question_id", :null => false
    t.integer  "tag_id",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "text",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.text     "about"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "votable_id",   :null => false
    t.string   "votable_type", :null => false
    t.integer  "value",        :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["user_id", "votable_id", "votable_type"], :name => "index_votes_on_user_id_and_votable_id_and_votable_type", :unique => true

end
