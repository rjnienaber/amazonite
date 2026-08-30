private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @snapshot_id
        raise Core::ValidationError.new("SnapshotId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("SnapshotId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("SnapshotId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @baseline_override
        value.validate!
      end
    end

    def_equals_and_hash(@instance_id, @snapshot_id, @baseline_override, @use_s3_dual_stack_endpoint)
  end
end
