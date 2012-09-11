module Ideas::Models

  class Idea

    STATES = [:new, :described, :prototype, :completed, :empty, :hard_to_implement, :dead]
    VISIBILITIES = [:private, :public, :sticky]

    attr_accessor :title
    attr_accessor :short_description
    attr_accessor :description
    attr_accessor :state
    attr_accessor :tags
    attr_accessor :visibility

    attr_reader :features

    def initialize(title)
      raise ArgumentError, 'title can\'t be nil' if title.nil?
      raise ArgumentError, 'title can\'t be empty' if title.empty?

      @title = title
      @state = :new
      @visibility = [ :private ]
      @features = []
    end

    def state=(value)
      raise ArgumentError, "unknown state #{value}" unless STATES.include?(value)
      @state = value
    end

    def visibility=(value)
      value = [ value ] unless value.is_a? Array

      value.each {|v| raise ArgumentError, "unknown visibility #{v}" unless VISIBILITIES.include?(v) }
      raise ArgumentError, 'impossible to set :public and :private visibility together' if value.include?(:public) and value.include?(:private)

      @visibility = value
    end

    def add_feature(feature)
      @features << feature
    end

  end

end