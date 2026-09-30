private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the current state of an instance.
  class InstanceState
    # The state of the instance as a 16-bit unsigned integer.
    #
    # The high byte is all of the bits between 2^8 and (2^16)-1, which equals decimal values between
    # 256 and 65,535. These numerical values are used for internal purposes and should be ignored.
    #
    # The low byte is all of the bits between 2^0 and (2^8)-1, which equals decimal values between 0
    # and 255.
    #
    # The valid values for instance-state-code will all be in the range of the low byte and they are:
    #
    # - `0` : `pending`
    #
    # - `16` : `running`
    #
    # - `32` : `shutting-down`
    #
    # - `48` : `terminated`
    #
    # - `64` : `stopping`
    #
    # - `80` : `stopped`
    #
    # You can ignore the high byte value by zeroing out all of the bits above 2^8 or 256 in decimal.
    property code : Int32 | Nil

    # The current state of the instance.
    property name : InstanceStateName | Nil

    def initialize(
      @code : Int32 | Nil = nil,
      @name : InstanceStateName | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value.to_s}
      end

      if value = @name
        params << {"#{prefix}Name", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: Core::XMLValue.i32(node.xpath_node("*[local-name()='code']")),
        name: (n = node.xpath_node("*[local-name()='name']")) ? AEC::InstanceStateName.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @name)
  end
end
