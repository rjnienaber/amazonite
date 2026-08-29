private alias Core = Amazonite::Core

module Amazonite::IamV1
  class EnableMFADeviceRequest
    # The name of the IAM user for whom you want to enable the MFA device.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String

    # The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial
    # number is the device ARN.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: =,.@:/-
    property serial_number : String

    # An authentication code emitted by the device.
    #
    # The format for this parameter is a string of six digits.
    #
    # Submit your request immediately after generating the authentication codes. If you generate the
    # codes and then wait too long to submit the request, the MFA device successfully associates with
    # the user but the MFA device becomes out of sync. This happens because time-based one-time
    # passwords (TOTP) expire after a short period of time. If this happens, you can [resync the
    # device](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html).
    property authentication_code_1 : String

    # A subsequent authentication code emitted by the device.
    #
    # The format for this parameter is a string of six digits.
    #
    # Submit your request immediately after generating the authentication codes. If you generate the
    # codes and then wait too long to submit the request, the MFA device successfully associates with
    # the user but the MFA device becomes out of sync. This happens because time-based one-time
    # passwords (TOTP) expire after a short period of time. If this happens, you can [resync the
    # device](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html).
    property authentication_code_2 : String

    def initialize(
      @user_name : String,
      @serial_number : String,
      @authentication_code_1 : String,
      @authentication_code_2 : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}SerialNumber", @serial_number}

      params << {"#{prefix}AuthenticationCode1", @authentication_code_1}

      params << {"#{prefix}AuthenticationCode2", @authentication_code_2}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        authentication_code_1: Core::XMLValue.string(node.xpath_node("*[local-name()='AuthenticationCode1']")).not_nil!,
        authentication_code_2: Core::XMLValue.string(node.xpath_node("*[local-name()='AuthenticationCode2']")).not_nil!,
      )
    end
  end
end
