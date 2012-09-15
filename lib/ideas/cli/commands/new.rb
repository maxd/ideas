usage 'new [options]'
aliases :new, :n
summary 'create new idea'

module Ideas::CLI::Commands

  class New < Cri::CommandRunner

    include Ideas::CLI::Helpers

    def run
      project_dir = detect_project_directory
      abort '[warn] Can\'t find project directory' if project_dir.nil?

      ideas_dir = File.join(project_dir, 'ideas')
      idea_file = nil

      1.upto(9999) do |i|
        idea_file = File.join(ideas_dir, '%04d_idea.rb' % [i])
        break unless File.exists?(idea_file)
      end

      abort 'Can\'t find empty name for new idea' if File.exists?(idea_file)

      create_file_from_template 'idea.erb', idea_file
    end

  end

end

runner Ideas::CLI::Commands::New