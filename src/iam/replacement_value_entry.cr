private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the list of replacement values for a single template parameter used when creating a
  # role from a role template.
  class ReplacementValueEntry
    # The list of replacement values for the template parameter.
    property values : Array(String) = [] of String

    def initialize(
      @values : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @values.each_with_index(1) do |item, i|
        params << {"#{prefix}Values.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        values: node.xpath_nodes("*[local-name()='Values']/*[local-name()='member']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @values
        raise Core::ValidationError.new("Values must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Values must have at most 20 item(s)") if value.size > 20
      end
    end

    def_equals_and_hash(@values)
  end
end
