private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # The endpoint for mobile app and device.
  class Endpoint
    # The `EndpointArn` for mobile app and device.
    property endpoint_arn : String | Nil

    # Attributes for endpoint.
    property attributes : Hash(String, String) | Nil

    def initialize(
      @endpoint_arn : String | Nil = nil,
      @attributes : Hash(String, String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @endpoint_arn
        params << {"#{prefix}EndpointArn", value}
      end

      (@attributes || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Attributes.entry.#{i}.key", key}
        params << {"#{prefix}Attributes.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        endpoint_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='EndpointArn']")),
        attributes: node.xpath_nodes("*[local-name()='Attributes']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end
  end
end
