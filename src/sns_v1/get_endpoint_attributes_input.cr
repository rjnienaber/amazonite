private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for `GetEndpointAttributes` action.
  class GetEndpointAttributesInput
    # `EndpointArn` for `GetEndpointAttributes` input.
    property endpoint_arn : String

    def initialize(
      @endpoint_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}EndpointArn", @endpoint_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        endpoint_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='EndpointArn']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@endpoint_arn)
  end
end
