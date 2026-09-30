private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum StackRefactorStatus
    CreateInProgress
    CreateComplete
    CreateFailed
    DeleteInProgress
    DeleteComplete
    DeleteFailed

    def self.to_json(e : StackRefactorStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackRefactorStatus::CreateInProgress then "CREATE_IN_PROGRESS"
              when ACF::StackRefactorStatus::CreateComplete   then "CREATE_COMPLETE"
              when ACF::StackRefactorStatus::CreateFailed     then "CREATE_FAILED"
              when ACF::StackRefactorStatus::DeleteInProgress then "DELETE_IN_PROGRESS"
              when ACF::StackRefactorStatus::DeleteComplete   then "DELETE_COMPLETE"
              when ACF::StackRefactorStatus::DeleteFailed     then "DELETE_FAILED"
              else
                raise Exception.new("unknown enum value for 'StackRefactorStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackRefactorStatus
      value = pull.read_string
      case value
      when "CREATE_IN_PROGRESS" then ACF::StackRefactorStatus::CreateInProgress
      when "CREATE_COMPLETE"    then ACF::StackRefactorStatus::CreateComplete
      when "CREATE_FAILED"      then ACF::StackRefactorStatus::CreateFailed
      when "DELETE_IN_PROGRESS" then ACF::StackRefactorStatus::DeleteInProgress
      when "DELETE_COMPLETE"    then ACF::StackRefactorStatus::DeleteComplete
      when "DELETE_FAILED"      then ACF::StackRefactorStatus::DeleteFailed
      else
        raise Exception.new("unknown enum value for 'StackRefactorStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackRefactorStatus::CreateInProgress then "CREATE_IN_PROGRESS"
      when ACF::StackRefactorStatus::CreateComplete   then "CREATE_COMPLETE"
      when ACF::StackRefactorStatus::CreateFailed     then "CREATE_FAILED"
      when ACF::StackRefactorStatus::DeleteInProgress then "DELETE_IN_PROGRESS"
      when ACF::StackRefactorStatus::DeleteComplete   then "DELETE_COMPLETE"
      when ACF::StackRefactorStatus::DeleteFailed     then "DELETE_FAILED"
      else
        raise Exception.new("unknown enum value for 'StackRefactorStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackRefactorStatus?
      case key
      when "CREATE_IN_PROGRESS" then ACF::StackRefactorStatus::CreateInProgress
      when "CREATE_COMPLETE"    then ACF::StackRefactorStatus::CreateComplete
      when "CREATE_FAILED"      then ACF::StackRefactorStatus::CreateFailed
      when "DELETE_IN_PROGRESS" then ACF::StackRefactorStatus::DeleteInProgress
      when "DELETE_COMPLETE"    then ACF::StackRefactorStatus::DeleteComplete
      when "DELETE_FAILED"      then ACF::StackRefactorStatus::DeleteFailed
      else
        nil
      end
    end
  end
end
