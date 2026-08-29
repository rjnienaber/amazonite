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
  end
end
