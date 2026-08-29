private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum ExecutionStatus
    Running
    Succeeded
    Failed
    TimedOut
    Stopped

    def self.to_json(e : ExecutionStatus, json : JSON::Builder) : Nil
      value = case e
              when AL::ExecutionStatus::Running   then "RUNNING"
              when AL::ExecutionStatus::Succeeded then "SUCCEEDED"
              when AL::ExecutionStatus::Failed    then "FAILED"
              when AL::ExecutionStatus::TimedOut  then "TIMED_OUT"
              when AL::ExecutionStatus::Stopped   then "STOPPED"
              else
                raise Exception.new("unknown enum value for 'ExecutionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::ExecutionStatus
      value = pull.read_string
      case value
      when "RUNNING"   then AL::ExecutionStatus::Running
      when "SUCCEEDED" then AL::ExecutionStatus::Succeeded
      when "FAILED"    then AL::ExecutionStatus::Failed
      when "TIMED_OUT" then AL::ExecutionStatus::TimedOut
      when "STOPPED"   then AL::ExecutionStatus::Stopped
      else
        raise Exception.new("unknown enum value for 'ExecutionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::ExecutionStatus::Running   then "RUNNING"
      when AL::ExecutionStatus::Succeeded then "SUCCEEDED"
      when AL::ExecutionStatus::Failed    then "FAILED"
      when AL::ExecutionStatus::TimedOut  then "TIMED_OUT"
      when AL::ExecutionStatus::Stopped   then "STOPPED"
      else
        raise Exception.new("unknown enum value for 'ExecutionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::ExecutionStatus?
      case key
      when "RUNNING"   then AL::ExecutionStatus::Running
      when "SUCCEEDED" then AL::ExecutionStatus::Succeeded
      when "FAILED"    then AL::ExecutionStatus::Failed
      when "TIMED_OUT" then AL::ExecutionStatus::TimedOut
      when "STOPPED"   then AL::ExecutionStatus::Stopped
      else
        nil
      end
    end
  end
end
