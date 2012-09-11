module Ideas::Scopes

  class FeatureScope

    def initialize(feature)
      @feature = feature
    end

    def description(value)
      @feature.description = value
    end

  end

end