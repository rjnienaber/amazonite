private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetOrganizationsAccessReportRequest
    property job_id : String

    property max_items : Int32 | Nil

    property marker : String | Nil

    property sort_key : SortKeyType | Nil

    def initialize(
      @job_id : String,
      @max_items : Int32 | Nil = nil,
      @marker : String | Nil = nil,
      @sort_key : SortKeyType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}JobId", @job_id}

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @sort_key
        params << {"#{prefix}SortKey", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        job_id: Core::XMLValue.string(node.xpath_node("*[local-name()='JobId']")).not_nil!,
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        sort_key: (n = node.xpath_node("*[local-name()='SortKey']")) ? AI::SortKeyType.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
