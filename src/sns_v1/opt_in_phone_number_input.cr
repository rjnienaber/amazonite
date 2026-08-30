private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for the OptInPhoneNumber action.
  class OptInPhoneNumberInput
    # The phone number to opt in. Use E.164 format.
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

    def validate! : Nil
    end

    def_equals_and_hash(@phone_number)
  end
end
