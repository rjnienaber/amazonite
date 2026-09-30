private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum QueryStatus
    Scheduled
    Running
    Complete
    Failed
    Cancelled
    Timeout
    Unknown

    def self.to_json(e : QueryStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::QueryStatus
      value = pull.read_string
      case value
      when "Scheduled" then ACWL::QueryStatus::Scheduled
      when "Running"   then ACWL::QueryStatus::Running
      when "Complete"  then ACWL::QueryStatus::Complete
      when "Failed"    then ACWL::QueryStatus::Failed
      when "Cancelled" then ACWL::QueryStatus::Cancelled
      when "Timeout"   then ACWL::QueryStatus::Timeout
      when "Unknown"   then ACWL::QueryStatus::Unknown
      else
        raise Exception.new("unknown enum value for 'QueryStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACWL::QueryStatus?
      case key
      when "Scheduled" then ACWL::QueryStatus::Scheduled
      when "Running"   then ACWL::QueryStatus::Running
      when "Complete"  then ACWL::QueryStatus::Complete
      when "Failed"    then ACWL::QueryStatus::Failed
      when "Cancelled" then ACWL::QueryStatus::Cancelled
      when "Timeout"   then ACWL::QueryStatus::Timeout
      when "Unknown"   then ACWL::QueryStatus::Unknown
      else
        nil
      end
    end
  end
end
