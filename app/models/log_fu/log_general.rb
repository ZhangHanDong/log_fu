module LogFu
  module LogGeneral
    module MongoIdModels
      extend ActiveSupport::Concern

      included do
        include Mongoid::Document
        field :resource_type, :type => String
        field :resource_id,   :type => Integer
        field :client_id,     :type => Integer
        field :channel_id,    :type => Integer
        field :ip,            :type => String
        field :uniquely_code, :type => String
        field :status,        :type => String
        field :created_at,    :type => DateTime
      end

      module ClassMethods
        # Usage:
        # In Model:  
        # class SubjectLog
        #   include LogGeneral::MongoIdModels
        #   define_logged_it_methods :subject
        # end
        # 
        # In Controller:
        # class SubjectsController < ApplicationController
        #   def show
        #     @subject = Subject.find params[:id]
        #     SubjectLog.subject_logged_it(request, params)
        #   end
        # end
        # 
        def define_logged_it_methods name
          singleton_class.class_eval do
            define_method("#{name}_logged_it") do |request, params|
              client_key    = params[:client_key] if !params[:client_key].blank?
              resource_type = name.to_s.capitalize
              resource_id   = params[:id] if !params[:id].blank?
              client_id     = Client.find_by_api_key(client_key) if client_key
              channel_id    = params[:channel_id] if !params[:channel_id]
              ip            = request.remote_ip
              uniquely_code = params[:uniquely_code] if !params[:uniquely_code]
              created_at    = Time.now

              create(:resource_type => resource_type, 
              :resource_id   => resource_id,
              :client_id     => client_id,
              :channel_id    => channel_id,
              :ip            => ip,
              :uniquely_code => uniquely_code,
              :status        => 1,
              :created_at    => created_at)
            end
          end
        end
      end#ClassMethods

      module InstanceMethods
        #TODO

      end#module InstanceMethods

    end
  end
end