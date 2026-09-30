private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The parameters for a block device for an EBS volume.
  class LaunchTemplateEbsBlockDeviceRequest
    # Indicates whether the EBS volume is encrypted. Encrypted volumes can only be attached to
    # instances that support Amazon EBS encryption. If you are creating a volume from a snapshot, you
    # can't specify an encryption value.
    property encrypted : Bool | Nil

    # Indicates whether the EBS volume is deleted on instance termination.
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
    # System](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html). On other
    # instances, you can achieve performance up to 32,000 IOPS.
    #
    # This parameter is supported for `io1`, `io2`, and `gp3` volumes only.
    property iops : Int32 | Nil

    # Identifier (key ID, key alias, key ARN, or alias ARN) of the customer managed KMS key to use for
    # EBS encryption.
    property kms_key_id : String | Nil

    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The size of the volume, in GiBs. You must specify either a snapshot ID or a volume size. The
    # following are the supported volumes sizes for each volume type:
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

    # The throughput to provision for a `gp3` volume, with a maximum of 2,000 MiB/s.
    #
    # Valid Range: Minimum value of 125. Maximum value of 2,000.
    property throughput : Int32 | Nil

    # Specifies the Amazon EBS Provisioned Rate for Volume Initialization (volume initialization
    # rate), in MiB/s, at which to download the snapshot blocks from Amazon S3 to the volume. This is
    # also known as *volume initialization*. Specifying a volume initialization rate ensures that the
    # volume is initialized at a predictable and consistent rate after creation.
    #
    # This parameter is supported only for volumes created from snapshots. Omit this parameter if:
    #
    # - You want to create the volume using fast snapshot restore. You must specify a snapshot that is
    # enabled for fast snapshot restore. In this case, the volume is fully initialized at creation.
    #
    # If you specify a snapshot that is enabled for fast snapshot restore and a volume initialization
    # rate, the volume will be initialized at the specified rate instead of fast snapshot restore.
    #
    # - You want to create a volume that is initialized at the default rate.
    #
    # For more information, see [ Initialize Amazon EBS
    # volumes](https://docs.aws.amazon.com/ebs/latest/userguide/initalize-volume.html) in the *Amazon
    # EC2 User Guide*.
    #
    # Valid range: 100 - 300 MiB/s
    property volume_initialization_rate : Int32 | Nil

    # The index of the EBS card. Some instance types support multiple EBS cards. The default EBS card
    # index is 0.
    property ebs_card_index : Int32 | Nil

    def initialize(
      @encrypted : Bool | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
      @iops : Int32 | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @volume_size : Int32 | Nil = nil,
      @volume_type : VolumeType | Nil = nil,
      @throughput : Int32 | Nil = nil,
      @volume_initialization_rate : Int32 | Nil = nil,
      @ebs_card_index : Int32 | Nil = nil,
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

      if value = @throughput
        params << {"#{prefix}Throughput", value.to_s}
      end

      if value = @volume_initialization_rate
        params << {"#{prefix}VolumeInitializationRate", value.to_s}
      end

      if value = @ebs_card_index
        params << {"#{prefix}EbsCardIndex", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='Encrypted']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='DeleteOnTermination']")),
        iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='Iops']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyId']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")),
        volume_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='VolumeSize']")),
        volume_type: (n = node.xpath_node("*[local-name()='VolumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
        throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='Throughput']")),
        volume_initialization_rate: Core::XMLValue.i32(node.xpath_node("*[local-name()='VolumeInitializationRate']")),
        ebs_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='EbsCardIndex']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@encrypted, @delete_on_termination, @iops, @kms_key_id, @snapshot_id, @volume_size, @volume_type, @throughput, @volume_initialization_rate, @ebs_card_index)
  end
end
