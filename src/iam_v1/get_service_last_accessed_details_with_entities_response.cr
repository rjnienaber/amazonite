private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetServiceLastAccessedDetailsWithEntitiesResponse
    # The status of the job.
    property job_status : JobStatusType

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # report job was created.
    property job_creation_date : Time

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the
    # generated report job was completed or failed.
    #
    # This field is null if the job is still in progress, as indicated by a job status value of
    # `IN_PROGRESS`.
    property job_completion_date : Time

    # An `EntityDetailsList` object that contains details about when an IAM entity (user or role) used
    # group or policy permissions in an attempt to access the specified Amazon Web Services service.
    property entity_details_list : Array(EntityDetails) = [] of EntityDetails

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the `Marker` request parameter to retrieve
    # more items. Note that IAM might return fewer than the `MaxItems` number of results even when
    # there are more results available. We recommend that you check `IsTruncated` after every call to
    # ensure that you receive all your results.
    property is_truncated : Bool | Nil

    # When `IsTruncated` is `true`, this element is present and contains the value to use for the
    # `Marker` parameter in a subsequent pagination request.
    property marker : String | Nil

    # An object that contains details about the reason the operation failed.
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

    def validate! : Nil
      if value = @entity_details_list
        value.each(&.validate!)
      end

      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@job_status, @job_creation_date, @job_completion_date, @entity_details_list, @is_truncated, @marker, @error)
  end
end
