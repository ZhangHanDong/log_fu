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

    class Rails::MongoidModelGenerator < Rails::Generators::NamedBase
      def create_mongoid_model_file
        create_file "app/models/#{file_name}.rb", <<-FILE
        class #{class_name}
          include LogFu::LogGeneral::MongoIdModels
          # you need add logged it method
          # example:
          # define_logged_it_methods :subject
          # TODO
        end
        FILE
      end
    end

  end
end