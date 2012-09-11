module Ideas::Scopes

  class IdeaScope

    def initialize(idea)
      @idea = idea
    end

    def short_description(value)
      @idea.short_description = value
    end

    def description(value)
      @idea.description = value
    end

    def state(value)
      @idea.state = value
    end

    def tags(*value)
      @idea.tags = value
    end

    def visibility(*value)
      @idea.visibility = value
    end

    def feature(weight, title, &block)
      feature = Ideas::Models::Feature.new(weight, title)

      feature_scope = FeatureScope.new(feature)
      Ideas::Helpers::context_eval(feature_scope, proc: block)

      @idea.add_feature(feature)
    end

  end

end