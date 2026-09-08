private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CopyImage.
  class CopyImageRequest
    # Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more
    # information, see [Ensuring idempotency in Amazon EC2 API
    # requests](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html)
    # in the *Amazon EC2 API Reference*.
    property client_token : String | Nil

    # A description for the new AMI.
    property description : String | Nil

    # Specifies whether to encrypt the snapshots of the copied image.
    #
    # You can encrypt a copy of an unencrypted snapshot, but you cannot create an unencrypted copy of
    # an encrypted snapshot. The default KMS key for Amazon EBS is used unless you specify a
    # non-default Key Management Service (KMS) KMS key using `KmsKeyId`. For more information, see
    # [Use encryption with EBS-backed
    # AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIEncryption.html) in the *Amazon EC2
    # User Guide*.
    property encrypted : Bool | Nil

    # The identifier of the symmetric Key Management Service (KMS) KMS key to use when creating
    # encrypted volumes. If this parameter is not specified, your Amazon Web Services managed KMS key
    # for Amazon EBS is used. If you specify a KMS key, you must also set the encrypted state to
    # `true`.
    #
    # You can specify a KMS key using any of the following:
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
    # Amazon Web Services authenticates the KMS key asynchronously. Therefore, if you specify an
    # identifier that is not valid, the action can appear to complete, but eventually fails.
    #
    # The specified KMS key must exist in the destination Region.
    #
    # Amazon EBS does not support asymmetric KMS keys.
    property kms_key_id : String | Nil

    # The name of the new AMI.
    property name : String

    # The ID of the AMI to copy.
    property source_image_id : String

    # The name of the Region that contains the AMI to copy.
    property source_region : String

    # The Amazon Resource Name (ARN) of the Outpost for the new AMI.
    #
    # Only specify this parameter when copying an AMI from an Amazon Web Services Region to an
    # Outpost. The AMI must be in the Region of the destination Outpost. You can't copy an AMI from an
    # Outpost to a Region, from one Outpost to another, or within the same Outpost.
    #
    # For more information, see [Copy AMIs from an Amazon Web Services Region to an
    # Outpost](https://docs.aws.amazon.com/ebs/latest/userguide/snapshots-outposts.html#copy-amis) in
    # the *Amazon EBS User Guide*.
    #
    # Only one of `DestinationAvailabilityZone`, `DestinationAvailabilityZoneId`, or
    # `DestinationOutpostArn` can be specified.
    property destination_outpost_arn : String | Nil

    # Specifies whether to copy your user-defined AMI tags to the new AMI.
    #
    # The following tags are not be copied:
    #
    # - System tags (prefixed with `aws:`)
    #
    # - For public and shared AMIs, user-defined tags that are attached by other Amazon Web Services
    # accounts
    #
    # Default: Your user-defined AMI tags are not copied.
    property copy_image_tags : Bool | Nil

    # The tags to apply to the new AMI and new snapshots. You can tag the AMI, the snapshots, or both.
    #
    # - To tag the new AMI, the value for `ResourceType` must be `image`.
    #
    # - To tag the new snapshots, the value for `ResourceType` must be `snapshot`. The same tag is
    # applied to all the new snapshots.
    #
    # If you specify other values for `ResourceType`, the request fails.
    #
    # To tag an AMI or snapshot after it has been created, see
    # [CreateTags](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTags.html).
    property tag_specifications : Array(TagSpecification) | Nil

    # Specify a completion duration, in 15 minute increments, to initiate a time-based AMI copy. The
    # specified completion duration applies to each of the snapshots associated with the AMI. Each
    # snapshot associated with the AMI will be completed within the specified completion duration,
    # with copy throughput automatically adjusted for each snapshot based on its size to meet the
    # timing target.
    #
    # If you do not specify a value, the AMI copy operation is completed on a best-effort basis.
    #
    # This parameter is not supported when copying an AMI to or from a Local Zone, or to an Outpost.
    #
    # For more information, see [Time-based copies for Amazon EBS snapshots and EBS-backed
    # AMIs](https://docs.aws.amazon.com/ebs/latest/userguide/time-based-copies.html).
    property snapshot_copy_completion_duration_minutes : Int64 | Nil

    # The Local Zone for the new AMI (for example, `cn-north-1-pkx-1a`).
    #
    # Only one of `DestinationAvailabilityZone`, `DestinationAvailabilityZoneId`, or
    # `DestinationOutpostArn` can be specified.
    property destination_availability_zone : String | Nil

    # The ID of the Local Zone for the new AMI (for example, `cnn1-pkx1-az1`).
    #
    # Only one of `DestinationAvailabilityZone`, `DestinationAvailabilityZoneId`, or
    # `DestinationOutpostArn` can be specified.
    property destination_availability_zone_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @name : String,
      @source_image_id : String,
      @source_region : String,
      @client_token : String | Nil = nil,
      @description : String | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @destination_outpost_arn : String | Nil = nil,
      @copy_image_tags : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @snapshot_copy_completion_duration_minutes : Int64 | Nil = nil,
      @destination_availability_zone : String | Nil = nil,
      @destination_availability_zone_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end

      params << {"#{prefix}Name", @name}

      params << {"#{prefix}SourceImageId", @source_image_id}

      params << {"#{prefix}SourceRegion", @source_region}

      if value = @destination_outpost_arn
        params << {"#{prefix}DestinationOutpostArn", value}
      end

      if value = @copy_image_tags
        params << {"#{prefix}CopyImageTags", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @snapshot_copy_completion_duration_minutes
        params << {"#{prefix}SnapshotCopyCompletionDurationMinutes", value.to_s}
      end

      if value = @destination_availability_zone
        params << {"#{prefix}DestinationAvailabilityZone", value}
      end

      if value = @destination_availability_zone_id
        params << {"#{prefix}DestinationAvailabilityZoneId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kmsKeyId']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")).not_nil!,
        source_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceImageId']")).not_nil!,
        source_region: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceRegion']")).not_nil!,
        destination_outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationOutpostArn']")),
        copy_image_tags: Core::XMLValue.bool(node.xpath_node("*[local-name()='CopyImageTags']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        snapshot_copy_completion_duration_minutes: Core::XMLValue.i64(node.xpath_node("*[local-name()='SnapshotCopyCompletionDurationMinutes']")),
        destination_availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationAvailabilityZone']")),
        destination_availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationAvailabilityZoneId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @client_token
        raise Core::ValidationError.new("ClientToken length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ClientToken length must be <= 128") if value.size > 128
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 255") if value.size > 255
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_token, @description, @encrypted, @kms_key_id, @name, @source_image_id, @source_region, @destination_outpost_arn, @copy_image_tags, @tag_specifications, @snapshot_copy_completion_duration_minutes, @destination_availability_zone, @destination_availability_zone_id, @dry_run)
  end
end
