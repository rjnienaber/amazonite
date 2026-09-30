private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the state of a CIDR block.
  class SubnetCidrBlockState
    # The state of a CIDR block.
    property state : SubnetCidrBlockStateCode | Nil

    # A message about the status of the CIDR block, if applicable.
    property status_message : String | Nil

    def initialize(
      @state : SubnetCidrBlockStateCode | Nil = nil,
      @status_message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SubnetCidrBlockStateCode.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state, @status_message)
  end
end
