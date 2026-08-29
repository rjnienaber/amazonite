private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetSessionTokenRequest
    property duration_seconds : Int32 | Nil

    property serial_number : String | Nil

    property token_code : String | Nil

    def initialize(
      @duration_seconds : Int32 | Nil = nil,
      @serial_number : String | Nil = nil,
      @token_code : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      if value = @serial_number
        params << {"#{prefix}SerialNumber", value}
      end

      if value = @token_code
        params << {"#{prefix}TokenCode", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")),
        token_code: Core::XMLValue.string(node.xpath_node("*[local-name()='TokenCode']")),
      )
    end
  end
end
