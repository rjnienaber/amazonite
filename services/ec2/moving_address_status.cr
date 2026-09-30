private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # This action is deprecated.
  #
  # Describes the status of a moving Elastic IP address.
  class MovingAddressStatus
    # The status of the Elastic IP address that's being moved or restored.
    property move_status : MoveStatus | Nil

    # The Elastic IP address.
    property public_ip : String | Nil

    def initialize(
      @move_status : MoveStatus | Nil = nil,
      @public_ip : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @move_status
        params << {"#{prefix}MoveStatus", value.to_json_object_key}
      end

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        move_status: (n = node.xpath_node("*[local-name()='moveStatus']")) ? AEC::MoveStatus.from_json_object_key?(n.content) : nil,
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='publicIp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@move_status, @public_ip)
  end
end
