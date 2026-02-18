# see https://github.com/amatsuda/kaminari/blob/master/lib/kaminari/config.rb
module Adhoq
  class Configuration
    attr_accessor :storage, :base_controller, :authorization, :authorization_failure_action,
                  :current_user, :database_connection, :hidden_model_names, :hide_rows_count,
                  :async_execution, :job_queue_name

    def initialize
      @storage = [:on_the_fly]
      @base_controller = 'ApplicationController'
    end

    def callablize(name)
      c = send(name)
      if c.respond_to?(:call)
        c
      else
        c.to_proc
      end
    end

    def async_execution?
      defined?(ActiveJob) && Adhoq.config.async_execution
    end
  end
end
