private alias Core = Amazonite::Core

module Amazonite::Iam
  class UpdateLoginProfileRequest
    # The name of the user whose password you want to update.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String

    # The new password for the specified IAM user.
    #
    # The [regex pattern](http://wikipedia.org/wiki/regex) used to validate this parameter is a string
    # of characters consisting of the following:
    #
    # - Any printable ASCII character ranging from the space character (`\u0020`) through the end of
    # the ASCII character range
    #
    # - The printable characters in the Basic Latin and Latin-1 Supplement character set (through
    # `\u00FF`)
    #
    # - The special characters tab (`\u0009`), line feed (`\u000A`), and carriage return (`\u000D`)
    #
    # However, the format can be further restricted by the account administrator by setting a password
    # policy on the Amazon Web Services account. For more information, see
    # [UpdateAccountPasswordPolicy](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAccountPasswordPolicy.html).
    property password : String | Nil

    # Allows this new password to be used only once by requiring the specified IAM user to set a new
    # password on next sign-in.
    property password_reset_required : Bool | Nil

    # The maximum duration (in seconds) of an Amazon Web Services Sign-In session for the specified
    # IAM user. This setting can have a value from 1 hour (3600 seconds) to 90 days (7776000 seconds),
    # inclusive, and replaces any value currently configured for the user.
    #
    # If you omit both this parameter and `ResetMaxSigninSessionDuration`, the current setting is
    # unchanged. You cannot specify this parameter and set `ResetMaxSigninSessionDuration` to `true`
    # in the same request. If you update only the sign-in session duration, the user's password and
    # `PasswordResetRequired` setting do not change.
    #
    # Changes to this setting apply to new sign-in sessions. Sessions that are already established are
    # not affected.
    #
    # This setting is not supported for the root user.
    property max_signin_session_duration : Int32 | Nil

    # Specifies whether to clear the maximum sign-in session duration for the specified IAM user. Set
    # this value to `true` to return the setting to its unset state, so that the existing sign-in
    # session behavior applies. When the setting is unset, the user's `MaxSigninSessionDuration` is
    # omitted from responses.
    #
    # If you set this value to `false` or omit it, the current setting is not cleared. You cannot set
    # this value to `true` and specify `MaxSigninSessionDuration` in the same request. Clearing a
    # setting that is already unset has no effect.
    property reset_max_signin_session_duration : Bool | Nil

    def initialize(
      @user_name : String,
      @password : String | Nil = nil,
      @password_reset_required : Bool | Nil = nil,
      @max_signin_session_duration : Int32 | Nil = nil,
      @reset_max_signin_session_duration : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      if value = @password
        params << {"#{prefix}Password", value}
      end

      if value = @password_reset_required
        params << {"#{prefix}PasswordResetRequired", Core::QueryValue.bool(value)}
      end

      if value = @max_signin_session_duration
        params << {"#{prefix}MaxSigninSessionDuration", value.to_s}
      end

      if value = @reset_max_signin_session_duration
        params << {"#{prefix}ResetMaxSigninSessionDuration", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        password: Core::XMLValue.string(node.xpath_node("*[local-name()='Password']")),
        password_reset_required: Core::XMLValue.bool(node.xpath_node("*[local-name()='PasswordResetRequired']")),
        max_signin_session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxSigninSessionDuration']")),
        reset_max_signin_session_duration: Core::XMLValue.bool(node.xpath_node("*[local-name()='ResetMaxSigninSessionDuration']")),
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @password
        raise Core::ValidationError.new("Password length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Password length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Password does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @max_signin_session_duration
        raise Core::ValidationError.new("MaxSigninSessionDuration value must be >= 3600") if value < 3600
        raise Core::ValidationError.new("MaxSigninSessionDuration value must be <= 7776000") if value > 7776000
      end
    end

    def_equals_and_hash(@user_name, @password, @password_reset_required, @max_signin_session_duration, @reset_max_signin_session_duration)
  end
end
