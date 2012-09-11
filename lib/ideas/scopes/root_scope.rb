module Ideas::Scopes

  class RootScope

    attr_reader :context

    def idea(title, &block)
      idea = Ideas::Models::Idea.new(title)

      idea_scope = IdeaScope.new(idea)
      Ideas::Helpers::context_eval(idea_scope, proc: block)

      @context = idea
    end

  end

end