usage 'ideas command [options] [arguments]'

opt :h, :help, 'show the help message and quit' do |value, cmd|
  puts cmd.help
  exit 0
end

opt :v, :version, 'show version information and quit' do
  puts "Version #{Ideas::VERSION}"
  exit 0
end

run do |opts, args, cmd|
  puts cmd.help
  exit 0
end