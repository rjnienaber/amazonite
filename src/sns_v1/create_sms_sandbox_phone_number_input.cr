private alias AS = Amazonite::SnsV1
private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class CreateSMSSandboxPhoneNumberInput
    # The destination phone number to verify. On verification, Amazon SNS adds this phone number to
    # the list of verified phone numbers that you can send SMS messages to.
    property phone_number : String

    # The language to use for sending the OTP. The default value is `en-US`.
    property language_code : LanguageCodeString | Nil

    def initialize(
      @phone_number : String,
      @language_code : LanguageCodeString | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PhoneNumber", @phone_number}

      if value = @language_code
        params << {"#{prefix}LanguageCode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        phone_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PhoneNumber']")).not_nil!,
        language_code: (n = node.xpath_node("*[local-name()='LanguageCode']")) ? AS::LanguageCodeString.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
