module FfcrmAttachments
  class Engine < ::Rails::Engine

 	config.to_prepare do

		require "polymorphic/attachment"

 		ActiveSupport.on_load(:fat_free_crm_attachment) do

 			ENTITIES.each do |entity| 
	 			entity.constantize.class_eval do

	 				has_many :attachments

	 			end
 			end

 		end

 	end
  end
end
