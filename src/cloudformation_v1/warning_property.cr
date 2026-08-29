private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # A specific property that is impacted by a warning.
  class WarningProperty
    # The path of the property. For example, if this is for the `S3Bucket` member of the `Code`
    # property, the property path would be `Code/S3Bucket`.
    property property_path : String | Nil

    # If `true`, the specified property is required.
    property required : Bool | Nil

    # The description of the property from the resource provider schema.
    property description : String | Nil

    def initialize(
      @property_path : String | Nil = nil,
      @required : Bool | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @property_path
        params << {"#{prefix}PropertyPath", value}
      end

      if value = @required
        params << {"#{prefix}Required", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        property_path: Core::XMLValue.string(node.xpath_node("*[local-name()='PropertyPath']")),
        required: Core::XMLValue.bool(node.xpath_node("*[local-name()='Required']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
      )
    end
  end
end
