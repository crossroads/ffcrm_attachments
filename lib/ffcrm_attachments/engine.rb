module FfcrmAttachments
  class Engine < ::Rails::Engine

    config.to_prepare do
      # require "polymorphic/attachment"
      require "ffcrm_attachments/config"

      # view hooks
      require "ffcrm_attachments/attachment_hook"

      # add attachments to Contacts, Accounts etc
      ENTITIES.each do |entity|
        entity.safe_constantize.class_eval do
          has_many_attached :attachments, dependent: :destroy
          validate :attachment_file_sizes

          def attachment_file_sizes
            unless attachments.collect{|f| f.blob.byte_size < FfcrmAttachments::Config.attachment_size}.all?
              errors.add(:attachments, "File size is too big. Max size (per file): #{ActiveSupport::NumberHelper.number_to_human_size(FfcrmAttachments::Config.attachment_size)}")
            end
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
