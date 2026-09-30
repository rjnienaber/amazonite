private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The options that affect the scope of the response.
  class ResourceTypeOption
    # The name of the option.
    #
    # - For `ec2:Instance`:
    #
    # Specify `state-name` - The current state of the EC2 instance.
    #
    # - For `ec2:LaunchTemplate`:
    #
    # Specify `version-depth` - The number of launch template versions to check, starting from the
    # most recent version.
    property option_name : ImageReferenceOptionName | Nil

    # A value for the specified option.
    #
    # - For `state-name`:
    #
    # - Valid values: `pending` | `running` | `shutting-down` | `terminated` | `stopping` | `stopped`
    #
    # - Default: All states
    #
    # - For `version-depth`:
    #
    # - Valid values: Integers between `1` and `10000`
    #
    # - Default: `10`
    property option_values : Array(String) | Nil

    def initialize(
      @option_name : ImageReferenceOptionName | Nil = nil,
      @option_values : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @option_name
        params << {"#{prefix}OptionName", value.to_json_object_key}
      end

      (@option_values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}OptionValue.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        option_name: (n = node.xpath_node("*[local-name()='OptionName']")) ? AEC::ImageReferenceOptionName.from_json_object_key?(n.content) : nil,
        option_values: node.xpath_nodes("*[local-name()='OptionValue']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@option_name, @option_values)
  end
end
