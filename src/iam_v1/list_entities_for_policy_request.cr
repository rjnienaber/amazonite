private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListEntitiesForPolicyRequest
    property policy_arn : String

    property entity_filter : EntityType | Nil

    property path_prefix : String | Nil

    property policy_usage_filter : PolicyUsageType | Nil

    property marker : String | Nil

    property max_items : Int32 | Nil

    def initialize(
      @policy_arn : String,
      @entity_filter : EntityType | Nil = nil,
      @path_prefix : String | Nil = nil,
      @policy_usage_filter : PolicyUsageType | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PolicyArn", @policy_arn}

      if value = @entity_filter
        params << {"#{prefix}EntityFilter", value.to_json_object_key}
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
        policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyArn']")).not_nil!,
        entity_filter: (n = node.xpath_node("*[local-name()='EntityFilter']")) ? AI::EntityType.from_json_object_key?(n.content) : nil,
        path_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='PathPrefix']")),
        policy_usage_filter: (n = node.xpath_node("*[local-name()='PolicyUsageFilter']")) ? AI::PolicyUsageType.from_json_object_key?(n.content) : nil,
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end
  end
end
