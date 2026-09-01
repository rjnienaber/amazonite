private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum StackRefactorExecutionStatus
    Unavailable
    Available
    Obsolete
    ExecuteInProgress
    ExecuteComplete
    ExecuteFailed
    RollbackInProgress
    RollbackComplete
    RollbackFailed

    def self.to_json(e : StackRefactorExecutionStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackRefactorExecutionStatus::Unavailable        then "UNAVAILABLE"
              when ACF::StackRefactorExecutionStatus::Available          then "AVAILABLE"
              when ACF::StackRefactorExecutionStatus::Obsolete           then "OBSOLETE"
              when ACF::StackRefactorExecutionStatus::ExecuteInProgress  then "EXECUTE_IN_PROGRESS"
              when ACF::StackRefactorExecutionStatus::ExecuteComplete    then "EXECUTE_COMPLETE"
              when ACF::StackRefactorExecutionStatus::ExecuteFailed      then "EXECUTE_FAILED"
              when ACF::StackRefactorExecutionStatus::RollbackInProgress then "ROLLBACK_IN_PROGRESS"
              when ACF::StackRefactorExecutionStatus::RollbackComplete   then "ROLLBACK_COMPLETE"
              when ACF::StackRefactorExecutionStatus::RollbackFailed     then "ROLLBACK_FAILED"
              else
                raise Exception.new("unknown enum value for 'StackRefactorExecutionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackRefactorExecutionStatus
      value = pull.read_string
      case value
      when "UNAVAILABLE"          then ACF::StackRefactorExecutionStatus::Unavailable
      when "AVAILABLE"            then ACF::StackRefactorExecutionStatus::Available
      when "OBSOLETE"             then ACF::StackRefactorExecutionStatus::Obsolete
      when "EXECUTE_IN_PROGRESS"  then ACF::StackRefactorExecutionStatus::ExecuteInProgress
      when "EXECUTE_COMPLETE"     then ACF::StackRefactorExecutionStatus::ExecuteComplete
      when "EXECUTE_FAILED"       then ACF::StackRefactorExecutionStatus::ExecuteFailed
      when "ROLLBACK_IN_PROGRESS" then ACF::StackRefactorExecutionStatus::RollbackInProgress
      when "ROLLBACK_COMPLETE"    then ACF::StackRefactorExecutionStatus::RollbackComplete
      when "ROLLBACK_FAILED"      then ACF::StackRefactorExecutionStatus::RollbackFailed
      else
        raise Exception.new("unknown enum value for 'StackRefactorExecutionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackRefactorExecutionStatus::Unavailable        then "UNAVAILABLE"
      when ACF::StackRefactorExecutionStatus::Available          then "AVAILABLE"
      when ACF::StackRefactorExecutionStatus::Obsolete           then "OBSOLETE"
      when ACF::StackRefactorExecutionStatus::ExecuteInProgress  then "EXECUTE_IN_PROGRESS"
      when ACF::StackRefactorExecutionStatus::ExecuteComplete    then "EXECUTE_COMPLETE"
      when ACF::StackRefactorExecutionStatus::ExecuteFailed      then "EXECUTE_FAILED"
      when ACF::StackRefactorExecutionStatus::RollbackInProgress then "ROLLBACK_IN_PROGRESS"
      when ACF::StackRefactorExecutionStatus::RollbackComplete   then "ROLLBACK_COMPLETE"
      when ACF::StackRefactorExecutionStatus::RollbackFailed     then "ROLLBACK_FAILED"
      else
        raise Exception.new("unknown enum value for 'StackRefactorExecutionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackRefactorExecutionStatus?
      case key
      when "UNAVAILABLE"          then ACF::StackRefactorExecutionStatus::Unavailable
      when "AVAILABLE"            then ACF::StackRefactorExecutionStatus::Available
      when "OBSOLETE"             then ACF::StackRefactorExecutionStatus::Obsolete
      when "EXECUTE_IN_PROGRESS"  then ACF::StackRefactorExecutionStatus::ExecuteInProgress
      when "EXECUTE_COMPLETE"     then ACF::StackRefactorExecutionStatus::ExecuteComplete
      when "EXECUTE_FAILED"       then ACF::StackRefactorExecutionStatus::ExecuteFailed
      when "ROLLBACK_IN_PROGRESS" then ACF::StackRefactorExecutionStatus::RollbackInProgress
      when "ROLLBACK_COMPLETE"    then ACF::StackRefactorExecutionStatus::RollbackComplete
      when "ROLLBACK_FAILED"      then ACF::StackRefactorExecutionStatus::RollbackFailed
      else
        nil
      end
    end
  end
end
