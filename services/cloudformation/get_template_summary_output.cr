private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The output for the GetTemplateSummary action.
  class GetTemplateSummaryOutput
    # A list of parameter declarations that describe various properties for each parameter.
    property parameters : Array(ParameterDeclaration) | Nil

    # The value that's defined in the `Description` property of the template.
    property description : String | Nil

    # The capabilities found within the template. If your template contains IAM resources, you must
    # specify the `CAPABILITY_IAM` or `CAPABILITY_NAMED_IAM` value for this parameter when you use the
    # CreateStack or UpdateStack actions with your template; otherwise, those actions return an
    # `InsufficientCapabilities` error.
    #
    # For more information, see [Acknowledging IAM resources in CloudFormation
    # templates](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities).
    property capabilities : Array(Capability) | Nil

    # The list of resources that generated the values in the `Capabilities` response element.
    property capabilities_reason : String | Nil

    # A list of all the template resource types that are defined in the template, such as
    # `AWS::EC2::Instance`, `AWS::Dynamo::Table`, and `Custom::MyCustomInstance`.
    property resource_types : Array(String) | Nil

    # The Amazon Web Services template format version, which identifies the capabilities of the
    # template.
    property version : String | Nil

    # The value that's defined for the `Metadata` property of the template.
    property metadata : String | Nil

    # A list of the transforms that are declared in the template.
    property declared_transforms : Array(String) | Nil

    # A list of resource identifier summaries that describe the target resources of an import
    # operation and the properties you can provide during the import to identify the target resources.
    # For example, `BucketName` is a possible identifier property for an `AWS::S3::Bucket` resource.
    property resource_identifier_summaries : Array(ResourceIdentifierSummary) | Nil

    # An object that contains any warnings returned.
    property warnings : Warnings | Nil

    def initialize(
      @parameters : Array(ParameterDeclaration) | Nil = nil,
      @description : String | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @capabilities_reason : String | Nil = nil,
      @resource_types : Array(String) | Nil = nil,
      @version : String | Nil = nil,
      @metadata : String | Nil = nil,
      @declared_transforms : Array(String) | Nil = nil,
      @resource_identifier_summaries : Array(ResourceIdentifierSummary) | Nil = nil,
      @warnings : Warnings | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@parameters || [] of ParameterDeclaration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Parameters.member.#{i}."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@capabilities || [] of Capability).each_with_index(1) do |item, i|
        params << {"#{prefix}Capabilities.member.#{i}", item.to_json_object_key}
      end

      if value = @capabilities_reason
        params << {"#{prefix}CapabilitiesReason", value}
      end

      (@resource_types || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceTypes.member.#{i}", item}
      end

      if value = @version
        params << {"#{prefix}Version", value}
      end

      if value = @metadata
        params << {"#{prefix}Metadata", value}
      end

      (@declared_transforms || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DeclaredTransforms.member.#{i}", item}
      end

      (@resource_identifier_summaries || [] of ResourceIdentifierSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ResourceIdentifierSummaries.member.#{i}."))
      end

      if value = @warnings
        params.concat(value.to_query_params("#{prefix}Warnings."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| ParameterDeclaration.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        capabilities_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='CapabilitiesReason']")),
        resource_types: node.xpath_nodes("*[local-name()='ResourceTypes']/*[local-name()='member']").map { |n| n.content },
        version: Core::XMLValue.string(node.xpath_node("*[local-name()='Version']")),
        metadata: Core::XMLValue.string(node.xpath_node("*[local-name()='Metadata']")),
        declared_transforms: node.xpath_nodes("*[local-name()='DeclaredTransforms']/*[local-name()='member']").map { |n| n.content },
        resource_identifier_summaries: node.xpath_nodes("*[local-name()='ResourceIdentifierSummaries']/*[local-name()='member']").map { |n| ResourceIdentifierSummary.from_xml(n) },
        warnings: node.xpath_node("*[local-name()='Warnings']").try { |n| Warnings.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @parameters
        value.each(&.validate!)
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Description length must be <= 1024") if value.size > 1024
      end

      if value = @resource_identifier_summaries
        value.each(&.validate!)
      end

      if value = @warnings
        value.validate!
      end
    end

    def_equals_and_hash(@parameters, @description, @capabilities, @capabilities_reason, @resource_types, @version, @metadata, @declared_transforms, @resource_identifier_summaries, @warnings)
  end
end
