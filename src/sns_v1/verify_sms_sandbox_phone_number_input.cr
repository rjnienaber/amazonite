private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class VerifySMSSandboxPhoneNumberInput
    # The destination phone number to verify.
    property phone_number : String

    # The OTP sent to the destination number from the `CreateSMSSandBoxPhoneNumber` call.
    property one_time_password : String

    def initialize(
      @phone_number : String,
      @one_time_password : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PhoneNumber", @phone_number}

      params << {"#{prefix}OneTimePassword", @one_time_password}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        phone_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PhoneNumber']")).not_nil!,
        one_time_password: Core::XMLValue.string(node.xpath_node("*[local-name()='OneTimePassword']")).not_nil!,
      )
    end

    def_equals_and_hash(@phone_number, @one_time_password)
  end
end
