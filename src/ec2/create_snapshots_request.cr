private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSnapshotsRequest
    # A description propagated to every snapshot specified by the instance.
    property description : String | Nil

    # The instance to specify which volumes should be included in the snapshots.
    property instance_specification : InstanceSpecification

    # Only supported for instances on Outposts. If the source instance is not on an Outpost, omit this
    # parameter.
    #
    # - To create the snapshots on the same Outpost as the source instance, specify the ARN of that
    # Outpost. The snapshots must be created on the same Outpost as the instance.
    #
    # - To create the snapshots in the parent Region of the Outpost, omit this parameter.
    #
    # For more information, see [ Create local snapshots from volumes on an
    # Outpost](https://docs.aws.amazon.com/ebs/latest/userguide/snapshots-outposts.html#create-snapshot)
    # in the *Amazon EBS User Guide*.
    property outpost_arn : String | Nil

    # Tags to apply to every snapshot specified by the instance.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Copies the tags from the specified volume to corresponding snapshot.
    property copy_tags_from_source : CopyTagsFromSource | Nil

    # Only supported for instances in Local Zones. If the source instance is not in a Local Zone, omit
    # this parameter.
    #
    # - To create local snapshots in the same Local Zone as the source instance, specify `local`.
    #
    # - To create regional snapshots in the parent Region of the Local Zone, specify `regional` or
    # omit this parameter.
    #
    # Default value: `regional`
    property location : SnapshotLocationEnum | Nil

    def initialize(
      @instance_specification : InstanceSpecification,
      @description : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @copy_tags_from_source : CopyTagsFromSource | Nil = nil,
      @location : SnapshotLocationEnum | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      params.concat(@instance_specification.to_query_params("#{prefix}InstanceSpecification."))

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @copy_tags_from_source
        params << {"#{prefix}CopyTagsFromSource", value.to_json_object_key}
      end

      if value = @location
        params << {"#{prefix}Location", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        instance_specification: node.xpath_node("*[local-name()='InstanceSpecification']").try { |n| InstanceSpecification.from_xml(n) }.not_nil!,
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OutpostArn']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        copy_tags_from_source: (n = node.xpath_node("*[local-name()='CopyTagsFromSource']")) ? AEC::CopyTagsFromSource.from_json_object_key?(n.content) : nil,
        location: (n = node.xpath_node("*[local-name()='Location']")) ? AEC::SnapshotLocationEnum.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @instance_specification
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @instance_specification, @outpost_arn, @tag_specifications, @dry_run, @copy_tags_from_source, @location)
  end
end
