private alias Core = Amazonite::Core

module Amazonite::Sns
  class ListSMSSandboxPhoneNumbersResult
    # A list of the calling account's pending and verified phone numbers.
    property phone_numbers : Array(SMSSandboxPhoneNumber) = [] of SMSSandboxPhoneNumber

    # A `NextToken` string is returned when you call the `ListSMSSandboxPhoneNumbersInput` operation
    # if additional pages of records are available.
    property next_token : String | Nil

    def initialize(
      @phone_numbers : Array(SMSSandboxPhoneNumber),
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @phone_numbers.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PhoneNumbers.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        phone_numbers: node.xpath_nodes("*[local-name()='PhoneNumbers']/*[local-name()='member']").map { |n| SMSSandboxPhoneNumber.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @phone_numbers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@phone_numbers, @next_token)
  end
end
