private alias Core = Amazonite::Core

module Amazonite::EC2
  # The status of an updated pointer (PTR) record for an Elastic IP address.
  class PtrUpdateStatus
    # The value for the PTR record update.
    property value : String | Nil

    # The status of the PTR record update.
    property status : String | Nil

    # The reason for the PTR record update.
    property reason : String | Nil

    def initialize(
      @value : String | Nil = nil,
      @status : String | Nil = nil,
      @reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @value
        params << {"#{prefix}Value", value}
      end

      if value = @status
        params << {"#{prefix}Status", value}
      end

      if value = @reason
        params << {"#{prefix}Reason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='value']")),
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='status']")),
        reason: Core::XMLValue.string(node.xpath_node("*[local-name()='reason']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@value, @status, @reason)
  end
end
