private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetServiceLastAccessedDetailsWithEntitiesResponse
    property job_status : JobStatusType

    property job_creation_date : Time

    property job_completion_date : Time

    property entity_details_list : Array(EntityDetails) = [] of EntityDetails

    property is_truncated : Bool | Nil

    property marker : String | Nil

    property error : ErrorDetails | Nil

    def initialize(
      @job_status : JobStatusType,
      @job_creation_date : Time,
      @job_completion_date : Time,
      @entity_details_list : Array(EntityDetails),
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
      @error : ErrorDetails | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}JobStatus", @job_status.to_json_object_key}

      params << {"#{prefix}JobCreationDate", Core::QueryValue.time(@job_creation_date)}

      params << {"#{prefix}JobCompletionDate", Core::QueryValue.time(@job_completion_date)}

      @entity_details_list.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EntityDetailsList.member.#{i}."))
      end

      if value = @is_truncated
        params << {"#{prefix}IsTruncated", Core::QueryValue.bool(value)}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @error
        params.concat(value.to_query_params("#{prefix}Error."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        job_status: ((n = node.xpath_node("*[local-name()='JobStatus']")) ? AI::JobStatusType.from_json_object_key?(n.content) : nil).not_nil!,
        job_creation_date: Core::XMLValue.time(node.xpath_node("*[local-name()='JobCreationDate']")).not_nil!,
        job_completion_date: Core::XMLValue.time(node.xpath_node("*[local-name()='JobCompletionDate']")).not_nil!,
        entity_details_list: node.xpath_nodes("*[local-name()='EntityDetailsList']/*[local-name()='member']").map { |n| EntityDetails.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        error: node.xpath_node("*[local-name()='Error']").try { |n| ErrorDetails.from_xml(n) },
      )
    end
  end
end
