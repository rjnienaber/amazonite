private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetMFADeviceRequest
    # Serial number that uniquely identifies the MFA device. For this API, we only accept FIDO
    # security key [ARNs](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html).
    property serial_number : String

    # The friendly name identifying the user.
    property user_name : String | Nil

    def initialize(
      @serial_number : String,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SerialNumber", @serial_number}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
      )
    end

    def_equals_and_hash(@serial_number, @user_name)
  end
end
