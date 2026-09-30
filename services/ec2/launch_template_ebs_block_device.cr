private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a block device for an EBS volume.
  class LaunchTemplateEbsBlockDevice
    # Indicates whether the EBS volume is encrypted.
    property encrypted : Bool | Nil

    # Indicates whether the EBS volume is deleted on instance termination.
    property delete_on_termination : Bool | Nil

    # The number of I/O operations per second (IOPS) that the volume supports.
    property iops : Int32 | Nil

    # Identifier (key ID, key alias, key ARN, or alias ARN) of the customer managed KMS key to use for
    # EBS encryption.
    property kms_key_id : String | Nil

    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The size of the volume, in GiB.
    property volume_size : Int32 | Nil

    # The volume type.
    property volume_type : VolumeType | Nil

    # The throughput that the volume supports, in MiB/s.
    property throughput : Int32 | Nil

    # The Amazon EBS Provisioned Rate for Volume Initialization (volume initialization rate) specified
    # for the volume, in MiB/s. If no volume initialization rate was specified, the value is `null`.
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
        encrypted: Core::XMLValue.bool(node.xpath_node("*[local-name()='encrypted']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
        iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='iops']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='kmsKeyId']")),
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        volume_size: Core::XMLValue.i32(node.xpath_node("*[local-name()='volumeSize']")),
        volume_type: (n = node.xpath_node("*[local-name()='volumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
        throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='throughput']")),
        volume_initialization_rate: Core::XMLValue.i32(node.xpath_node("*[local-name()='volumeInitializationRate']")),
        ebs_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='ebsCardIndex']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@encrypted, @delete_on_termination, @iops, @kms_key_id, @snapshot_id, @volume_size, @volume_type, @throughput, @volume_initialization_rate, @ebs_card_index)
  end
end
