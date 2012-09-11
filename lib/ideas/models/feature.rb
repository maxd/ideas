module Ideas::Models

  class Feature
    attr_accessor :weight
    attr_accessor :title
    attr_accessor :description

    def initialize(weight, title)
      raise ArgumentError, 'weight must be in rang between 0 and 1000' unless (0..1000).include?(weight)
      raise ArgumentError, 'title can\'t be nil' if title.nil?
      raise ArgumentError, 'title can\'t be empty' if title.empty?

      @weight = weight
      @title = title
    end

  end

end