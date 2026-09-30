private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Describes the stack and the action that CloudFormation will perform on it if you execute the
  # stack refactor.
  class StackRefactorAction
    # The action that CloudFormation takes on the stack.
    property action : StackRefactorActionType | Nil

    # The type that will be evaluated in the `StackRefactorAction`. The following are potential
    # `Entity` types:
    #
    # - `Stack`
    #
    # - `Resource`
    property entity : StackRefactorActionEntity | Nil

    # The name or unique identifier associated with the physical instance of the resource.
    property physical_resource_id : String | Nil

    # A key-value pair that identifies the target resource. The key is an identifier property (for
    # example, `BucketName` for `AWS::S3::Bucket` resources) and the value is the actual property
    # value (for example, `MyS3Bucket`).
    property resource_identifier : String | Nil

    # A description to help you identify the refactor.
    property description : String | Nil

    # The detection type is one of the following:
    #
    # - Auto: CloudFormation figured out the mapping on its own.
    #
    # - Manual: The customer provided the mapping in the `ResourceMapping` parameter.
    property detection : StackRefactorDetection | Nil

    # The description of the detection type.
    property detection_reason : String | Nil

    # Assigns one or more tags to specified resources.
    property tag_resources : Array(Tag) | Nil

    # Removes one or more tags to specified resources.
    property untag_resources : Array(String) | Nil

    # The mapping for the stack resource `Source` and stack resource `Destination`.
    property resource_mapping : ResourceMapping | Nil

    def initialize(
      @action : StackRefactorActionType | Nil = nil,
      @entity : StackRefactorActionEntity | Nil = nil,
      @physical_resource_id : String | Nil = nil,
      @resource_identifier : String | Nil = nil,
      @description : String | Nil = nil,
      @detection : StackRefactorDetection | Nil = nil,
      @detection_reason : String | Nil = nil,
      @tag_resources : Array(Tag) | Nil = nil,
      @untag_resources : Array(String) | Nil = nil,
      @resource_mapping : ResourceMapping | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @action
        params << {"#{prefix}Action", value.to_json_object_key}
      end

      if value = @entity
        params << {"#{prefix}Entity", value.to_json_object_key}
      end

      if value = @physical_resource_id
        params << {"#{prefix}PhysicalResourceId", value}
      end

      if value = @resource_identifier
        params << {"#{prefix}ResourceIdentifier", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @detection
        params << {"#{prefix}Detection", value.to_json_object_key}
      end

      if value = @detection_reason
        params << {"#{prefix}DetectionReason", value}
      end

      (@tag_resources || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagResources.member.#{i}."))
      end

      (@untag_resources || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UntagResources.member.#{i}", item}
      end

      if value = @resource_mapping
        params.concat(value.to_query_params("#{prefix}ResourceMapping."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        action: (n = node.xpath_node("*[local-name()='Action']")) ? ACF::StackRefactorActionType.from_json_object_key?(n.content) : nil,
        entity: (n = node.xpath_node("*[local-name()='Entity']")) ? ACF::StackRefactorActionEntity.from_json_object_key?(n.content) : nil,
        physical_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PhysicalResourceId']")),
        resource_identifier: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceIdentifier']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        detection: (n = node.xpath_node("*[local-name()='Detection']")) ? ACF::StackRefactorDetection.from_json_object_key?(n.content) : nil,
        detection_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='DetectionReason']")),
        tag_resources: node.xpath_nodes("*[local-name()='TagResources']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
        untag_resources: node.xpath_nodes("*[local-name()='UntagResources']/*[local-name()='member']").map { |n| n.content },
        resource_mapping: node.xpath_node("*[local-name()='ResourceMapping']").try { |n| ResourceMapping.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @tag_resources
        value.each(&.validate!)
      end

      if value = @resource_mapping
        value.validate!
      end
    end

    def_equals_and_hash(@action, @entity, @physical_resource_id, @resource_identifier, @description, @detection, @detection_reason, @tag_resources, @untag_resources, @resource_mapping)
  end
end
