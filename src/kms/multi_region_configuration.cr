private alias AK = Amazonite::Kms
private alias Core = Amazonite::Core

module Amazonite::Kms
  # Describes the configuration of this multi-Region key. This field appears only when the KMS key
  # is a primary or replica of a multi-Region key.
  #
  # For more information about any listed KMS key, use the DescribeKey operation.
  class MultiRegionConfiguration
    include JSON::Serializable

    # Indicates whether the KMS key is a `PRIMARY` or `REPLICA` key.
    @[JSON::Field(key: "MultiRegionKeyType", converter: AK::MultiRegionKeyType)]
    property multi_region_key_type : MultiRegionKeyType | Nil

    # Displays the key ARN and Region of the primary key. This field includes the current KMS key if
    # it is the primary key.
    @[JSON::Field(key: "PrimaryKey")]
    property primary_key : MultiRegionKey | Nil

    # displays the key ARNs and Regions of all replica keys. This field includes the current KMS key
    # if it is a replica key.
    @[JSON::Field(key: "ReplicaKeys")]
    property replica_keys : Array(MultiRegionKey) | Nil

    def initialize(
      @multi_region_key_type : MultiRegionKeyType | Nil = nil,
      @primary_key : MultiRegionKey | Nil = nil,
      @replica_keys : Array(MultiRegionKey) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @primary_key
        value.validate!
      end

      if value = @replica_keys
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@multi_region_key_type, @primary_key, @replica_keys)
  end
end
