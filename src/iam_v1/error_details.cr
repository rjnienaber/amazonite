private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ErrorDetails
    property message : String

    property code : String

    def initialize(
      @message : String,
      @code : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Message", @message}

      params << {"#{prefix}Code", @code}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='Message']")).not_nil!,
        code: Core::XMLValue.string(node.xpath_node("*[local-name()='Code']")).not_nil!,
      )
    end
  end
end
