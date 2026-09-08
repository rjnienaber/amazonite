private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for Kinesis as a logging destination.
  class VerifiedAccessLogKinesisDataFirehoseDestination
    # Indicates whether logging is enabled.
    property enabled : Bool | Nil

    # The delivery status.
    property delivery_status : VerifiedAccessLogDeliveryStatus | Nil

    # The ID of the delivery stream.
    property delivery_stream : String | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @delivery_status : VerifiedAccessLogDeliveryStatus | Nil = nil,
      @delivery_stream : String | Nil = nil,
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

      if value = @delivery_stream
        params << {"#{prefix}DeliveryStream", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='enabled']")),
        delivery_status: node.xpath_node("*[local-name()='deliveryStatus']").try { |n| VerifiedAccessLogDeliveryStatus.from_xml(n) },
        delivery_stream: Core::XMLValue.string(node.xpath_node("*[local-name()='deliveryStream']")),
      )
    end

    def validate! : Nil
      if value = @delivery_status
        value.validate!
      end
    end

    def_equals_and_hash(@enabled, @delivery_status, @delivery_stream)
  end
end
