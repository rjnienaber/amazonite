private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the application-level health status for an instance.
  class ApplicationStatus
    # The current instance-level application status. This status is derived from application status
    # checks with `Aggregation` set to `included`. Possible values:
    #
    # - `ok` – All included checks passed.
    #
    # - `impaired` – At least one included check failed.
    #
    # - `initializing` – At least one included check is initializing, and no included check is
    # impaired.
    #
    # - `insufficient-data` – At least one included check has insufficient data, and no included check
    # is impaired or initializing.
    #
    # - `not-applicable` – No checks with `Aggregation` set to `included` apply to the instance.
    #
    # - `suppressed` – Application status reporting is suppressed for the instance.
    #
    # Checks with `Aggregation` set to `excluded` do not affect this value.
    property status : ApplicationStatusEnum | Nil

    # The date and time of the last status update.
    property status_time_stamp : Time | Nil

    # The date and time when the current status started.
    property status_since : Time | Nil

    # The date and time when application status reporting resumes after suppression.
    property resume_at : Time | Nil

    # Details about the application status checks for the instance.
    property details : Array(ApplicationStatusDetail) | Nil

    def initialize(
      @status : ApplicationStatusEnum | Nil = nil,
      @status_time_stamp : Time | Nil = nil,
      @status_since : Time | Nil = nil,
      @resume_at : Time | Nil = nil,
      @details : Array(ApplicationStatusDetail) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_time_stamp
        params << {"#{prefix}StatusTimeStamp", Core::QueryValue.time(value)}
      end

      if value = @status_since
        params << {"#{prefix}StatusSince", Core::QueryValue.time(value)}
      end

      if value = @resume_at
        params << {"#{prefix}ResumeAt", Core::QueryValue.time(value)}
      end

      (@details || [] of ApplicationStatusDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DetailSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::ApplicationStatusEnum.from_json_object_key?(n.content) : nil,
        status_time_stamp: Core::XMLValue.time(node.xpath_node("*[local-name()='statusTimeStamp']")),
        status_since: Core::XMLValue.time(node.xpath_node("*[local-name()='statusSince']")),
        resume_at: Core::XMLValue.time(node.xpath_node("*[local-name()='resumeAt']")),
        details: node.xpath_nodes("*[local-name()='detailSet']/*[local-name()='item']").map { |n| ApplicationStatusDetail.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @details
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@status, @status_time_stamp, @status_since, @resume_at, @details)
  end
end
