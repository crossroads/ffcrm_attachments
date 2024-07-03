module FfcrmAttachments
  class Engine < ::Rails::Engine

    config.to_prepare do
      require "polymorphic/attachment"
      require "ffcrm_attachments/attachment_hook"

      ActiveSupport.on_load(:fat_free_crm_attachment) do

        ENTITIES.each do |entity|
          entity.safe_constantize.class_eval do
            # Paperclip
            # has_many :attachments, as: :entity, dependent: :destroy

            # Active Storage
            has_many_attached :attachments, dependent: :destroy #, allow_destroy: true, reject_if: lambda { |l| l[:attachment].blank? }
            # accepts_nested_attributes_for :attachments
          end
        end

      end
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    initializer :append_migrations do |app|
      unless "#{root}/spec/dummy" == app.root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

  end
end
