class AddTagToBlogPosts < ActiveRecord::Migration[7.0]
  def change
    create_enum :blog_post_tag, ["travel", "code", "food", "offbeat"]

    create_table :blog_posts, force: true do |t|
      t.string :title
      t.text :body
      t.datetime :published_at
      t.timestamps
      t.enum :tag, enum_type: "blog_post_tag", default: "travel", null: false
    end
  end
end
