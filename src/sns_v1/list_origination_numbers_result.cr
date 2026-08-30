private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class ListOriginationNumbersResult
    # A `NextToken` string is returned when you call the `ListOriginationNumbers` operation if
    # additional pages of records are available.
    property next_token : String | Nil

    # A list of the calling account's verified and pending origination numbers.
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

    def validate! : Nil
      if value = @phone_numbers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @phone_numbers)
  end
end
