private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The output for ValidateTemplate action.
  class ValidateTemplateOutput
    # A list of `TemplateParameter` structures.
    property parameters : Array(TemplateParameter) | Nil

    # The description found within the template.
    property description : String | Nil

    # The capabilities found within the template. If your template contains IAM resources, you must
    # specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value for this parameter when you use the
    # CreateStack or UpdateStack actions with your template; otherwise, those actions return an
    # InsufficientCapabilities error.
    #
    # For more information, see [Acknowledging IAM resources in CloudFormation
    # templates](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/control-access-with-iam.html#using-iam-capabilities).
    property capabilities : Array(Capability) | Nil

    # The list of resources that generated the values in the `Capabilities` response element.
    property capabilities_reason : String | Nil

    # A list of the transforms that are declared in the template.
    property declared_transforms : Array(String) | Nil

    def initialize(
      @parameters : Array(TemplateParameter) | Nil = nil,
      @description : String | Nil = nil,
      @capabilities : Array(Capability) | Nil = nil,
      @capabilities_reason : String | Nil = nil,
      @declared_transforms : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@parameters || [] of TemplateParameter).each_with_index(1) do |item, i|
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

      (@declared_transforms || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DeclaredTransforms.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        parameters: node.xpath_nodes("*[local-name()='Parameters']/*[local-name()='member']").map { |n| TemplateParameter.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        capabilities: node.xpath_nodes("*[local-name()='Capabilities']/*[local-name()='member']").compact_map { |n| ACF::Capability.from_json_object_key?(n.content) },
        capabilities_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='CapabilitiesReason']")),
        declared_transforms: node.xpath_nodes("*[local-name()='DeclaredTransforms']/*[local-name()='member']").map { |n| n.content },
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
    end

    def_equals_and_hash(@parameters, @description, @capabilities, @capabilities_reason, @declared_transforms)
  end
end
