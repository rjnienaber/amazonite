private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class MoveAddressToVpcResult
    # The allocation ID for the Elastic IP address.
    property allocation_id : String | Nil

    # The status of the move of the IP address.
    property status : Status | Nil

    def initialize(
      @allocation_id : String | Nil = nil,
      @status : Status | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationId']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::Status.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @status)
  end
end
