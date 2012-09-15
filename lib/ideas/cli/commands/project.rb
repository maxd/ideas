usage 'project [options] path'
aliases :project, :p
summary 'create new project'

module Ideas::CLI::Commands

  class Project < Cri::CommandRunner

    include Ideas::CLI::Helpers

    def run
      project_dir = arguments.first

      abort "Please specify the directory for project, e.g. `ideas project .'" if project_dir.nil?
      abort "Too many arguments; please specify only the directory for project." if arguments.length > 1
      abort "`#{project_dir}' is not a directory." if File.exists?(project_dir) && !File.directory?(project_dir)

      generate_project(project_dir)
    end

  private

    def generate_project(project_dir)
      create_dir(project_dir, false)

      puts "[info] use directory #{project_dir}"

      create_file '', File.join(project_dir, 'Ideafile')

      ideas_dir = File.join(project_dir, 'ideas')

      create_dir(ideas_dir)

      create_file_from_template 'idea.erb', File.join(ideas_dir, '0001_idea.rb'), {
        title: 'My first idea',
        short_description: 'Just my idea',
        description: 'This is my first idea. I like it.',
        state: :new,
        tags: [:first_idea, :my_idea],
        features: [
          {
              weight: 1000,
              title: 'Discuss idea with friends'
          },
          {
              weight: 1000,
              title: 'Publish idea in blog'
          },
          {
              weight: 900,
              title: 'Realize idea use Ruby'
          }
        ]
      }
    end

  end

end

runner Ideas::CLI::Commands::Project