require 'bundler/setup'

require 'active_record'

require 'rake/testtask'

# test task

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

# hack to make it works with sqlite3
# maybe it should be in lib directory?
module Rails
    def self.root
        File.dirname(__FILE__)
    end

    def self.env
        ENV['ENVIRONMENT'] || "development"
    end
end


include ActiveRecord::Tasks

class Seeder
  def initialize(seed_file)
    @seed_file = seed_file
  end

  def load_seed
    raise "Seed file '#{@seed_file}' does not exist" unless File.file?(@seed_file)
    load @seed_file
  end
end


db_dir = File.expand_path('../db', __FILE__)
config_dir = File.expand_path('../config', __FILE__)

root = File.expand_path '..', __FILE__
#DatabaseTasks.env = ENV['ENV'] || 'development'
DatabaseTasks.db_dir = db_dir
DatabaseTasks.database_configuration = YAML.load(File.read(File.join(config_dir, 'database.yml')))
DatabaseTasks.migrations_paths = File.join(db_dir, 'migrate')
DatabaseTasks.seed_loader = Seeder.new File.join root, 'db/seeds.rb'
DatabaseTasks.root = root

task :environment do
    ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
    ActiveRecord::Base.establish_connection(Rails::env.to_sym)
end

task :build do
  sh "jrubyfx-jarify --main bin/urna.rb --name 'Urna Eletronica' urna"
end

load 'active_record/railties/databases.rake'
