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

          s.post "/mouse/move" do
            x = params[:x]
            y = params[:y]

            s.settings.delirium_driver.do({
              device: :mouse,
              action: :move,
              params: { x: x, y: y }
            })
          end

          s.post "/keyboard/write" do
            string = params[:string]

            s.settings.delirium_driver.do({
              device: :keyboard,
              action: :write,
              params: { string: string }
            })
          end

          s.run!
        end
      end
    end
  end
end
