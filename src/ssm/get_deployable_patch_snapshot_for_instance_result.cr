private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetDeployablePatchSnapshotForInstanceResult
    include JSON::Serializable

    # The managed node ID.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # The user-defined snapshot ID.
    @[JSON::Field(key: "SnapshotId")]
    property snapshot_id : String | Nil

    # A pre-signed Amazon Simple Storage Service (Amazon S3) URL that can be used to download the
    # patch snapshot.
    @[JSON::Field(key: "SnapshotDownloadUrl")]
    property snapshot_download_url : String | Nil

    # Returns the specific operating system (for example Windows Server 2012 or Amazon Linux 2015.09)
    # on the managed node for the specified patch snapshot.
    @[JSON::Field(key: "Product")]
    property product : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @snapshot_download_url : String | Nil = nil,
      @product : String | Nil = nil,
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
    end

    def_equals_and_hash(@instance_id, @snapshot_id, @snapshot_download_url, @product)
  end
end
