private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a resource that is not compliant with VPC encryption requirements.
  #
  # For more information, see [Enforce VPC encryption in
  # transit](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-encryption-controls.html) in the
  # *Amazon VPC User Guide*.
  class VpcEncryptionNonCompliantResource
    # The ID of the non-compliant resource.
    property id : String | Nil

    # The type of the non-compliant resource.
    property type : String | Nil

    # A description of the non-compliant resource.
    property description : String | Nil

    # Indicates whether the resource can be excluded from encryption enforcement.
    property is_excludable : Bool | Nil

    def initialize(
      @id : String | Nil = nil,
      @type : String | Nil = nil,
      @description : String | Nil = nil,
      @is_excludable : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @id
        params << {"#{prefix}Id", value}
      end

      if value = @type
        params << {"#{prefix}Type", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @is_excludable
        params << {"#{prefix}IsExcludable", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='id']")),
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='type']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        is_excludable: Core::XMLValue.bool(node.xpath_node("*[local-name()='isExcludable']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @type, @description, @is_excludable)
  end
end
