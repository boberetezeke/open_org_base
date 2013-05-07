module OpenOrgBase
  class Engine < ::Rails::Engine
    isolate_namespace OpenOrgBase
    config.autoload_paths << File.expand_path("lib/open_org_base")
  end
end
