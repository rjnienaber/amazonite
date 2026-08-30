private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for `ListEndpointsByPlatformApplication` action.
  class ListEndpointsByPlatformApplicationInput
    # `PlatformApplicationArn` for `ListEndpointsByPlatformApplicationInput` action.
    property platform_application_arn : String

    # `NextToken` string is used when calling `ListEndpointsByPlatformApplication` action to retrieve
    # additional records that are available after the first page results.
    property next_token : String | Nil

    def initialize(
      @platform_application_arn : String,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PlatformApplicationArn", @platform_application_arn}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        platform_application_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PlatformApplicationArn']")).not_nil!,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def_equals_and_hash(@platform_application_arn, @next_token)
  end
end
