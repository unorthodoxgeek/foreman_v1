module ForemanV1
  class Engine < ::Rails::Engine
    engine_name 'foreman_v1'

    initializer 'foreman_v1.register_plugin', :before => :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_v1 do
        requires_foreman '>= 1.4'
      end
    end

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        ForemanV1::Engine.load_seed
      end
    end
  end
end
