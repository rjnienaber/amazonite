private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class CheckIfPhoneNumberIsOptedOutResponse
    property is_opted_out : Bool | Nil

    def initialize(
      @is_opted_out : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @is_opted_out
        params << {"#{prefix}isOptedOut", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_opted_out: Core::XMLValue.bool(node.xpath_node("*[local-name()='isOptedOut']")),
      )
    end
  end
end
