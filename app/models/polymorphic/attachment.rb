# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

class Attachment < ActiveRecord::Base

  belongs_to :user
  belongs_to :entity, :polymorphic => true

  has_attached_file :attachment, :url => "/attachments/:id/:filename"

  ActiveSupport.run_load_hooks(:fat_free_crm_attachment, self)
end