private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class UpdateManagedInstanceRoleRequest
    include JSON::Serializable

    # The ID of the managed node where you want to update the role.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    # The name of the Identity and Access Management (IAM) role that you want to assign to the managed
    # node. This IAM role must provide AssumeRole permissions for the Amazon Web Services Systems
    # Manager service principal `ssm.amazonaws.com`. For more information, see [Create the IAM service
    # role required for Systems Manager in hybrid and multicloud
    # environments](https://docs.aws.amazon.com/systems-manager/latest/userguide/hybrid-multicloud-service-role.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # You can't specify an IAM service-linked role for this parameter. You must create a unique role.
    @[JSON::Field(key: "IamRole")]
    property iam_role : String

    def initialize(
      @instance_id : String,
      @iam_role : String,
    )
    end

    def validate! : Nil
      if value = @instance_id
        raise Core::ValidationError.new("InstanceId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("InstanceId length must be <= 124") if value.size > 124
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^mi-[0-9a-f]{17}$)|(^eks_c:[0-9A-Za-z][A-Za-z0-9\\-_]{0,99}_\\w{17}$)$"))
      end

      if value = @iam_role
        raise Core::ValidationError.new("IamRole length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("IamRole length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@instance_id, @iam_role)
  end
end
