private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum S3TableIntegrationSourceStatus
    Active
    Unhealthy
    Failed
    DataSourceDeleteInProgress

    def self.to_json(e : S3TableIntegrationSourceStatus, json : JSON::Builder) : Nil
      value = case e
              when ACWL::S3TableIntegrationSourceStatus::Active                     then "ACTIVE"
              when ACWL::S3TableIntegrationSourceStatus::Unhealthy                  then "UNHEALTHY"
              when ACWL::S3TableIntegrationSourceStatus::Failed                     then "FAILED"
              when ACWL::S3TableIntegrationSourceStatus::DataSourceDeleteInProgress then "DATA_SOURCE_DELETE_IN_PROGRESS"
              else
                raise Exception.new("unknown enum value for 'S3TableIntegrationSourceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::S3TableIntegrationSourceStatus
      value = pull.read_string
      case value
      when "ACTIVE"                         then ACWL::S3TableIntegrationSourceStatus::Active
      when "UNHEALTHY"                      then ACWL::S3TableIntegrationSourceStatus::Unhealthy
      when "FAILED"                         then ACWL::S3TableIntegrationSourceStatus::Failed
      when "DATA_SOURCE_DELETE_IN_PROGRESS" then ACWL::S3TableIntegrationSourceStatus::DataSourceDeleteInProgress
      else
        raise Exception.new("unknown enum value for 'S3TableIntegrationSourceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::S3TableIntegrationSourceStatus::Active                     then "ACTIVE"
      when ACWL::S3TableIntegrationSourceStatus::Unhealthy                  then "UNHEALTHY"
      when ACWL::S3TableIntegrationSourceStatus::Failed                     then "FAILED"
      when ACWL::S3TableIntegrationSourceStatus::DataSourceDeleteInProgress then "DATA_SOURCE_DELETE_IN_PROGRESS"
      else
        raise Exception.new("unknown enum value for 'S3TableIntegrationSourceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::S3TableIntegrationSourceStatus?
      case key
      when "ACTIVE"                         then ACWL::S3TableIntegrationSourceStatus::Active
      when "UNHEALTHY"                      then ACWL::S3TableIntegrationSourceStatus::Unhealthy
      when "FAILED"                         then ACWL::S3TableIntegrationSourceStatus::Failed
      when "DATA_SOURCE_DELETE_IN_PROGRESS" then ACWL::S3TableIntegrationSourceStatus::DataSourceDeleteInProgress
      else
        nil
      end
    end
  end
end
