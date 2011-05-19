require 'active_support/secure_random'

module Sunrise
  module FileUpload
    autoload :QqFile, 'sunrise/file_upload/qq_file'
    autoload :Manager, 'sunrise/file_upload/manager'
    autoload :Request, 'sunrise/file_upload/request'
    autoload :ActiveRecord, 'sunrise/file_upload/active_record'
    autoload :Callbacks, 'sunrise/file_upload/callbacks'
    
    autoload :ViewHelper, 'sunrise/file_upload/view_helper'
    autoload :FormBuilder, 'sunrise/file_upload/form_builder'
    
    def self.guid
      ActiveSupport::SecureRandom.base64(15).tr('+/=', 'xyz').slice(0, 10)
    end
  end
end

require 'sunrise/file_upload/engine'
