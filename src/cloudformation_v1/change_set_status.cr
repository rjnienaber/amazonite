private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum ChangeSetStatus
    CreatePending
    CreateInProgress
    CreateComplete
    DeletePending
    DeleteInProgress
    DeleteComplete
    DeleteFailed
    Failed

    def self.to_json(e : ChangeSetStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::ChangeSetStatus::CreatePending    then "CREATE_PENDING"
              when ACF::ChangeSetStatus::CreateInProgress then "CREATE_IN_PROGRESS"
              when ACF::ChangeSetStatus::CreateComplete   then "CREATE_COMPLETE"
              when ACF::ChangeSetStatus::DeletePending    then "DELETE_PENDING"
              when ACF::ChangeSetStatus::DeleteInProgress then "DELETE_IN_PROGRESS"
              when ACF::ChangeSetStatus::DeleteComplete   then "DELETE_COMPLETE"
              when ACF::ChangeSetStatus::DeleteFailed     then "DELETE_FAILED"
              when ACF::ChangeSetStatus::Failed           then "FAILED"
              else
                raise Exception.new("unknown enum value for 'ChangeSetStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ChangeSetStatus
      value = pull.read_string
      case value
      when "CREATE_PENDING"     then ACF::ChangeSetStatus::CreatePending
      when "CREATE_IN_PROGRESS" then ACF::ChangeSetStatus::CreateInProgress
      when "CREATE_COMPLETE"    then ACF::ChangeSetStatus::CreateComplete
      when "DELETE_PENDING"     then ACF::ChangeSetStatus::DeletePending
      when "DELETE_IN_PROGRESS" then ACF::ChangeSetStatus::DeleteInProgress
      when "DELETE_COMPLETE"    then ACF::ChangeSetStatus::DeleteComplete
      when "DELETE_FAILED"      then ACF::ChangeSetStatus::DeleteFailed
      when "FAILED"             then ACF::ChangeSetStatus::Failed
      else
        raise Exception.new("unknown enum value for 'ChangeSetStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ChangeSetStatus::CreatePending    then "CREATE_PENDING"
      when ACF::ChangeSetStatus::CreateInProgress then "CREATE_IN_PROGRESS"
      when ACF::ChangeSetStatus::CreateComplete   then "CREATE_COMPLETE"
      when ACF::ChangeSetStatus::DeletePending    then "DELETE_PENDING"
      when ACF::ChangeSetStatus::DeleteInProgress then "DELETE_IN_PROGRESS"
      when ACF::ChangeSetStatus::DeleteComplete   then "DELETE_COMPLETE"
      when ACF::ChangeSetStatus::DeleteFailed     then "DELETE_FAILED"
      when ACF::ChangeSetStatus::Failed           then "FAILED"
      else
        raise Exception.new("unknown enum value for 'ChangeSetStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ChangeSetStatus?
      case key
      when "CREATE_PENDING"     then ACF::ChangeSetStatus::CreatePending
      when "CREATE_IN_PROGRESS" then ACF::ChangeSetStatus::CreateInProgress
      when "CREATE_COMPLETE"    then ACF::ChangeSetStatus::CreateComplete
      when "DELETE_PENDING"     then ACF::ChangeSetStatus::DeletePending
      when "DELETE_IN_PROGRESS" then ACF::ChangeSetStatus::DeleteInProgress
      when "DELETE_COMPLETE"    then ACF::ChangeSetStatus::DeleteComplete
      when "DELETE_FAILED"      then ACF::ChangeSetStatus::DeleteFailed
      when "FAILED"             then ACF::ChangeSetStatus::Failed
      else
        nil
      end
    end
  end
end
