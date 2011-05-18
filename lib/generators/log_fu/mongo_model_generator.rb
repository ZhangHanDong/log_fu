require 'rails/generators'

module LogFu
  module Generators

    class MongoModelGenerator < Rails::Generators::NamedBase
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