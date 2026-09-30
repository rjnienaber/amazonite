private alias Core = Amazonite::Core

module Amazonite::Sns
  # Input for `SetEndpointAttributes` action.
  class SetEndpointAttributesInput
    # EndpointArn used for `SetEndpointAttributes` action.
    property endpoint_arn : String

    # A map of the endpoint attributes. Attributes in this map include the following:
    #
    # - `CustomUserData` – arbitrary user data to associate with the endpoint. Amazon SNS does not use
    # this data. The data must be in UTF-8 format and less than 2KB.
    #
    # - `Enabled` – flag that enables/disables delivery to the endpoint. Amazon SNS will set this to
    # false when a notification service indicates to Amazon SNS that the endpoint is invalid. Users
    # can set it back to true, typically after updating Token.
    #
    # - `Token` – device token, also referred to as a registration id, for an app and mobile device.
    # This is returned from the notification service when an app and mobile device are registered with
    # the notification service.
    property attributes : Hash(String, String)

    def initialize(
      @endpoint_arn : String,
      @attributes : Hash(String, String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}EndpointArn", @endpoint_arn}

      @attributes.each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Attributes.entry.#{i}.key", key}
        params << {"#{prefix}Attributes.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        endpoint_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='EndpointArn']")).not_nil!,
        attributes: node.xpath_nodes("*[local-name()='Attributes']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@endpoint_arn, @attributes)
  end
end
