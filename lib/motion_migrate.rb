require 'motion-require'

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  app.frameworks += ['CoreData'] unless app.frameworks.include?("CoreData")
end

Motion::Require.all(Dir.glob(File.expand_path('../motion_migrate/motion_model/**/*.rb', __FILE__)) + 
                    Dir.glob(File.expand_path('../motion_migrate/model.rb', __FILE__)))

module MotionMigrate
end

# Include rake files
Dir.glob(File.join(File.dirname(__FILE__), "tasks/**/*.rake")) do |task|
  import task
end
