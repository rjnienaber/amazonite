private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for logging VPN tunnel activity.
  class VpnTunnelLogOptions
    # Options for sending VPN tunnel logs to CloudWatch.
    property cloud_watch_log_options : CloudWatchLogOptions | Nil

    def initialize(
      @cloud_watch_log_options : CloudWatchLogOptions | Nil = nil,
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
        cloud_watch_log_options: node.xpath_node("*[local-name()='cloudWatchLogOptions']").try { |n| CloudWatchLogOptions.from_xml(n) },
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
