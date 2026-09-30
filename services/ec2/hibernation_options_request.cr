private alias Core = Amazonite::Core

module Amazonite::EC2
  # Indicates whether your instance is configured for hibernation. This parameter is valid only if
  # the instance meets the [hibernation
  # prerequisites](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hibernating-prerequisites.html).
  # For more information, see [Hibernate your Amazon EC2
  # instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html) in the *Amazon EC2
  # User Guide*.
  class HibernationOptionsRequest
    # Set to `true` to enable your instance for hibernation.
    #
    # For Spot Instances, if you set `Configured` to `true`, either omit the
    # `InstanceInterruptionBehavior` parameter (for [ `SpotMarketOptions`
    # ](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SpotMarketOptions.html)), or set it
    # to `hibernate`. When `Configured` is true:
    #
    # - If you omit `InstanceInterruptionBehavior`, it defaults to `hibernate`.
    #
    # - If you set `InstanceInterruptionBehavior` to a value other than `hibernate`, you'll get an
    # error.
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
