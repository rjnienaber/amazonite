private alias AS = Amazonite::SnsV1
private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # A verified or pending destination phone number in the SMS sandbox.
  #
  # When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the
  # *SMS sandbox*. The SMS sandbox provides a safe environment for you to try Amazon SNS features
  # without risking your reputation as an SMS sender. While your Amazon Web Services account is in
  # the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS
  # messages only to verified destination phone numbers. For more information, including how to move
  # out of the sandbox to send messages without restrictions, see [SMS
  # sandbox](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) in the *Amazon SNS
  # Developer Guide*.
  class SMSSandboxPhoneNumber
    # The destination phone number.
    property phone_number : String | Nil

    # The destination phone number's verification status.
    property status : SMSSandboxPhoneNumberVerificationStatus | Nil

    def initialize(
      @phone_number : String | Nil = nil,
      @status : SMSSandboxPhoneNumberVerificationStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @phone_number
        params << {"#{prefix}PhoneNumber", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        phone_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PhoneNumber']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AS::SMSSandboxPhoneNumberVerificationStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def_equals_and_hash(@phone_number, @status)
  end
end
