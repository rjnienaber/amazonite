private alias Core = Amazonite::Core

module Amazonite::Iam
  class DeactivateMFADeviceRequest
    # The name of the user whose MFA device you want to deactivate.
    #
    # This parameter is optional. If no user name is included, it defaults to the principal making the
    # request. When you make this request with root user credentials, you must use an
    # [AssumeRoot](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoot.html) session to
    # omit the user name.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String | Nil

    # The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial
    # number is the device ARN.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: =,.@:/-
    property serial_number : String

    def initialize(
      @serial_number : String,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}SerialNumber", @serial_number}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @serial_number
        raise Core::ValidationError.new("SerialNumber length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("SerialNumber length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("SerialNumber does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]+$"))
      end
    end

    def_equals_and_hash(@user_name, @serial_number)
  end
end
