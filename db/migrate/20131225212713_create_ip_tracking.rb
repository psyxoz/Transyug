# encoding : utf-8
class CreateIpTracking < ActiveRecord::Migration
  def up
    create_table :ip_tracking do |t|
      t.string  :ip
      t.text    :message
      t.timestamps
    end
  end

  def down
    drop_table :ip_tracking
  end
end
