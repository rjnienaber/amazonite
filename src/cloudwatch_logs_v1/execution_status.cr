private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum ExecutionStatus
    Running
    InvalidQuery
    Complete
    Failed
    Timeout

    def self.to_json(e : ExecutionStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::ExecutionStatus
      value = pull.read_string
      case value
      when "Running"      then ACWL::ExecutionStatus::Running
      when "InvalidQuery" then ACWL::ExecutionStatus::InvalidQuery
      when "Complete"     then ACWL::ExecutionStatus::Complete
      when "Failed"       then ACWL::ExecutionStatus::Failed
      when "Timeout"      then ACWL::ExecutionStatus::Timeout
      else
        raise Exception.new("unknown enum value for 'ExecutionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACWL::ExecutionStatus?
      case key
      when "Running"      then ACWL::ExecutionStatus::Running
      when "InvalidQuery" then ACWL::ExecutionStatus::InvalidQuery
      when "Complete"     then ACWL::ExecutionStatus::Complete
      when "Failed"       then ACWL::ExecutionStatus::Failed
      when "Timeout"      then ACWL::ExecutionStatus::Timeout
      else
        nil
      end
    end
  end
end
