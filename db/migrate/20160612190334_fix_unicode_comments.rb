class FixUnicodeComments < ActiveRecord::Migration
  def up
    execute "ALTER TABLE comments CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute("ALTER TABLE comments MODIFY text TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;")
  end

  def down
    execute("ALTER TABLE comments MODIFY text TEXT CHARACTER SET utf8 COLLATE utf8_bin;")
    execute "ALTER TABLE comments CONVERT TO CHARACTER SET utf8 COLLATE utf8_bin"
  end
end
