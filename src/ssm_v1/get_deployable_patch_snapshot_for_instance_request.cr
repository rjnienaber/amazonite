module Amazonite::SsmV1
  class GetDeployablePatchSnapshotForInstanceRequest
    include JSON::Serializable

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    @[JSON::Field(key: "SnapshotId")]
    property snapshot_id : String

    @[JSON::Field(key: "BaselineOverride")]
    property baseline_override : BaselineOverride | Nil

    def initialize(
      @instance_id : String,
      @snapshot_id : String,
      @baseline_override : BaselineOverride | Nil = nil
    )
    end
  end
end
