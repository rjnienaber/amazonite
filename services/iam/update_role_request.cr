private alias Core = Amazonite::Core

module Amazonite::Iam
  class UpdateRoleRequest
    # The name of the role that you want to modify.
    property role_name : String

    # The new description that you want to apply to the specified role.
    property description : String | Nil

    # The maximum session duration (in seconds) that you want to set for the specified role. If you do
    # not specify a value for this setting, the default value of one hour is applied. This setting can
    # have a value from 1 hour to 12 hours.
    #
    # Anyone who assumes the role from the CLI or API can use the `DurationSeconds` API parameter or
    # the `duration-seconds` CLI parameter to request a longer session. The `MaxSessionDuration`
    # setting determines the maximum duration that can be requested using the `DurationSeconds`
    # parameter. If users don't specify a value for the `DurationSeconds` parameter, their security
    # credentials are valid for one hour by default. This applies when you use the `AssumeRole*` API
    # operations or the `assume-role*` CLI operations but does not apply when you use those operations
    # to create a console URL. For more information, see [Using IAM
    # roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html) in the *IAM User
    # Guide*.
    #
    # IAM role credentials provided by Amazon EC2 instances assigned to the role are not subject to
    # the specified maximum session duration.
    property max_session_duration : Int32 | Nil

    # The maximum duration (in seconds) of an Amazon Web Services Sign-In session for users who sign
    # in with the specified role. This setting can have a value from 1 hour (3600 seconds) to 90 days
    # (7776000 seconds), inclusive, and replaces any value currently configured for the role. This
    # setting is independent of `MaxSessionDuration`.
    #
    # If you omit both this parameter and `ResetMaxSigninSessionDuration`, the current setting is
    # unchanged. You cannot specify this parameter and set `ResetMaxSigninSessionDuration` to `true`
    # in the same request.
    #
    # Changes to this setting apply to new sign-in sessions. Sessions that are already established are
    # not affected.
    #
    # You cannot set this value on a service-linked role.
    property max_signin_session_duration : Int32 | Nil

    # Specifies whether to clear the role's maximum sign-in session duration. Set this value to `true`
    # to return the setting to its unset state, so that the existing sign-in session behavior applies.
    # When the setting is unset, the role's `MaxSigninSessionDuration` is omitted from responses.
    #
    # If you set this value to `false` or omit it, the current setting is not cleared. You cannot set
    # this value to `true` and specify `MaxSigninSessionDuration` in the same request. Clearing a
    # setting that is already unset has no effect.
    #
    # You cannot reset this value on a service-linked role.
    property reset_max_signin_session_duration : Bool | Nil

    def initialize(
      @role_name : String,
      @description : String | Nil = nil,
      @max_session_duration : Int32 | Nil = nil,
      @max_signin_session_duration : Int32 | Nil = nil,
      @reset_max_signin_session_duration : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RoleName", @role_name}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @max_session_duration
        params << {"#{prefix}MaxSessionDuration", value.to_s}
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
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        max_session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxSessionDuration']")),
        max_signin_session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxSigninSessionDuration']")),
        reset_max_signin_session_duration: Core::XMLValue.bool(node.xpath_node("*[local-name()='ResetMaxSigninSessionDuration']")),
      )
    end

    def validate! : Nil
      if value = @role_name
        raise Core::ValidationError.new("RoleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("RoleName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1000") if value.size > 1000
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end

      if value = @max_session_duration
        raise Core::ValidationError.new("MaxSessionDuration value must be >= 3600") if value < 3600
        raise Core::ValidationError.new("MaxSessionDuration value must be <= 43200") if value > 43200
      end

      if value = @max_signin_session_duration
        raise Core::ValidationError.new("MaxSigninSessionDuration value must be >= 3600") if value < 3600
        raise Core::ValidationError.new("MaxSigninSessionDuration value must be <= 7776000") if value > 7776000
      end
    end

    def_equals_and_hash(@role_name, @description, @max_session_duration, @max_signin_session_duration, @reset_max_signin_session_duration)
  end
end
