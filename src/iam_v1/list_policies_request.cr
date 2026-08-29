private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListPoliciesRequest
    property scope : PolicyScopeType | Nil

    property only_attached : Bool | Nil

    property path_prefix : String | Nil

    property policy_usage_filter : PolicyUsageType | Nil

    property marker : String | Nil

    property max_items : Int32 | Nil

    def initialize(
      @scope : PolicyScopeType | Nil = nil,
      @only_attached : Bool | Nil = nil,
      @path_prefix : String | Nil = nil,
      @policy_usage_filter : PolicyUsageType | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @scope
        params << {"#{prefix}Scope", value.to_json_object_key}
      end

      if value = @only_attached
        params << {"#{prefix}OnlyAttached", Core::QueryValue.bool(value)}
      end

      if value = @path_prefix
        params << {"#{prefix}PathPrefix", value}
      end

      if value = @policy_usage_filter
        params << {"#{prefix}PolicyUsageFilter", value.to_json_object_key}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        scope: (n = node.xpath_node("*[local-name()='Scope']")) ? AI::PolicyScopeType.from_json_object_key?(n.content) : nil,
        only_attached: Core::XMLValue.bool(node.xpath_node("*[local-name()='OnlyAttached']")),
        path_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='PathPrefix']")),
        policy_usage_filter: (n = node.xpath_node("*[local-name()='PolicyUsageFilter']")) ? AI::PolicyUsageType.from_json_object_key?(n.content) : nil,
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end
  end
end
