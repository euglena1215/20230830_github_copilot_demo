module MyActiveModel
  module Model
    extend ActiveSupport::Concern

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def valid?
      self.class.attributes.each do |name, options|
        value = send(name)
        return false unless valid_type?(value, options[:type])
      end

      true
    end

    def to_h
      hash = {}
      self.class.attributes.each do |name, _|
        hash[name] = send(name)
      end
      hash
    end

    private

    def valid_type?(value, type)
      case type
      when :string
        value.is_a?(String)
      when :integer
        value.is_a?(Integer)
      when :float
        value.is_a?(Float)
      when :boolean
        value.is_a?(TrueClass) || value.is_a?(FalseClass)
      end
    end

    module ClassMethods
      def attribute(name, type)
        @attributes ||= {}
        @attributes[name] = { type: type }

        class_eval do
          attr_accessor name
        end
      end

      def attributes
        @attributes || {}
      end
    end
  end
end
