require 'fileutils'
require 'erb'
require 'ostruct'

module Ideas
  module CLI
    module Helpers

      def create_dir(dir, warn = true)
        if File.exists?(dir)
          puts "[warn] directory #{dir} exists" if warn
        else
          FileUtils.mkdir_p(dir)
          puts "[info] create directory #{dir}"
        end
      end

      def create_file(template, file, options = {})
        result = ERB.new(template).result(OpenStruct.new(options).instance_eval { binding })
        File.write(file, result)
        puts "[info] create file #{file}"
      end

      def create_file_from_template(template_file, file, options = {})
        templates_dir = File.expand_path('../commands/templates', __FILE__)
        template = File.read(File.join(templates_dir, template_file))
        create_file(template, file, options)
      end

      def detect_project_directory(current_directory = Dir.pwd)
        return current_directory if File.exists?(File.join(current_directory, 'Ideafile'))
        return nil if File.dirname(current_directory) == current_directory
        detect_project_directory(File.dirname(current_directory))
      end

    end
  end
end