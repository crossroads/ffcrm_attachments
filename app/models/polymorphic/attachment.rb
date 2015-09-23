# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

class Attachment < ActiveRecord::Base

  ATTACHMENT_FORMATS = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg']
  STYLES = { medium: "150x150>" }

  belongs_to :user
  belongs_to :entity, :polymorphic => true

  do_not_validate_attachment_file_type :attachment

  if Rails.env != 'test' && Setting.storage_at_s3
    has_attached_file :attachment,
      styles:         lambda{ |a| a.instance.get_attachment_styles },
      storage:        :s3,
      s3_credentials: Setting.s3_credentials,
      s3_host_name:   Setting.s3_host_name,
      s3_protocol:    Setting.s3_protocol,
      s3_permissions: Setting.s3_permissions
  else
    has_attached_file :attachment,
    styles: lambda{ |a| a.instance.get_attachment_styles }
  end

  def get_attachment_styles
    ATTACHMENT_FORMATS.include?(attachment.content_type) ? STYLES : {}
  end

  def to_default_image
    default = "default-document.jpg"
    matches = Regexp.new(/\.(doc|pdf|ppt|xls)/).match(self.attachment_file_name)
    default = "default-#{matches[1]}.png" if matches
    "ffcrm_attachments/#{default}"
  end

  def is_image?
    ATTACHMENT_FORMATS.include?(attachment.content_type)
  end

  ActiveSupport.run_load_hooks(:fat_free_crm_attachment, self)
end
