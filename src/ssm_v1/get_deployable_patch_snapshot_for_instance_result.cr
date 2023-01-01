module Amazonite::SsmV1
  class GetDeployablePatchSnapshotForInstanceResult
    include JSON::Serializable

    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    @[JSON::Field(key: "SnapshotId")]
    property snapshot_id : String | Nil

    @[JSON::Field(key: "SnapshotDownloadUrl")]
    property snapshot_download_url : String | Nil

    @[JSON::Field(key: "Product")]
    property product : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @snapshot_download_url : String | Nil = nil,
      @product : String | Nil = nil
    )
    end
  end
end
