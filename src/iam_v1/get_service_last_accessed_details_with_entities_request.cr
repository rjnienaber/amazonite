private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetServiceLastAccessedDetailsWithEntitiesRequest
    property job_id : String

    property service_namespace : String

    property max_items : Int32 | Nil

    property marker : String | Nil

    def initialize(
      @job_id : String,
      @service_namespace : String,
      @max_items : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}JobId", @job_id}

      params << {"#{prefix}ServiceNamespace", @service_namespace}

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        job_id: Core::XMLValue.string(node.xpath_node("*[local-name()='JobId']")).not_nil!,
        service_namespace: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceNamespace']")).not_nil!,
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
