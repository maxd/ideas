module Ideas

  module Helpers

    def self.context_eval(context, *args)
      options = args.last.is_a?(Hash) ? args.pop : {}

      if options[:string]
        context.instance_eval(options[:string], options[:name] || '(eval)')

      elsif options[:proc]
        context.instance_eval(&options[:proc])

      end
    end

  end

end