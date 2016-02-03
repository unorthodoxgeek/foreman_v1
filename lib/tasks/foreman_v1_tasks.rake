# Tests
namespace :test do
  desc 'Test ForemanV1'
  Rake::TestTask.new(:foreman_v1) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ['test', test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
  end
end

namespace :foreman_v1 do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_foreman_plugin_template) do |task|
        task.patterns = ["#{ForemanV1::Engine.root}/app/**/*.rb",
                         "#{ForemanV1::Engine.root}/lib/**/*.rb",
                         "#{ForemanV1::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_foreman_plugin_template'].invoke
  end
end

Rake::Task[:test].enhance do
  Rake::Task['test:foreman_v1'].invoke
end

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance do
    Rake::Task['test:foreman_v1'].invoke
    Rake::Task['foreman_v1:rubocop'].invoke
  end
end
