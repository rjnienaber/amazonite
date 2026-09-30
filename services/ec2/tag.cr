private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a tag.
  class Tag
    # The key of the tag.
    #
    # Constraints: Tag keys are case-sensitive and accept a maximum of 127 Unicode characters. May not
    # begin with `aws:`.
    property key : String | Nil

    # The value of the tag.
    #
    # Constraints: Tag values are case-sensitive and accept a maximum of 256 Unicode characters.
    property value : String | Nil

    def initialize(
      @key : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @key
        params << {"#{prefix}Key", value}
      end

      if value = @value
        params << {"#{prefix}Value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='key']")),
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@key, @value)
  end
end
