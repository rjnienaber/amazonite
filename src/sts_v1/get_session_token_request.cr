private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetSessionTokenRequest
    # The duration, in seconds, that the credentials should remain valid. Acceptable durations for IAM
    # user sessions range from 900 seconds (15 minutes) to 129,600 seconds (36 hours), with 43,200
    # seconds (12 hours) as the default. Sessions for Amazon Web Services account owners are
    # restricted to a maximum of 3,600 seconds (one hour). If the duration is longer than one hour,
    # the session for Amazon Web Services account owners defaults to one hour.
    property duration_seconds : Int32 | Nil

    # The identification number of the MFA device that is associated with the IAM user who is making
    # the `GetSessionToken` call. Specify this value if the IAM user has a policy that requires MFA
    # authentication. The value is either the serial number for a hardware device (such as
    # `GAHT12345678`) or an Amazon Resource Name (ARN) for a virtual device (such as
    # `arn:aws:iam::123456789012:mfa/user`). You can find the device for an IAM user by going to the
    # Amazon Web Services Management Console and viewing the user's security credentials.
    #
    # The regex used to validate this parameter is a string of characters consisting of upper- and
    # lower-case alphanumeric characters with no spaces. You can also include underscores or any of
    # the following characters: =,.@:/-
    property serial_number : String | Nil

    # The value provided by the MFA device, if MFA is required. If any policy requires the IAM user to
    # submit an MFA code, specify this value. If MFA authentication is required, the user must provide
    # a code when requesting a set of temporary security credentials. A user who fails to provide the
    # code receives an "access denied" response when requesting resources that require MFA
    # authentication.
    #
    # The format for this parameter, as described by its regex pattern, is a sequence of six numeric
    # digits.
    property token_code : String | Nil

    def initialize(
      @duration_seconds : Int32 | Nil = nil,
      @serial_number : String | Nil = nil,
      @token_code : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      if value = @serial_number
        params << {"#{prefix}SerialNumber", value}
      end

      if value = @token_code
        params << {"#{prefix}TokenCode", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")),
        token_code: Core::XMLValue.string(node.xpath_node("*[local-name()='TokenCode']")),
      )
    end

    def validate! : Nil
      if value = @duration_seconds
        raise Core::ValidationError.new("DurationSeconds value must be >= 900") if value < 900
        raise Core::ValidationError.new("DurationSeconds value must be <= 129600") if value > 129600
      end

      if value = @serial_number
        raise Core::ValidationError.new("SerialNumber length must be >= 9") if value.size < 9
        raise Core::ValidationError.new("SerialNumber length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("SerialNumber does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]*$"))
      end

      if value = @token_code
        raise Core::ValidationError.new("TokenCode length must be >= 6") if value.size < 6
        raise Core::ValidationError.new("TokenCode length must be <= 6") if value.size > 6
        raise Core::ValidationError.new("TokenCode does not match the required pattern") unless value.matches?(Regex.new("^[\\d]*$"))
      end
    end

    def_equals_and_hash(@duration_seconds, @serial_number, @token_code)
  end
end
