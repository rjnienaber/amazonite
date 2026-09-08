private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateImageRequest
    # The tags to apply to the AMI and snapshots on creation. You can tag the AMI, the snapshots, or
    # both.
    #
    # - To tag the AMI, the value for `ResourceType` must be `image`.
    #
    # - To tag the snapshots that are created of the root volume and of other Amazon EBS volumes that
    # are attached to the instance, the value for `ResourceType` must be `snapshot`. The same tag is
    # applied to all of the snapshots that are created.
    #
    # If you specify other values for `ResourceType`, the request fails.
    #
    # To tag an AMI or snapshot after it has been created, see
    # [CreateTags](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateTags.html).
    property tag_specifications : Array(TagSpecification) | Nil

    # Only supported for instances in Local Zones and for instances on Outposts that support local
    # snapshots. If the source instance is not in one of these locations, omit this parameter.
    #
    # The Amazon S3 location where the snapshots will be stored.
    #
    # - To create local snapshots in the same Local Zone or on the same Outpost as the source
    # instance, specify `local`.
    #
    # - To create regional snapshots in the parent Region of the Local Zone or Outpost, specify
    # `regional`.
    #
    # If the source instance is in a Local Zone and you omit this parameter, regional snapshots are
    # created in the parent Region of the Local Zone.
    #
    # If the source instance is on an Outpost that supports local snapshots, this parameter is
    # required. If you omit it, the request fails with an `InvalidParameterValue` error.
    #
    # Default: `regional` (for instances in Local Zones only)
    property snapshot_location : SnapshotLocationEnum | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the instance.
    property instance_id : String

    # A name for the new image.
    #
    # Constraints: 3-128 alphanumeric characters, parentheses (()), square brackets ([]), spaces ( ),
    # periods (.), slashes (/), dashes (-), single quotes ('), at-signs (@), or underscores(_)
    property name : String

    # A description for the new image.
    property description : String | Nil

    # Indicates whether or not the instance should be automatically rebooted before creating the
    # image. Specify one of the following values:
    #
    # - `true` - The instance is not rebooted before creating the image. This creates crash-consistent
    # snapshots that include only the data that has been written to the volumes at the time the
    # snapshots are created. Buffered data and data in memory that has not yet been written to the
    # volumes is not included in the snapshots.
    #
    # - `false` - The instance is rebooted before creating the image. This ensures that all buffered
    # data and data in memory is written to the volumes before the snapshots are created.
    #
    # Default: `false`
    property no_reboot : Bool | Nil

    # The block device mappings.
    #
    # When using the CreateImage action:
    #
    # - You can't change the volume size using the VolumeSize parameter. If you want a different
    # volume size, you must first change the volume size of the source instance.
    #
    # - You can't modify the encryption status of existing volumes or snapshots. To create an AMI with
    # volumes or snapshots that have a different encryption status (for example, where the source
    # volume and snapshots are unencrypted, and you want to create an AMI with encrypted volumes or
    # snapshots), copy the image instead.
    #
    # - The only option that can be changed for existing mappings or snapshots is
    # `DeleteOnTermination`.
    property block_device_mappings : Array(BlockDeviceMapping) | Nil

    def initialize(
      @instance_id : String,
      @name : String,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @snapshot_location : SnapshotLocationEnum | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @no_reboot : Bool | Nil = nil,
      @block_device_mappings : Array(BlockDeviceMapping) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @snapshot_location
        params << {"#{prefix}SnapshotLocation", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}InstanceId", @instance_id}

      params << {"#{prefix}Name", @name}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @no_reboot
        params << {"#{prefix}NoReboot", Core::QueryValue.bool(value)}
      end

      (@block_device_mappings || [] of BlockDeviceMapping).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}BlockDeviceMapping.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        snapshot_location: (n = node.xpath_node("*[local-name()='SnapshotLocation']")) ? AEC::SnapshotLocationEnum.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")).not_nil!,
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        no_reboot: Core::XMLValue.bool(node.xpath_node("*[local-name()='noReboot']")),
        block_device_mappings: node.xpath_nodes("*[local-name()='blockDeviceMapping']/*[local-name()='BlockDeviceMapping']").map { |n| BlockDeviceMapping.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 255") if value.size > 255
      end

      if value = @block_device_mappings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tag_specifications, @snapshot_location, @dry_run, @instance_id, @name, @description, @no_reboot, @block_device_mappings)
  end
end
