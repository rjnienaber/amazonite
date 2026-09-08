private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVolumeRequest
    # The ID of the Availability Zone in which to create the volume. For example, `us-east-1a`.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified, but not both.
    property availability_zone : String | Nil

    # The ID of the Availability Zone in which to create the volume. For example, `use1-az1`.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified, but not both.
    property availability_zone_id : String | Nil

    # Indicates whether the volume should be encrypted. The effect of setting the encryption state to
    # `true` depends on the volume origin (new or from a snapshot), starting encryption state,
    # ownership, and whether encryption by default is enabled. For more information, see [Encryption
    # by
    # default](https://docs.aws.amazon.com/ebs/latest/userguide/work-with-ebs-encr.html#encryption-by-default)
    # in the *Amazon EBS User Guide*.
    #
    # Encrypted Amazon EBS volumes must be attached to instances that support Amazon EBS encryption.
    # For more information, see [Supported instance
    # types](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-encryption-requirements.html#ebs-encryption_supported_instances).
    property encrypted : Bool | Nil

    # The number of I/O operations per second (IOPS) to provision for the volume. Required for `io1`
    # and `io2` volumes. Optional for `gp3` volumes. Omit for all other volume types.
    #
    # Valid ranges:
    #
    # - gp3: `3,000 `(*default*)` - 80,000` IOPS
    #
    # - io1: `100 - 64,000` IOPS
    #
    # - io2: `100 - 256,000` IOPS
    #
    # [ Instances built on the Nitro
    # System](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html) can
    # support up to 256,000 IOPS. Other instances can support up to 32,000 IOPS.
    property iops : Int32 | Nil

    # The identifier of the KMS key to use for Amazon EBS encryption. If this parameter is not
    # specified, your KMS key for Amazon EBS is used. If `KmsKeyId` is specified, the encrypted state
    # must be `true`.
    #
    # You can specify the KMS key using any of the following:
    #
    # - Key ID. For example, 1234abcd-12ab-34cd-56ef-1234567890ab.
    #
    # - Key alias. For example, alias/ExampleAlias.
    #
    # - Key ARN. For example,
    # arn:aws:kms:us-east-1:012345678910:key/1234abcd-12ab-34cd-56ef-1234567890ab.
    #
    # - Alias ARN. For example, arn:aws:kms:us-east-1:012345678910:alias/ExampleAlias.
    #
    # Amazon Web Services authenticates the KMS key asynchronously. Therefore, if you specify an ID,
    # alias, or ARN that is not valid, the action can appear to complete, but eventually fails.
    property kms_key_id : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost on which to create the volume.
    #
    # If you intend to use a volume with an instance running on an outpost, then you must create the
    # volume on the same outpost as the instance. You can't use a volume created in an Amazon Web
    # Services Region with an instance on an Amazon Web Services outpost, or the other way around.
    property outpost_arn : String | Nil

    # The size of the volume, in GiBs. You must specify either a snapshot ID or a volume size. If you
    # specify a snapshot, the default is the snapshot size, and you can specify a volume size that is
    # equal to or larger than the snapshot size.
    #
    # Valid sizes:
    #
    # - gp2: `1 - 16,384` GiB
    #
    # - gp3: `1 - 65,536` GiB
    #
    # - io1: `4 - 16,384` GiB
    #
    # - io2: `4 - 65,536` GiB
    #
    # - st1 and sc1: `125 - 16,384` GiB
    #
    # - standard: `1 - 1024` GiB
    property size : Int32 | Nil

    # The snapshot from which to create the volume. You must specify either a snapshot ID or a volume
    # size.
    property snapshot_id : String | Nil

    # The volume type. This parameter can be one of the following values:
    #
    # - General Purpose SSD: `gp2` | `gp3`
    #
    # - Provisioned IOPS SSD: `io1` | `io2`
    #
    # - Throughput Optimized HDD: `st1`
    #
    # - Cold HDD: `sc1`
    #
    # - Magnetic: `standard`
    #
    # Throughput Optimized HDD (`st1`) and Cold HDD (`sc1`) volumes can't be used as boot volumes.
    #
    # For more information, see [Amazon EBS volume
    # types](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volume-types.html) in the *Amazon
    # EBS User Guide*.
    #
    # Default: `gp2`
    property volume_type : VolumeType | Nil

    # The tags to apply to the volume during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # Indicates whether to enable Amazon EBS Multi-Attach. If you enable Multi-Attach, you can attach
    # the volume to up to 16 [Instances built on the Nitro
    # System](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html) in the
    # same Availability Zone. This parameter is supported with `io1` and `io2` volumes only. For more
    # information, see [ Amazon EBS
    # Multi-Attach](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volumes-multi.html) in the
    # *Amazon EBS User Guide*.
    property multi_attach_enabled : Bool | Nil

    # The throughput to provision for the volume, in MiB/s. Supported for `gp3` volumes only. Omit for
    # all other volume types.
    #
    # Valid Range: `125 - 2000` MiB/s
    property throughput : Int32 | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensure
    # Idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

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

    # Reserved for internal use.
    property operator : OperatorRequest | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @iops : Int32 | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @size : Int32 | Nil = nil,
      @snapshot_id : String | Nil = nil,
      @volume_type : VolumeType | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @multi_attach_enabled : Bool | Nil = nil,
      @throughput : Int32 | Nil = nil,
      @client_token : String | Nil = nil,
      @volume_initialization_rate : Int32 | Nil = nil,
      @operator : OperatorRequest | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @iops
        params << {"#{prefix}Iops", value.to_s}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @size
        params << {"#{prefix}Size", value.to_s}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @volume_type
        params << {"#{prefix}VolumeType", value.to_json_object_key}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @multi_attach_enabled
        params << {"#{prefix}MultiAttachEnabled", Core::QueryValue.bool(value)}
      end

      if value = @throughput
        params << {"#{prefix}Throughput", value.to_s}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @volume_initialization_rate
        params << {"#{prefix}VolumeInitializationRate", value.to_s}
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='Iops']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyId']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OutpostArn']")),
        size: Core::XMLValue.i32(node.xpath_node("*[local-name()='Size']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")),
        volume_type: (n = node.xpath_node("*[local-name()='VolumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        multi_attach_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='MultiAttachEnabled']")),
        throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='Throughput']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        volume_initialization_rate: Core::XMLValue.i32(node.xpath_node("*[local-name()='VolumeInitializationRate']")),
        operator: node.xpath_node("*[local-name()='Operator']").try { |n| OperatorRequest.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@availability_zone, @availability_zone_id, @encrypted, @iops, @kms_key_id, @outpost_arn, @size, @snapshot_id, @volume_type, @tag_specifications, @multi_attach_enabled, @throughput, @client_token, @volume_initialization_rate, @operator, @dry_run)
  end
end
