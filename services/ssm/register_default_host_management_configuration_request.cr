private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  class RegisterDefaultHostManagementConfigurationRequest
    include JSON::Serializable

    # The permission model that determines how the IAM role for Default Host Management Configuration
    # is provided.
    #
    # The permission model can be one of the following values:
    #
    # SERVICE_MANAGED Amazon Web Services Systems Manager creates and manages the role on your behalf.
    #
    # SELF_MANAGED You provide the role to register in `RoleArn`.
    @[JSON::Field(key: "PermissionModel", converter: AS::DHMCPermissionModel)]
    property permission_model : DHMCPermissionModel

    # The Amazon Resource Name (ARN) of the self-managed IAM role that you register for Default Host
    # Management Configuration. The requirement for this value depends on the permission model:
    #
    # - If `PermissionModel` is `SELF_MANAGED`, this value is required.
    #
    # - If `PermissionModel` is `SERVICE_MANAGED`, this value must not be set.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # Specifies whether to override the role that is currently registered for Default Host Management
    # Configuration. The default is `false`, which acts as a guardrail against accidentally replacing
    # an existing configuration. Set this to `true` to replace the currently registered role.
    @[JSON::Field(key: "Overwrite")]
    property overwrite : Bool | Nil

    def initialize(
      @permission_model : DHMCPermissionModel,
      @role_arn : String | Nil = nil,
      @overwrite : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("RoleArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("RoleArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-z0-9-]*:iam::\\d{12}:role/[\\w+=,.@/-]+$"))
      end
    end

    def_equals_and_hash(@permission_model, @role_arn, @overwrite)
  end
end
