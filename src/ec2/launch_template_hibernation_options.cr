private alias Core = Amazonite::Core

module Amazonite::EC2
  # Indicates whether an instance is configured for hibernation.
  class LaunchTemplateHibernationOptions
    # If this parameter is set to `true`, the instance is enabled for hibernation; otherwise, it is
    # not enabled for hibernation.
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
        configured: Core::XMLValue.bool(node.xpath_node("*[local-name()='configured']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@configured)
  end
end
