private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # The input for the `CheckIfPhoneNumberIsOptedOut` action.
  class CheckIfPhoneNumberIsOptedOutInput
    # The phone number for which you want to check the opt out status.
    property phone_number : String

    def initialize(
      @phone_number : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}phoneNumber", @phone_number}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        phone_number: Core::XMLValue.string(node.xpath_node("*[local-name()='phoneNumber']")).not_nil!,
      )
    end

    def_equals_and_hash(@phone_number)
  end
end
