private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device for an EBS volume.
  class FleetEbsBlockDeviceRequest
    # Indicates whether the encryption state of an EBS volume is changed while being restored from a
    # backing snapshot. The effect of setting the encryption state to `true` depends on the volume
    # origin (new or from a snapshot), starting encryption state, ownership, and whether encryption by
    # default is enabled. For more information, see [Amazon EBS
    # encryption](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-encryption.html) in the *Amazon
    # EBS User Guide*.
    #
    # In no case can you remove encryption from an encrypted volume.
    #
    # Encrypted volumes can only be attached to instances that support Amazon EBS encryption. For more
    # information, see [Supported instance
    # types](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-encryption-requirements.html#ebs-encryption_supported_instances).
    #
    # This parameter is not returned by
    # [DescribeImageAttribute](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeImageAttribute).
    #
    # For [CreateImage](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateImage) and
    # [RegisterImage](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RegisterImage),
    # whether you can include this parameter, and the allowed values differ depending on the type of
    # block device mapping you are creating.
    #
    # - If you are creating a block device mapping for a **new (empty) volume**, you can include this
    # parameter, and specify either `true` for an encrypted volume, or `false` for an unencrypted
    # volume. If you omit this parameter, it defaults to `false` (unencrypted).
    #
    # - If you are creating a block device mapping from an **existing encrypted or unencrypted
    # snapshot**, you must omit this parameter. If you include this parameter, the request will fail,
    # regardless of the value that you specify.
    #
    # - If you are creating a block device mapping from an **existing unencrypted volume**, you can
    # include this parameter, but you must specify `false`. If you specify `true`, the request will
    # fail. In this case, we recommend that you omit the parameter.
    #
    # - If you are creating a block device mapping from an **existing encrypted volume**, you can
    # include this parameter, and specify either `true` or `false`. However, if you specify `false`,
    # the parameter is ignored and the block device mapping is always encrypted. In this case, we
    # recommend that you omit the parameter.
    property encrypted : Bool | Nil

    # Indicates whether the EBS volume is deleted on instance termination. For more information, see
    # [Preserve data when an instance is
    # terminated](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/preserving-volumes-on-termination.html)
    # in the *Amazon EC2 User Guide*.
    property delete_on_termination : Bool | Nil

    # The number of I/O operations per second (IOPS). For `gp3`, `io1`, and `io2` volumes, this
    # represents the number of IOPS that are provisioned for the volume. For `gp2` volumes, this
    # represents the baseline performance of the volume and the rate at which the volume accumulates
    # I/O credits for bursting.
    #
    # The following are the supported values for each volume type:
    #
    # - `gp3`: 3,000 - 80,000 IOPS
    #
    # - `io1`: 100 - 64,000 IOPS
    #
    # - `io2`: 100 - 256,000 IOPS
    #
    # For `io2` volumes, you can achieve up to 256,000 IOPS on [instances built on the Nitro
    # System](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#ec2-nitro-instances).
    # On other instances, you can achieve performance up to 32,000 IOPS.
    #
    # This parameter is required for `io1` and `io2` volumes. The default for `gp3` volumes is 3,000
    # IOPS.
    property iops : Int32 | Nil

    # The throughput that the volume supports, in MiB/s.
    #
    # This parameter is valid only for `gp3` volumes.
    #
    # Valid Range: Minimum value of 125. Maximum value of 2,000.
    property throughput : Int32 | Nil

    # Identifier (key ID, key alias, key ARN, or alias ARN) of the customer managed KMS key to use for
    # EBS encryption.
    #
    # This parameter is only supported on `BlockDeviceMapping` objects called by
    # [CreateFleet](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateFleet.html),
    # [RequestSpotInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RequestSpotInstances.html),
    # and
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html).
    property kms_key_id : String | Nil

    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The size of the volume, in GiBs. You must specify either a snapshot ID or a volume size. If you
    # specify a snapshot, the default is the snapshot size. You can specify a volume size that is
    # equal to or larger than the snapshot size.
    #
    # The following are the supported sizes for each volume type:
    #
    # - `gp2`: 1 - 16,384 GiB
    #
    # - `gp3`: 1 - 65,536 GiB
    #
    # - `io1`: 4 - 16,384 GiB
    #
    # - `io2`: 4 - 65,536 GiB
    #
    # - `st1` and `sc1`: 125 - 16,384 GiB
    #
    # - `standard`: 1 - 1024 GiB
    property volume_size : Int32 | Nil

    # The volume type. For more information, see [Amazon EBS volume
    # types](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volume-types.html) in the *Amazon
    # EBS User Guide*.
    property volume_type : VolumeType | Nil

    def initialize(
      @encrypted : Bool | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
      @iops : Int32 | Nil = nil,
      @throughput : Int32 | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @volume_size : Int32 | Nil = nil,
      @volume_type : VolumeType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end

      if value = @iops
        params << {"#{prefix}Iops", value.to_s}
      end

      if value = @throughput
        params << {"#{prefix}Throughput", value.to_s}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @volume_size
        params << {"#{prefix}VolumeSize", value.to_s}
      end

      if value = @volume_type
        params << {"#{prefix}VolumeType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='Encrypted']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='DeleteOnTermination']")),
        iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='Iops']")),
        throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='Throughput']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyId']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")),
        volume_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='VolumeSize']")),
        volume_type: (n = node.xpath_node("*[local-name()='VolumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@encrypted, @delete_on_termination, @iops, @throughput, @kms_key_id, @snapshot_id, @volume_size, @volume_type)
  end
end
