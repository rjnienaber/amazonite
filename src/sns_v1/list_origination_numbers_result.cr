private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class ListOriginationNumbersResult
    property next_token : String | Nil

    property phone_numbers : Array(PhoneNumberInformation) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @phone_numbers : Array(PhoneNumberInformation) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@phone_numbers || [] of PhoneNumberInformation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PhoneNumbers.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        phone_numbers: node.xpath_nodes("*[local-name()='PhoneNumbers']/*[local-name()='member']").map { |n| PhoneNumberInformation.from_xml(n) },
      )
    end
  end
end
