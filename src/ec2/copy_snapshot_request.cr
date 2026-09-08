private alias Core = Amazonite::Core

module Amazonite::EC2
  class CopySnapshotRequest
    # A description for the EBS snapshot.
    property description : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost to which to copy the snapshot.
    #
    # Only supported when copying a snapshot to an Outpost.
    #
    # For more information, see [ Copy snapshots from an Amazon Web Services Region to an
    # Outpost](https://docs.aws.amazon.com/ebs/latest/userguide/snapshots-outposts.html#copy-snapshots)
    # in the *Amazon EBS User Guide*.
    property destination_outpost_arn : String | Nil

    # The destination Region to use in the `PresignedUrl` parameter of a snapshot copy operation. This
    # parameter is only valid for specifying the destination Region in a `PresignedUrl` parameter,
    # where it is required.
    #
    # The snapshot copy is sent to the regional endpoint that you sent the HTTP request to (for
    # example, `ec2.us-east-1.amazonaws.com`). With the CLI, this is specified using the `--region`
    # parameter or the default Region in your Amazon Web Services configuration file.
    property destination_region : String | Nil

    # To encrypt a copy of an unencrypted snapshot if encryption by default is not enabled, enable
    # encryption using this parameter. Otherwise, omit this parameter. Copies of encrypted snapshots
    # are encrypted, even if you omit this parameter and encryption by default is not enabled. You
    # cannot set this parameter to false. For more information, see [Amazon EBS
    # encryption](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-encryption.html) in the *Amazon
    # EBS User Guide*.
    property encrypted : Bool | Nil

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

    # When you copy an encrypted source snapshot using the Amazon EC2 Query API, you must supply a
    # pre-signed URL. This parameter is optional for unencrypted snapshots. For more information, see
    # [Query requests](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html).
    #
    # The `PresignedUrl` should use the snapshot source endpoint, the `CopySnapshot` action, and
    # include the `SourceRegion`, `SourceSnapshotId`, and `DestinationRegion` parameters. The
    # `PresignedUrl` must be signed using Amazon Web Services Signature Version 4. Because EBS
    # snapshots are stored in Amazon S3, the signing algorithm for this parameter uses the same logic
    # that is described in [ Authenticating Requests: Using Query Parameters (Amazon Web Services
    # Signature Version
    # 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html) in the *Amazon
    # S3 API Reference*. An invalid or improperly signed `PresignedUrl` will cause the copy operation
    # to fail asynchronously, and the snapshot will move to an `error` state.
    property presigned_url : String | Nil

    # The ID of the Region that contains the snapshot to be copied.
    property source_region : String

    # The ID of the EBS snapshot to copy.
    property source_snapshot_id : String

    # The tags to apply to the new snapshot.
    property tag_specifications : Array(TagSpecification) | Nil

    # Not supported when copying snapshots to or from Local Zones or Outposts.
    #
    # Specify a completion duration, in 15 minute increments, to initiate a time-based snapshot copy.
    # Time-based snapshot copy operations complete within the specified duration. For more
    # information, see [ Time-based
    # copies](https://docs.aws.amazon.com/ebs/latest/userguide/time-based-copies.html).
    #
    # If you do not specify a value, the snapshot copy operation is completed on a best-effort basis.
    property completion_duration_minutes : Int32 | Nil

    # The Local Zone, for example, `cn-north-1-pkx-1a` to which to copy the snapshot.
    #
    # Only supported when copying a snapshot to a Local Zone.
    property destination_availability_zone : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @source_region : String,
      @source_snapshot_id : String,
      @description : String | Nil = nil,
      @destination_outpost_arn : String | Nil = nil,
      @destination_region : String | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @presigned_url : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @completion_duration_minutes : Int32 | Nil = nil,
      @destination_availability_zone : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @destination_outpost_arn
        params << {"#{prefix}DestinationOutpostArn", value}
      end

      if value = @destination_region
        params << {"#{prefix}DestinationRegion", value}
      end

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end

      if value = @presigned_url
        params << {"#{prefix}PresignedUrl", value}
      end

      params << {"#{prefix}SourceRegion", @source_region}

      params << {"#{prefix}SourceSnapshotId", @source_snapshot_id}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @completion_duration_minutes
        params << {"#{prefix}CompletionDurationMinutes", value.to_s}
      end

      if value = @destination_availability_zone
        params << {"#{prefix}DestinationAvailabilityZone", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        destination_outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationOutpostArn']")),
        destination_region: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationRegion']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kmsKeyId']")),
        presigned_url: Core::XMLValue.string(node.xpath_node("*[local-name()='presignedUrl']")),
        source_region: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceRegion']")).not_nil!,
        source_snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceSnapshotId']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        completion_duration_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='CompletionDurationMinutes']")),
        destination_availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationAvailabilityZone']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @completion_duration_minutes
        raise Core::ValidationError.new("CompletionDurationMinutes value must be >= 1") if value < 1
        raise Core::ValidationError.new("CompletionDurationMinutes value must be <= 2880") if value > 2880
      end
    end

    def_equals_and_hash(@description, @destination_outpost_arn, @destination_region, @encrypted, @kms_key_id, @presigned_url, @source_region, @source_snapshot_id, @tag_specifications, @completion_duration_minutes, @destination_availability_zone, @dry_run)
  end
end
