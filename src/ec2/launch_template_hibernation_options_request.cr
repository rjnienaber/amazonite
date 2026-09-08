private alias Core = Amazonite::Core

module Amazonite::EC2
  # Indicates whether the instance is configured for hibernation. This parameter is valid only if
  # the instance meets the [hibernation
  # prerequisites](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hibernating-prerequisites.html).
  class LaunchTemplateHibernationOptionsRequest
    # If you set this parameter to `true`, the instance is enabled for hibernation.
    #
    # Default: `false`
    property configured : Bool | Nil

    def initialize(
      @configured : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @configured
        params << {"#{prefix}Configured", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        configured: Core::XMLValue.bool(node.xpath_node("*[local-name()='Configured']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@configured)
  end
end
