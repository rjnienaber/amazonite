private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes Amazon Kinesis Data Firehose logging options.
  class VerifiedAccessLogKinesisDataFirehoseDestinationOptions
    # Indicates whether logging is enabled.
    property enabled : Bool

    # The ID of the delivery stream.
    property delivery_stream : String | Nil

    def initialize(
      @enabled : Bool,
      @delivery_stream : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Enabled", Core::QueryValue.bool(@enabled)}

      if value = @delivery_stream
        params << {"#{prefix}DeliveryStream", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")).not_nil!,
        delivery_stream: Core::XMLValue.string(node.xpath_node("*[local-name()='DeliveryStream']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled, @delivery_stream)
  end
end
