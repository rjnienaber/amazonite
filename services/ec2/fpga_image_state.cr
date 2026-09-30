private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the state of the bitstream generation process for an Amazon FPGA image (AFI).
  class FpgaImageState
    # The state. The following are the possible values:
    #
    # - `pending` - AFI bitstream generation is in progress.
    #
    # - `available` - The AFI is available for use.
    #
    # - `failed` - AFI bitstream generation failed.
    #
    # - `unavailable` - The AFI is no longer available for use.
    property code : FpgaImageStateCode | Nil

    # If the state is `failed`, this is the error message.
    property message : String | Nil

    def initialize(
      @code : FpgaImageStateCode | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value.to_json_object_key}
      end

      if value = @message
        params << {"#{prefix}Message", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: (n = node.xpath_node("*[local-name()='code']")) ? AEC::FpgaImageStateCode.from_json_object_key?(n.content) : nil,
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @message)
  end
end
