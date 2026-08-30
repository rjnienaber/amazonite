private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The status that operation results are filtered by.
  class OperationResultFilter
    # The type of filter to apply.
    property name : OperationResultFilterName | Nil

    # The value to filter by.
    property values : String | Nil

    def initialize(
      @name : OperationResultFilterName | Nil = nil,
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
        name: (n = node.xpath_node("*[local-name()='Name']")) ? ACF::OperationResultFilterName.from_json_object_key?(n.content) : nil,
        values: Core::XMLValue.string(node.xpath_node("*[local-name()='Values']")),
      )
    end

    def validate! : Nil
      if value = @values
        raise Core::ValidationError.new("Values length must be >= 6") if value.size < 6
        raise Core::ValidationError.new("Values length must be <= 9") if value.size > 9
        raise Core::ValidationError.new("Values does not match the required pattern") unless value.matches?(Regex.new("^\\S{6,9}$"))
      end
    end

    def_equals_and_hash(@name, @values)
  end
end
