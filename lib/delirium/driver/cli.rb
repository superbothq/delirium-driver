module Delirium
  module Driver
    module Cli
      def self.run!
        RootCommand.run!
      end
    end
  end
end

require_relative "cli/root_command"
