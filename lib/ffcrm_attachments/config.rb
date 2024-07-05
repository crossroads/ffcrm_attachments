module FfcrmAttachments
  class Config

    # Set attachment limit to 20MB if config/settings.default.yml isn't set
    def self.attachment_size
      Setting.attachment_size || 20.megabytes
    end

  end
end
