private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum ActionStatus
    InProgress
    ClientError
    Failed
    Complete

    def self.to_json(e : ActionStatus, json : JSON::Builder) : Nil
      value = case e
              when ACWL::ActionStatus::InProgress  then "IN_PROGRESS"
              when ACWL::ActionStatus::ClientError then "CLIENT_ERROR"
              when ACWL::ActionStatus::Failed      then "FAILED"
              when ACWL::ActionStatus::Complete    then "COMPLETE"
              else
                raise Exception.new("unknown enum value for 'ActionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::ActionStatus
      value = pull.read_string
      case value
      when "IN_PROGRESS"  then ACWL::ActionStatus::InProgress
      when "CLIENT_ERROR" then ACWL::ActionStatus::ClientError
      when "FAILED"       then ACWL::ActionStatus::Failed
      when "COMPLETE"     then ACWL::ActionStatus::Complete
      else
        raise Exception.new("unknown enum value for 'ActionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::ActionStatus::InProgress  then "IN_PROGRESS"
      when ACWL::ActionStatus::ClientError then "CLIENT_ERROR"
      when ACWL::ActionStatus::Failed      then "FAILED"
      when ACWL::ActionStatus::Complete    then "COMPLETE"
      else
        raise Exception.new("unknown enum value for 'ActionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::ActionStatus?
      case key
      when "IN_PROGRESS"  then ACWL::ActionStatus::InProgress
      when "CLIENT_ERROR" then ACWL::ActionStatus::ClientError
      when "FAILED"       then ACWL::ActionStatus::Failed
      when "COMPLETE"     then ACWL::ActionStatus::Complete
      else
        nil
      end
    end
  end
end
