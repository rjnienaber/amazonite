private alias Core = Amazonite::Core

module Amazonite::EC2
  # The current status of Client Route Enforcement.
  class ClientRouteEnforcementResponseOptions
    # Status of the client route enforcement feature, indicating whether Client Route Enforcement is
    # `true` (enabled) or `false` (disabled).
    #
    # Valid values: `true | false`
    #
    # Default value: `false`
    property enforced : Bool | Nil

    def initialize(
      @enforced : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enforced
        params << {"#{prefix}Enforced", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enforced: Core::XMLValue.bool(node.xpath_node("*[local-name()='enforced']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enforced)
  end
end
