module MyActiveModel
  module Model
    extend ActiveSupport::Concern

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    module ClassMethods
      def attribute(name)
        class_eval do
          attr_accessor name
        end
      end
    end
  end
end
