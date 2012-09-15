require 'cri'

module Ideas::CLI
  class Application

    def initialize
      filename = File.expand_path('../commands/ideas.rb', __FILE__)
      @root_command = load_command_at(filename)
    end

    def run(args)
      load_commands
      @root_command.run(args)
    end

  private

    def load_command_at(filename)
      code = File.read(filename)
      command = Cri::Command.define(code, filename)

      command_name = File.basename(filename, '.rb')
      command.modify { name command_name }

      command
    end

    def load_commands
      command_filenames = Dir[File.expand_path('../commands/*.rb', __FILE__)]
      command_filenames.each do |filename|
        next if File.basename(filename, '.rb') == 'ideas'
        cmd = load_command_at(filename)
        @root_command.add_command(cmd)
      end
    end

  end
end