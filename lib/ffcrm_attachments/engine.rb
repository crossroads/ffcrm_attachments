module FfcrmAttachments
  class Engine < ::Rails::Engine

    config.to_prepare do
      require "polymorphic/attachment"

      # view hooks
      require "ffcrm_attachments/attachment_hook"

      # Set attachment limit to 20MB if config/settings.default.yml isn't set
      Setting.attachment_size ||= 20.megabytes

      # add attachments to Contacts, Accounts etc
      ENTITIES.each do |entity|
        entity.safe_constantize.class_eval do
          has_many_attached :attachments, dependent: :destroy
          validate :attachment_file_sizes

          def attachment_file_sizes
            # TODO Size
            unless attachments.collect{|f| f.blob.byte_size < Setting.attachment_size}.all?
              errors.add(:attachments, 'file size is too big')
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
