private alias Core = Amazonite::Core

module Amazonite::EC2
  # The last error that occurred for a VPC endpoint.
  class LastError
    # The error message for the VPC endpoint error.
    property message : String | Nil

    # The error code for the VPC endpoint error.
    property code : String | Nil

    def initialize(
      @message : String | Nil = nil,
      @code : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @message
        params << {"#{prefix}Message", value}
      end

      if value = @code
        params << {"#{prefix}Code", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
        code: Core::XMLValue.string(node.xpath_node("*[local-name()='code']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@message, @code)
  end
end
