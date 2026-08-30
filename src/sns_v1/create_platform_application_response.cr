private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Response from CreatePlatformApplication action.
  class CreatePlatformApplicationResponse
    # `PlatformApplicationArn` is returned.
    property platform_application_arn : String | Nil

    def initialize(
      @platform_application_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @platform_application_arn
        params << {"#{prefix}PlatformApplicationArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        platform_application_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PlatformApplicationArn']")),
      )
    end

    def_equals_and_hash(@platform_application_arn)
  end
end
