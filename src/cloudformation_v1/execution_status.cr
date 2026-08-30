private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum ExecutionStatus
    Unavailable
    Available
    ExecuteInProgress
    ExecuteComplete
    ExecuteFailed
    Obsolete

    def self.to_json(e : ExecutionStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::ExecutionStatus::Unavailable       then "UNAVAILABLE"
              when ACF::ExecutionStatus::Available         then "AVAILABLE"
              when ACF::ExecutionStatus::ExecuteInProgress then "EXECUTE_IN_PROGRESS"
              when ACF::ExecutionStatus::ExecuteComplete   then "EXECUTE_COMPLETE"
              when ACF::ExecutionStatus::ExecuteFailed     then "EXECUTE_FAILED"
              when ACF::ExecutionStatus::Obsolete          then "OBSOLETE"
              else
                raise Exception.new("unknown enum value for 'ExecutionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ExecutionStatus
      value = pull.read_string
      case value
      when "UNAVAILABLE"         then ACF::ExecutionStatus::Unavailable
      when "AVAILABLE"           then ACF::ExecutionStatus::Available
      when "EXECUTE_IN_PROGRESS" then ACF::ExecutionStatus::ExecuteInProgress
      when "EXECUTE_COMPLETE"    then ACF::ExecutionStatus::ExecuteComplete
      when "EXECUTE_FAILED"      then ACF::ExecutionStatus::ExecuteFailed
      when "OBSOLETE"            then ACF::ExecutionStatus::Obsolete
      else
        raise Exception.new("unknown enum value for 'ExecutionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ExecutionStatus::Unavailable       then "UNAVAILABLE"
      when ACF::ExecutionStatus::Available         then "AVAILABLE"
      when ACF::ExecutionStatus::ExecuteInProgress then "EXECUTE_IN_PROGRESS"
      when ACF::ExecutionStatus::ExecuteComplete   then "EXECUTE_COMPLETE"
      when ACF::ExecutionStatus::ExecuteFailed     then "EXECUTE_FAILED"
      when ACF::ExecutionStatus::Obsolete          then "OBSOLETE"
      else
        raise Exception.new("unknown enum value for 'ExecutionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ExecutionStatus?
      case key
      when "UNAVAILABLE"         then ACF::ExecutionStatus::Unavailable
      when "AVAILABLE"           then ACF::ExecutionStatus::Available
      when "EXECUTE_IN_PROGRESS" then ACF::ExecutionStatus::ExecuteInProgress
      when "EXECUTE_COMPLETE"    then ACF::ExecutionStatus::ExecuteComplete
      when "EXECUTE_FAILED"      then ACF::ExecutionStatus::ExecuteFailed
      when "OBSOLETE"            then ACF::ExecutionStatus::Obsolete
      else
        nil
      end
    end
  end
end
