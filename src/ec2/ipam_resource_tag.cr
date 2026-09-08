private alias Core = Amazonite::Core

module Amazonite::EC2
  # The key/value combination of a tag assigned to the resource. Use the tag key in the filter name
  # and the tag value as the filter value. For example, to find all resources that have a tag with
  # the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and `TeamA` for
  # the filter value.
  class IpamResourceTag
    # The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag
    # with a specific key, regardless of the tag value.
    property key : String | Nil

    # The value of the tag.
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
