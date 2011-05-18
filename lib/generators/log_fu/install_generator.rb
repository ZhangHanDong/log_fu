require 'rails/generators'

module LogFu
  module Generators

    class InstallGenerator < Rails::Generators::Base
      
      source_root File.expand_path('../templates', __FILE__)
      desc "Copies mongoid yml files to main project"
      def copy_mongoid_yml_files
        copy_file "../templates/mongoid.yml", "config/mongoid.yml"
      end
    end

  end
end