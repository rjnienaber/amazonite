private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetOrganizationsAccessReportResponse
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
    property job_completion_date : Time | Nil

    # The number of services that the applicable SCPs allow account principals to access.
    property number_of_services_accessible : Int32 | Nil

    # The number of services that account principals are allowed but did not attempt to access.
    property number_of_services_not_accessed : Int32 | Nil

    # An object that contains details about the most recent attempt to access the service.
    property access_details : Array(AccessDetail) | Nil

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the `Marker` request parameter to retrieve
    # more items. Note that IAM might return fewer than the `MaxItems` number of results even when
    # there are more results available. We recommend that you check `IsTruncated` after every call to
    # ensure that you receive all your results.
    property is_truncated : Bool | Nil

    # When `IsTruncated` is `true`, this element is present and contains the value to use for the
    # `Marker` parameter in a subsequent pagination request.
    property marker : String | Nil

    property error_details : ErrorDetails | Nil

    def initialize(
      @job_status : JobStatusType,
      @job_creation_date : Time,
      @job_completion_date : Time | Nil = nil,
      @number_of_services_accessible : Int32 | Nil = nil,
      @number_of_services_not_accessed : Int32 | Nil = nil,
      @access_details : Array(AccessDetail) | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
      @error_details : ErrorDetails | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}JobStatus", @job_status.to_json_object_key}

      params << {"#{prefix}JobCreationDate", Core::QueryValue.time(@job_creation_date)}

      if value = @job_completion_date
        params << {"#{prefix}JobCompletionDate", Core::QueryValue.time(value)}
      end

      if value = @number_of_services_accessible
        params << {"#{prefix}NumberOfServicesAccessible", value.to_s}
      end

      if value = @number_of_services_not_accessed
        params << {"#{prefix}NumberOfServicesNotAccessed", value.to_s}
      end

      (@access_details || [] of AccessDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AccessDetails.member.#{i}."))
      end

      if value = @is_truncated
        params << {"#{prefix}IsTruncated", Core::QueryValue.bool(value)}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @error_details
        params.concat(value.to_query_params("#{prefix}ErrorDetails."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        job_status: (n = node.xpath_node("*[local-name()='JobStatus']")) ? AI::JobStatusType.from_json_object_key?(n.content) : nil.not_nil!,
        job_creation_date: Core::XMLValue.time(node.xpath_node("*[local-name()='JobCreationDate']")).not_nil!,
        job_completion_date: Core::XMLValue.time(node.xpath_node("*[local-name()='JobCompletionDate']")),
        number_of_services_accessible: Core::XMLValue.i32(node.xpath_node("*[local-name()='NumberOfServicesAccessible']")),
        number_of_services_not_accessed: Core::XMLValue.i32(node.xpath_node("*[local-name()='NumberOfServicesNotAccessed']")),
        access_details: node.xpath_nodes("*[local-name()='AccessDetails']/*[local-name()='member']").map { |n| AccessDetail.from_xml(n) },
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        error_details: node.xpath_node("*[local-name()='ErrorDetails']").try { |n| ErrorDetails.from_xml(n) },
      )
    end
  end
end
