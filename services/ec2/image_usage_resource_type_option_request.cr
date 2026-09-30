private alias Core = Amazonite::Core

module Amazonite::EC2
  # The options that affect the scope of the report.
  class ImageUsageResourceTypeOptionRequest
    # The name of the option.
    #
    # Valid value: `version-depth` - The number of launch template versions to check.
    property option_name : String | Nil

    # A value for the specified option.
    #
    # Valid values: Integers between `1` and `10000`
    #
    # Default: `20`
    property option_values : Array(String) | Nil

    def initialize(
      @option_name : String | Nil = nil,
      @option_values : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @option_name
        params << {"#{prefix}OptionName", value}
      end

      (@option_values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}OptionValue.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        option_name: Core::XMLValue.string(node.xpath_node("*[local-name()='OptionName']")),
        option_values: node.xpath_nodes("*[local-name()='OptionValue']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@option_name, @option_values)
  end
end
