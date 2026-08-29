module Amazonite::SsmV1
  class GetDeployablePatchSnapshotForInstanceRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    @[JSON::Field(key: "SnapshotId")]
    property snapshot_id : String

    @[JSON::Field(key: "BaselineOverride")]
    property baseline_override : BaselineOverride | Nil

    @[JSON::Field(key: "UseS3DualStackEndpoint")]
    property use_s3_dual_stack_endpoint : Bool | Nil

    def initialize(
      @instance_id : String,
      @snapshot_id : String,
      @baseline_override : BaselineOverride | Nil = nil,
      @use_s3_dual_stack_endpoint : Bool | Nil = nil,
    )
    end
  end
end
