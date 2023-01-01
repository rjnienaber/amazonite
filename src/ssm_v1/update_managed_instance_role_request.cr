module Amazonite::SsmV1
  class UpdateManagedInstanceRoleRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    @[JSON::Field(key: "IamRole")]
    property iam_role : String

    def initialize(
      @instance_id : String,
      @iam_role : String
    )
    end
  end
end
