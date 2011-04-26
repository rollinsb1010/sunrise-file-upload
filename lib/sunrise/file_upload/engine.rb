require 'rails'
require 'sunrise-file-upload'

module Sunrise
  module FileUpload
    class Engine < ::Rails::Engine
      # Initialize Rack file upload
      config.app_middleware.use Sunrise::FileUpload::RawUpload, :paths => "/sunrise/fileupload"
    
      config.before_initialize do
        ActiveSupport.on_load :active_record do
          ::ActiveRecord::Base.send :include, Sunrise::FileUpload::ActiveRecord
        end
        
        ActiveSupport.on_load :action_view do
          ActionView::Base.send :include, Sunrise::FileUpload::ViewHelper
          ActionView::Helpers::FormBuilder.send :include, Sunrise::FileUpload::FormBuilder
        
          ActionView::Helpers::AssetTagHelper.register_javascript_expansion :fileupload => 
            ["fileupload/fileuploader.js", "fileupload/fileuploader-input.js"]
        end
      end
    end
  end
end