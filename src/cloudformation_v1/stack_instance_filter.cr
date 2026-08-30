private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The filter to apply to stack instances
  class StackInstanceFilter
    # The type of filter to apply.
    property name : StackInstanceFilterName | Nil

    # The status to filter by.
    property values : String | Nil

    def initialize(
      @name : StackInstanceFilterName | Nil = nil,
      @values : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @name
        params << {"#{prefix}Name", value.to_json_object_key}
      end

      if value = @values
        params << {"#{prefix}Values", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: (n = node.xpath_node("*[local-name()='Name']")) ? ACF::StackInstanceFilterName.from_json_object_key?(n.content) : nil,
        values: Core::XMLValue.string(node.xpath_node("*[local-name()='Values']")),
      )
    end

    def validate! : Nil
      if value = @values
        raise Core::ValidationError.new("Values length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Values length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Values does not match the required pattern") unless value.matches?(Regex.new("^\\S{1,128}$"))
      end
    end

    def_equals_and_hash(@name, @values)
  end
end
