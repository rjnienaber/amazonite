private alias AS = Amazonite::SnsV1
private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class SMSSandboxPhoneNumber
    property phone_number : String | Nil

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
  end
end
