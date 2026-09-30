private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Contains information about the module from which the resource was created, if the resource was
  # created from a module included in the stack template.
  #
  # For more information about modules, see [Create reusable resource configurations that can be
  # included across templates with CloudFormation
  # modules](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/modules.html) in the
  # *CloudFormation User Guide*.
  class ModuleInfo
    # A concatenated list of the module type or types that contains the resource. Module types are
    # listed starting with the inner-most nested module, and separated by `/`.
    #
    # In the following example, the resource was created from a module of type
    # `AWS::First::Example::MODULE`, that's nested inside a parent module of type
    # `AWS::Second::Example::MODULE`.
    #
    # `AWS::First::Example::MODULE/AWS::Second::Example::MODULE`
    property type_hierarchy : String | Nil

    # A concatenated list of the logical IDs of the module or modules that contains the resource.
    # Modules are listed starting with the inner-most nested module, and separated by `/`.
    #
    # In the following example, the resource was created from a module, `moduleA`, that's nested
    # inside a parent module, `moduleB`.
    #
    # `moduleA/moduleB`
    #
    # For more information, see [Reference module resources in CloudFormation
    # templates](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/module-ref-resources.html)
    # in the *CloudFormation User Guide*.
    property logical_id_hierarchy : String | Nil

    def initialize(
      @type_hierarchy : String | Nil = nil,
      @logical_id_hierarchy : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type_hierarchy
        params << {"#{prefix}TypeHierarchy", value}
      end

      if value = @logical_id_hierarchy
        params << {"#{prefix}LogicalIdHierarchy", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type_hierarchy: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeHierarchy']")),
        logical_id_hierarchy: Core::XMLValue.string(node.xpath_node("*[local-name()='LogicalIdHierarchy']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type_hierarchy, @logical_id_hierarchy)
  end
end
