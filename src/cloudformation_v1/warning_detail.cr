private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  # The warnings generated for a specific resource for this generated template.
  class WarningDetail
    # The type of this warning. For more information, see [Resolve write-only
    # properties](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/generate-IaC-write-only-properties.html)
    # in the *CloudFormation User Guide*.
    #
    # - `MUTUALLY_EXCLUSIVE_PROPERTIES` - The resource requires mutually-exclusive write-only
    # properties. The IaC generator selects one set of mutually exclusive properties and converts the
    # included properties into parameters. The parameter names have a suffix `OneOf` and the parameter
    # descriptions indicate that the corresponding property can be replaced with other exclusive
    # properties.
    #
    # - `UNSUPPORTED_PROPERTIES` - Unsupported properties are present in the resource. One example of
    # unsupported properties would be a required write-only property that is an array, because a
    # parameter cannot be an array. Another example is an optional write-only property.
    #
    # - `MUTUALLY_EXCLUSIVE_TYPES` - One or more required write-only properties are found in the
    # resource, and the type of that property can be any of several types.
    #
    # Currently the resource and property reference documentation does not indicate if a property uses
    # a type of `oneOf` or `anyOf`. You need to look at the resource provider schema.
    property type : WarningType | Nil

    # The properties of the resource that are impacted by this warning.
    property properties : Array(WarningProperty) | Nil

    def initialize(
      @type : WarningType | Nil = nil,
      @properties : Array(WarningProperty) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      (@properties || [] of WarningProperty).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Properties.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? ACF::WarningType.from_json_object_key?(n.content) : nil,
        properties: node.xpath_nodes("*[local-name()='Properties']/*[local-name()='member']").map { |n| WarningProperty.from_xml(n) },
      )
    end
  end
end
