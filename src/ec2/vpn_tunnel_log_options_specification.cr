private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for logging VPN tunnel activity.
  class VpnTunnelLogOptionsSpecification
    # Options for sending VPN tunnel logs to CloudWatch.
    property cloud_watch_log_options : CloudWatchLogOptionsSpecification | Nil

    def initialize(
      @cloud_watch_log_options : CloudWatchLogOptionsSpecification | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cloud_watch_log_options
        params.concat(value.to_query_params("#{prefix}CloudWatchLogOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cloud_watch_log_options: node.xpath_node("*[local-name()='CloudWatchLogOptions']").try { |n| CloudWatchLogOptionsSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @cloud_watch_log_options
        value.validate!
      end
    end

    def_equals_and_hash(@cloud_watch_log_options)
  end
end
