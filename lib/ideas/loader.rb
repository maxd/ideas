module Ideas

  class Loader
    attr_reader :ideas

    def initialize
      @root_scope = Scopes::RootScope.new
    end

    def load(*args, &block)
      options = args.last.is_a?(Hash) ? args.pop : {}

      if block
        raise ArgumentError, "loading a block requires 0 arguments" unless options.empty? && args.empty?
        result = load(proc: block)

      elsif args.any?
        result = []
        args.each { |arg| result << load(options.merge(file: arg)) }
        result = result.first if result.length == 1

      elsif options[:file]
        result = load(string: File.read(options[:file]), name: options[:file])

      else
        Ideas::Helpers::context_eval(@root_scope, options)

        result = @root_scope.context
      end

      result
    end

  end

end