private alias Core = Amazonite::Core

module Amazonite::Iam
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

    def validate! : Nil
      if value = @serial_number
        raise Core::ValidationError.new("SerialNumber length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("SerialNumber length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("SerialNumber does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]+$"))
      end

      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end
    end

    def_equals_and_hash(@serial_number, @user_name)
  end
end
