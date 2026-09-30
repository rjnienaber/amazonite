private alias Core = Amazonite::Core

module Amazonite::Sns
  # The response from the `ListPhoneNumbersOptedOut` action.
  class ListPhoneNumbersOptedOutResponse
    # A list of phone numbers that are opted out of receiving SMS messages. The list is paginated, and
    # each page can contain up to 100 phone numbers.
    property phone_numbers : Array(String) | Nil

    # A `NextToken` string is returned when you call the `ListPhoneNumbersOptedOut` action if
    # additional records are available after the first page of results.
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

    def validate! : Nil
    end

    def_equals_and_hash(@phone_numbers, @next_token)
  end
end
