private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the ID format for a resource.
  class IdFormat
    # The date in UTC at which you are permanently switched over to using longer IDs. If a deadline is
    # not yet available for this resource type, this field is not returned.
    property deadline : Time | Nil

    # The type of resource.
    property resource : String | Nil

    # Indicates whether longer IDs (17-character IDs) are enabled for the resource.
    property use_long_ids : Bool | Nil

    def initialize(
      @deadline : Time | Nil = nil,
      @resource : String | Nil = nil,
      @use_long_ids : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @deadline
        params << {"#{prefix}Deadline", Core::QueryValue.time(value)}
      end

      if value = @resource
        params << {"#{prefix}Resource", value}
      end

      if value = @use_long_ids
        params << {"#{prefix}UseLongIds", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        deadline: Core::XMLValue.time(node.xpath_node("*[local-name()='deadline']")),
        resource: Core::XMLValue.string(node.xpath_node("*[local-name()='resource']")),
        use_long_ids: Core::XMLValue.bool(node.xpath_node("*[local-name()='useLongIds']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@deadline, @resource, @use_long_ids)
  end
end
