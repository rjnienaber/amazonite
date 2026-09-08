private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a license configuration.
  class LicenseConfigurationRequest
    # The Amazon Resource Name (ARN) of the license configuration.
    property license_configuration_arn : String | Nil

    def initialize(
      @license_configuration_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @license_configuration_arn
        params << {"#{prefix}LicenseConfigurationArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        license_configuration_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='LicenseConfigurationArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@license_configuration_arn)
  end
end
