module Amazonite::SsmV1
  class GetDeployablePatchSnapshotForInstanceRequest
    include JSON::Serializable

    # The ID of the managed node for which the appropriate patch snapshot should be retrieved.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String

    # The snapshot ID provided by the user when running `AWS-RunPatchBaseline`.
    @[JSON::Field(key: "SnapshotId")]
    property snapshot_id : String

    # Defines the basic information about a patch baseline override.
    @[JSON::Field(key: "BaselineOverride")]
    property baseline_override : BaselineOverride | Nil

    # Specifies whether to use S3 dualstack endpoints for the patch snapshot download URL. Set to
    # `true` to receive a presigned URL that supports both IPv4 and IPv6 connectivity. Set to `false`
    # to use standard IPv4-only endpoints. Default is `false`. This parameter is required for managed
    # nodes in IPv6-only environments.
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
