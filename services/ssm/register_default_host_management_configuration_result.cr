private alias Core = Amazonite::Core

module Amazonite::Ssm
  class RegisterDefaultHostManagementConfigurationResult
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the IAM role registered for Default Host Management
    # Configuration. The value depends on the permission model:
    #
    # SERVICE_MANAGED The ARN of the role that Amazon Web Services Systems Manager created in the IAM
    # reserved path.
    #
    # SELF_MANAGED The `RoleArn` that you provided.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    def initialize(
      @role_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("RoleArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("RoleArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-z0-9-]*:iam::\\d{12}:role/[\\w+=,.@/-]+$"))
      end
    end

    def_equals_and_hash(@role_arn)
  end
end
