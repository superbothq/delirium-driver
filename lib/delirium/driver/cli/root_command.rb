require "sinatra/base"

module Delirium
  module Driver
    module Cli
      class RootCommand
        def self.run!
          s = Sinatra.new
          s.set :bind, "0.0.0.0"
          s.set :port, "9516"

          s.set :delirium_driver, Delirium::Platform.class_for_current_platform.new
          s.set :root, Dir.pwd

          s.post "/:device/:action" do
            device = params.delete "device"
            action = params.delete "action"

            delirium_params = {}
            params.each_pair do |k,v|
              delirium_params[k.to_sym] = v
            end

            s.settings.delirium_driver.do({
              device: device.to_sym,
              action: action.to_sym,
              params: delirium_params
            })
            ""
          end

          s.run!
        end
      end
    end
  end
end
