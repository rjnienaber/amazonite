private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSnapshotRequest
    # A description for the snapshot.
    property description : String | Nil

    # Only supported for volumes on Outposts. If the source volume is not on an Outpost, omit this
    # parameter.
    #
    # - To create the snapshot on the same Outpost as the source volume, specify the ARN of that
    # Outpost. The snapshot must be created on the same Outpost as the volume.
    #
    # - To create the snapshot in the parent Region of the Outpost, omit this parameter.
    #
    # For more information, see [Create local snapshots from volumes on an
    # Outpost](https://docs.aws.amazon.com/ebs/latest/userguide/snapshots-outposts.html#create-snapshot)
    # in the *Amazon EBS User Guide*.
    property outpost_arn : String | Nil

    # The ID of the Amazon EBS volume.
    property volume_id : String

    # The tags to apply to the snapshot during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # Only supported for volumes in Local Zones. If the source volume is not in a Local Zone, omit
    # this parameter.
    #
    # - To create a local snapshot in the same Local Zone as the source volume, specify `local`.
    #
    # - To create a regional snapshot in the parent Region of the Local Zone, specify `regional` or
    # omit this parameter.
    #
    # Default value: `regional`
    property location : SnapshotLocationEnum | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @volume_id : String,
      @description : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @location : SnapshotLocationEnum | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      params << {"#{prefix}VolumeId", @volume_id}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @location
        params << {"#{prefix}Location", value.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OutpostArn']")),
        volume_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VolumeId']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        location: (n = node.xpath_node("*[local-name()='Location']")) ? AEC::SnapshotLocationEnum.from_json_object_key?(n.content) : nil,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @outpost_arn, @volume_id, @tag_specifications, @location, @dry_run)
  end
end
