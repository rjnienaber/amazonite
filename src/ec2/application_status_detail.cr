private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the details of an application status check for an instance.
  class ApplicationStatusDetail
    # The ID of the application status check.
    property application_status_check_id : String | Nil

    # The date and time when the check was last updated.
    property check_update_time : Time | Nil

    # The aggregation setting for the application status check. When set to `included`, the result of
    # this check contributes to the instance-level application status. When set to `excluded`, the
    # check runs independently and does not affect the instance-level status.
    property aggregation : AggregationStatusEnum | Nil

    # The status of the individual application status check. Possible values:
    #
    # - `passed` – The check reached its success threshold.
    #
    # - `failed` – The check reached its failure threshold.
    #
    # - `initializing` – The check is initializing or has not reached a success or failure threshold.
    #
    # - `insufficient-data` – The check does not have enough data to determine a result.
    #
    # - `not-applicable` – The check does not apply to the instance.
    #
    # This value reflects the check result and is not affected by aggregation or suppression.
    property status : ApplicationStatusCheckEnum | Nil

    # The date and time of the last status update for this check.
    property status_time_stamp : Time | Nil

    # The date and time when the current status started for this check.
    property status_since : Time | Nil

    # The reason for the current status.
    property reason : ApplicationStatusReason | Nil

    def initialize(
      @application_status_check_id : String | Nil = nil,
      @check_update_time : Time | Nil = nil,
      @aggregation : AggregationStatusEnum | Nil = nil,
      @status : ApplicationStatusCheckEnum | Nil = nil,
      @status_time_stamp : Time | Nil = nil,
      @status_since : Time | Nil = nil,
      @reason : ApplicationStatusReason | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @application_status_check_id
        params << {"#{prefix}ApplicationStatusCheckId", value}
      end

      if value = @check_update_time
        params << {"#{prefix}CheckUpdateTime", Core::QueryValue.time(value)}
      end

      if value = @aggregation
        params << {"#{prefix}Aggregation", value.to_json_object_key}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_time_stamp
        params << {"#{prefix}StatusTimeStamp", Core::QueryValue.time(value)}
      end

      if value = @status_since
        params << {"#{prefix}StatusSince", Core::QueryValue.time(value)}
      end

      if value = @reason
        params.concat(value.to_query_params("#{prefix}Reason."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        application_status_check_id: Core::XMLValue.string(node.xpath_node("*[local-name()='applicationStatusCheckId']")),
        check_update_time: Core::XMLValue.time(node.xpath_node("*[local-name()='checkUpdateTime']")),
        aggregation: (n = node.xpath_node("*[local-name()='aggregation']")) ? AEC::AggregationStatusEnum.from_json_object_key?(n.content) : nil,
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::ApplicationStatusCheckEnum.from_json_object_key?(n.content) : nil,
        status_time_stamp: Core::XMLValue.time(node.xpath_node("*[local-name()='statusTimeStamp']")),
        status_since: Core::XMLValue.time(node.xpath_node("*[local-name()='statusSince']")),
        reason: node.xpath_node("*[local-name()='reason']").try { |n| ApplicationStatusReason.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @reason
        value.validate!
      end
    end

    def_equals_and_hash(@application_status_check_id, @check_update_time, @aggregation, @status, @status_time_stamp, @status_since, @reason)
  end
end
