private alias Core = Amazonite::Core

module Amazonite::Iam
  class ResyncMFADeviceRequest
    # The name of the user whose MFA device you want to resynchronize.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String

    # Serial number that uniquely identifies the MFA device.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property serial_number : String

    # An authentication code emitted by the device.
    #
    # The format for this parameter is a sequence of six digits.
    property authentication_code_1 : String

    # A subsequent authentication code emitted by the device.
    #
    # The format for this parameter is a sequence of six digits.
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

      if value = @authentication_code_1
        raise Core::ValidationError.new("AuthenticationCode1 length must be >= 6") if value.size < 6
        raise Core::ValidationError.new("AuthenticationCode1 length must be <= 6") if value.size > 6
        raise Core::ValidationError.new("AuthenticationCode1 does not match the required pattern") unless value.matches?(Regex.new("^[\\d]+$"))
      end

      if value = @authentication_code_2
        raise Core::ValidationError.new("AuthenticationCode2 length must be >= 6") if value.size < 6
        raise Core::ValidationError.new("AuthenticationCode2 length must be <= 6") if value.size > 6
        raise Core::ValidationError.new("AuthenticationCode2 does not match the required pattern") unless value.matches?(Regex.new("^[\\d]+$"))
      end
    end

    def_equals_and_hash(@user_name, @serial_number, @authentication_code_1, @authentication_code_2)
  end
end
