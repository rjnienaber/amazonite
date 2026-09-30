private alias Core = Amazonite::Core

module Amazonite::EC2
  # The service provider that manages the resource.
  class OperatorRequest
    # The service provider that manages the resource.
    property principal : String | Nil

    def initialize(
      @principal : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @principal
        params << {"#{prefix}Principal", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        principal: Core::XMLValue.string(node.xpath_node("*[local-name()='Principal']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@principal)
  end
end
