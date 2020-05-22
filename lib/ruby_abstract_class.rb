require 'ruby_abstract_class/version'

# Allow a Ruby class to be an abstract class
module RubyAbstractClass
  # :nodoc:
  def self.included(base)
    base.extend(AbstractClassMethods)
  end

  module AbstractClassMethods
    # :nodoc:
    def new
      raise "You cannot instantiate an instance of Abstract Class `#{self}`." if abstract_class?

      super
    end

    # :nodoc:
    def allocate
      raise "You cannot allocate an instance of Abstract Class `#{self}`." if abstract_class?

      super
    end

    # Tells whether a class is abstract
    # # @return [Boolean] true or false
    def abstract_class?
      @abstract_class == self
    end

    # Makes class abstract and comma separated methods passed as symbols
    # abstract_method
    # abstract_method :foo
    # abstract_method :foo, :bar
    def abstract_method(*methods)
      @abstract_class = self

      methods.each do |method|
        define_method method do
          raise NotImplementedError, "You must implement #{self.class}##{__method__}."
        end
      end
    end
  end
end
