module Amazonite::CloudFormationV1
  # A set of criteria that CloudFormation uses to validate parameter values. Although other
  # constraints might be defined in the stack template, CloudFormation returns only the
  # `AllowedValues` property.
  class ParameterConstraints
    # A list of values that are permitted for a parameter.
    property allowed_values : Array(String) | Nil

    def initialize(
      @allowed_values : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@allowed_values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AllowedValues.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allowed_values: node.xpath_nodes("*[local-name()='AllowedValues']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allowed_values)
  end
end
