private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateReplaceRootVolumeTaskRequest
    # The ID of the instance for which to replace the root volume.
    property instance_id : String

    # The ID of the snapshot from which to restore the replacement root volume. The specified snapshot
    # must be a snapshot that you previously created from the original root volume.
    #
    # If you want to restore the replacement root volume to the initial launch state, if you want to
    # restore the replacement root volume from an AMI, or if you want to replace the root volume with
    # a specified volume, omit this parameter.
    property snapshot_id : String | Nil

    # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If you
    # do not specify a client token, a randomly generated token is used for the request to ensure
    # idempotency. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tags to apply to the root volume replacement task.
    property tag_specifications : Array(TagSpecification) | Nil

    # The ID of the AMI to use to restore the root volume. The specified AMI must have the same
    # product code, billing information, architecture type, and virtualization type as that of the
    # instance.
    #
    # If you want to restore the replacement volume from a specific snapshot, if you want to restore
    # it to its launch state, or if you want to replace the root volume with a specified volume, omit
    # this parameter.
    property image_id : String | Nil

    # Indicates whether to automatically delete the original root volume after the root volume
    # replacement task completes. To delete the original root volume, specify `true`. If you choose to
    # keep the original root volume after the replacement task completes, you must manually delete it
    # when you no longer need it.
    property delete_replaced_root_volume : Bool | Nil

    # Specifies the Amazon EBS Provisioned Rate for Volume Initialization (volume initialization
    # rate), in MiB/s, at which to download the snapshot blocks from Amazon S3 to the replacement root
    # volume. This is also known as *volume initialization*. Specifying a volume initialization rate
    # ensures that the volume is initialized at a predictable and consistent rate after creation.
    #
    # Omit this parameter if:
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
    property volume_initialization_rate : Int64 | Nil

    # The ID of the volume to use as the replacement root volume. The specified volume must be in the
    # same Availability Zone as the instance, must be in the `available` state, and must not be
    # attached to an instance. If the original root volume is encrypted, the specified volume must
    # also be encrypted.
    #
    # If you want to restore the replacement root volume from a specific snapshot, an AMI, or to its
    # launch state, omit this parameter.
    property volume_id : String | Nil

    def initialize(
      @instance_id : String,
      @snapshot_id : String | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @image_id : String | Nil = nil,
      @delete_replaced_root_volume : Bool | Nil = nil,
      @volume_initialization_rate : Int64 | Nil = nil,
      @volume_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}InstanceId", @instance_id}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @image_id
        params << {"#{prefix}ImageId", value}
      end

      if value = @delete_replaced_root_volume
        params << {"#{prefix}DeleteReplacedRootVolume", Core::QueryValue.bool(value)}
      end

      if value = @volume_initialization_rate
        params << {"#{prefix}VolumeInitializationRate", value.to_s}
      end

      if value = @volume_id
        params << {"#{prefix}VolumeId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceId']")).not_nil!,
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")),
        delete_replaced_root_volume: Core::XMLValue.bool(node.xpath_node("*[local-name()='DeleteReplacedRootVolume']")),
        volume_initialization_rate: Core::XMLValue.i64(node.xpath_node("*[local-name()='VolumeInitializationRate']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VolumeId']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_id, @snapshot_id, @client_token, @dry_run, @tag_specifications, @image_id, @delete_replaced_root_volume, @volume_initialization_rate, @volume_id)
  end
end
