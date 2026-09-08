private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for CloudWatch Logs as a logging destination.
  class VerifiedAccessLogCloudWatchLogsDestination
    # Indicates whether logging is enabled.
    property enabled : Bool | Nil

    # The delivery status for access logs.
    property delivery_status : VerifiedAccessLogDeliveryStatus | Nil

    # The ID of the CloudWatch Logs log group.
    property log_group : String | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @delivery_status : VerifiedAccessLogDeliveryStatus | Nil = nil,
      @log_group : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end

      if value = @delivery_status
        params.concat(value.to_query_params("#{prefix}DeliveryStatus."))
      end

      if value = @log_group
        params << {"#{prefix}LogGroup", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='enabled']")),
        delivery_status: node.xpath_node("*[local-name()='deliveryStatus']").try { |n| VerifiedAccessLogDeliveryStatus.from_xml(n) },
        log_group: Core::XMLValue.string(node.xpath_node("*[local-name()='logGroup']")),
      )
    end

    def validate! : Nil
      if value = @delivery_status
        value.validate!
      end
    end

    def_equals_and_hash(@enabled, @delivery_status, @log_group)
  end
end
