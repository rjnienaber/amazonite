private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class ListPhoneNumbersOptedOutResponse
    property phone_numbers : Array(String) | Nil

    property next_token : String | Nil

    def initialize(
      @phone_numbers : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@phone_numbers || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}phoneNumbers.member.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}nextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        phone_numbers: node.xpath_nodes("*[local-name()='phoneNumbers']/*[local-name()='member']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end
  end
end
