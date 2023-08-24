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
        define_method(name) do
          instance_variable_get("@#{name}")
        end

        define_method("#{name}=") do |val|
          instance_variable_set("@#{name}", val)
        end
      end
    end
  end
end
