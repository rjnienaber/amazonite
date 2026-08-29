private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class CreateEndpointResponse
    property endpoint_arn : String | Nil

    def initialize(
      @endpoint_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @endpoint_arn
        params << {"#{prefix}EndpointArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        endpoint_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='EndpointArn']")),
      )
    end
  end
end
