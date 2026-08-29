private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class MultiRegionConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "MultiRegionKeyType", converter: AK::MultiRegionKeyType)]
    property multi_region_key_type : MultiRegionKeyType | Nil

    @[JSON::Field(key: "PrimaryKey")]
    property primary_key : MultiRegionKey | Nil

    @[JSON::Field(key: "ReplicaKeys")]
    property replica_keys : Array(MultiRegionKey) | Nil

    def initialize(
      @multi_region_key_type : MultiRegionKeyType | Nil = nil,
      @primary_key : MultiRegionKey | Nil = nil,
      @replica_keys : Array(MultiRegionKey) | Nil = nil,
    )
    end
  end
end
