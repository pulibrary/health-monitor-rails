require 'health_monitor/providers/base'
require 'resque'

module HealthMonitor
  module Providers
    class ResqueException < StandardError; end

    class Resque < Base
      def check!
        ::Resque.info
      rescue => e
        raise ResqueException.new(e.message)
      end
    end
  end
end
