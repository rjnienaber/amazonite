private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVolumeRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the volume.
    property volume_id : String

    # The target size of the volume, in GiB. The target volume size must be greater than or equal to
    # the existing size of the volume.
    #
    # The following are the supported volumes sizes for each volume type:
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
    #
    # Default: The existing size is retained.
    property size : Int32 | Nil

    # The target EBS volume type of the volume. For more information, see [Amazon EBS volume
    # types](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volume-types.html) in the *Amazon
    # EBS User Guide*.
    #
    # Default: The existing type is retained.
    property volume_type : VolumeType | Nil

    # The target IOPS rate of the volume. This parameter is valid only for `gp3`, `io1`, and `io2`
    # volumes.
    #
    # The following are the supported values for each volume type:
    #
    # - `gp3`: 3,000 - 80,000 IOPS
    #
    # - `io1`: 100 - 64,000 IOPS
    #
    # - `io2`: 100 - 256,000 IOPS
    #
    # [ Instances built on the Nitro
    # System](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html) can
    # support up to 256,000 IOPS. Other instances can support up to 32,000 IOPS.
    #
    # Default: The existing value is retained if you keep the same volume type. If you change the
    # volume type to `io1`, `io2`, or `gp3`, the default is 3,000.
    property iops : Int32 | Nil

    # The target throughput of the volume, in MiB/s. This parameter is valid only for `gp3` volumes.
    # The maximum value is 2,000.
    #
    # Default: The existing value is retained if the source and target volume type is `gp3`.
    # Otherwise, the default value is 125.
    #
    # Valid Range: Minimum value of 125. Maximum value of 2,000.
    property throughput : Int32 | Nil

    # Specifies whether to enable Amazon EBS Multi-Attach. If you enable Multi-Attach, you can attach
    # the volume to up to 16 [ Nitro-based
    # instances](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html) in the
    # same Availability Zone. This parameter is supported with `io1` and `io2` volumes only. For more
    # information, see [ Amazon EBS
    # Multi-Attach](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volumes-multi.html) in the
    # *Amazon EBS User Guide*.
    property multi_attach_enabled : Bool | Nil

    def initialize(
      @volume_id : String,
      @dry_run : Bool | Nil = nil,
      @size : Int32 | Nil = nil,
      @volume_type : VolumeType | Nil = nil,
      @iops : Int32 | Nil = nil,
      @throughput : Int32 | Nil = nil,
      @multi_attach_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}VolumeId", @volume_id}

      if value = @size
        params << {"#{prefix}Size", value.to_s}
      end

      if value = @volume_type
        params << {"#{prefix}VolumeType", value.to_json_object_key}
      end

      if value = @iops
        params << {"#{prefix}Iops", value.to_s}
      end

      if value = @throughput
        params << {"#{prefix}Throughput", value.to_s}
      end

      if value = @multi_attach_enabled
        params << {"#{prefix}MultiAttachEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VolumeId']")).not_nil!,
        size: Core::XMLValue.i32(node.xpath_node("*[local-name()='Size']")),
        volume_type: (n = node.xpath_node("*[local-name()='VolumeType']")) ? AEC::VolumeType.from_json_object_key?(n.content) : nil,
        iops: Core::XMLValue.i32(node.xpath_node("*[local-name()='Iops']")),
        throughput: Core::XMLValue.i32(node.xpath_node("*[local-name()='Throughput']")),
        multi_attach_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='MultiAttachEnabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @volume_id, @size, @volume_type, @iops, @throughput, @multi_attach_enabled)
  end
end
