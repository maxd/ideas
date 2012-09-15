module Ideas

  class RootScope

    attr_reader :context

    def idea(title, &block)
      idea = Idea.new(title)

      idea_scope = IdeaScope.new(idea)
      Helpers::context_eval(idea_scope, proc: block)

      @context = idea
    end

  end

end