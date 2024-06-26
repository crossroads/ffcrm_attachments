class AddAttachments < ActiveRecord::Migration[4.2]
  def self.up
    create_table :attachments, :force => true do |t|
      t.references  :entity, :polymorphic => true
      t.timestamps
    end

    add_attachment :attachments, :attachment

  end

  def self.down
  	remove_attachment :attachments, :attachment
    
    drop_table :attachments
  end
end
