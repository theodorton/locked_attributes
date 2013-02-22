module LockedAttributes
  extend ActiveSupport::Concern

  included do
    validate :validate_locked_attributes, unless: :new_record?
    cattr_accessor :locked_attributes
  end

  module ClassMethods
    def lock_attributes(*args)
      self.locked_attributes = args.map(&:to_s)
    end
  end

  module InstanceMethods
    def locked_attributes
      self.class.locked_attributes || []
    end

    def validate_locked_attributes
      for attribute in locked_and_changed_attributes
        errors.add(attribute, :locked)
      end
    end

    private

    def locked_and_changed_attributes
      changed & locked_attributes
    end
  end
end
