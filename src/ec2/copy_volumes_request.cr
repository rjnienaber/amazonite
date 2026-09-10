private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CopyVolumesRequest
    # The ID of the source EBS volume to copy.
    property source_volume_id : String

    # The number of I/O operations per second (IOPS) to provision for the volume copy. Required for
    # `io1` and `io2` volumes. Optional for `gp3` volumes. Omit for all other volume types. Full
    # provisioned IOPS performance can be achieved only once the volume copy is fully initialized.
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

    # The size of the volume copy, in GiBs. The size must be equal to or greater than the size of the
    # source volume. If not specified, the size defaults to the size of the source volume.
    #
    # Maximum supported sizes:
    #
    # - gp2: `16,384` GiB
    #
    # - gp3: `65,536` GiB
    #
    # - io1: `16,384` GiB
    #
    # - io2: `65,536` GiB
    #
    # - st1 and sc1: `16,384` GiB
    #
    # - standard: `1024` GiB
    property size : Int32 | Nil

    # The volume type for the volume copy. If not specified, the volume type defaults to `gp2`.
    property volume_type : VolumeType | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tags to apply to the volume copy during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # Indicates whether to enable Amazon EBS Multi-Attach for the volume copy. If you enable
    # Multi-Attach, you can attach the volume to up to 16 Nitro instances in the same Availability
    # Zone simultaneously. Supported with `io1` and `io2` volumes only. For more information, see [
    # Amazon EBS
    # Multi-Attach](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volumes-multi.html).
    property multi_attach_enabled : Bool | Nil

    # The throughput to provision for the volume copy, in MiB/s. Supported for `gp3` volumes only.
    # Omit for all other volume types. Full provisioned throughput performance can be achieved only
    # once the volume copy is fully initialized.
    #
    # Valid Range: `125 - 2000` MiB/s
    property throughput : Int32 | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [ Ensure
    # Idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Indicates whether to encrypt the volume copy. If the source volume is encrypted, the service
    # always encrypts the copy regardless of this value. Set to `true` to encrypt a copy of an
    # unencrypted source volume during the copy operation. If you set `Encrypted` to `true` but do not
    # specify `KmsKeyId`, the service uses the default KMS key for EBS encryption in your account.
    property encrypted : Bool | Nil

    # The identifier of the KMS key to use for encryption of the volume copy. Specify a symmetric
    # encryption KMS key. You can specify a KMS key using the key ID, key ARN, alias name, or alias
    # ARN. If you set `Encrypted` to `true` but do not specify this parameter, the service uses the
    # default KMS key for EBS encryption in your account. For cross-account volume copies, this must
    # be a KMS key in the calling account.
    property kms_key_id : String | Nil

    def initialize(
      @source_volume_id : String,
      @iops : Int32 | Nil = nil,
      @size : Int32 | Nil = nil,
      @volume_type : VolumeType | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @multi_attach_enabled : Bool | Nil = nil,
      @throughput : Int32 | Nil = nil,
      @client_token : String | Nil = nil,
      @encrypted : Bool | Nil = nil,
      @kms_key_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SourceVolumeId", @source_volume_id}

      if value = @iops
        params << {"#{prefix}Iops", value.to_s}
      end

      if value = @size
        params << {"#{prefix}Size", value.to_s}
      end

      if value = @volume_type
        params << {"#{prefix}VolumeType", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
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

      if value = @encrypted
        params << {"#{prefix}Encrypted", Core::QueryValue.bool(value)}
      end

      if value = @kms_key_id
        params << {"#{prefix}KmsKeyId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceVolumeId']")).not_nil!,
        iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='Iops']")),
        size: Core::XMLValue.i32(node.xpath_node("*[local-name()='Size']")),
        volume_type: (n = node.xpath_node("*[local-name()='VolumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        multi_attach_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='MultiAttachEnabled']")),
        throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='Throughput']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='Encrypted']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyId']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@source_volume_id, @iops, @size, @volume_type, @dry_run, @tag_specifications, @multi_attach_enabled, @throughput, @client_token, @encrypted, @kms_key_id)
  end
end
