private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class ListPhoneNumbersOptedOutInput
    property next_token : String | Nil

    def initialize(
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}nextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end
  end
end
