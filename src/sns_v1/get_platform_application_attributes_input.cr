private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for `GetPlatformApplicationAttributes` action.
  class GetPlatformApplicationAttributesInput
    # `PlatformApplicationArn` for GetPlatformApplicationAttributesInput.
    property platform_application_arn : String

    def initialize(
      @platform_application_arn : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PlatformApplicationArn", @platform_application_arn}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        platform_application_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PlatformApplicationArn']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@platform_application_arn)
  end
end
