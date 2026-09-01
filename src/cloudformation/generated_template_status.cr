private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum GeneratedTemplateStatus
    CreatePending
    UpdatePending
    DeletePending
    CreateInProgress
    UpdateInProgress
    DeleteInProgress
    Failed
    Complete

    def self.to_json(e : GeneratedTemplateStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::GeneratedTemplateStatus::CreatePending    then "CREATE_PENDING"
              when ACF::GeneratedTemplateStatus::UpdatePending    then "UPDATE_PENDING"
              when ACF::GeneratedTemplateStatus::DeletePending    then "DELETE_PENDING"
              when ACF::GeneratedTemplateStatus::CreateInProgress then "CREATE_IN_PROGRESS"
              when ACF::GeneratedTemplateStatus::UpdateInProgress then "UPDATE_IN_PROGRESS"
              when ACF::GeneratedTemplateStatus::DeleteInProgress then "DELETE_IN_PROGRESS"
              when ACF::GeneratedTemplateStatus::Failed           then "FAILED"
              when ACF::GeneratedTemplateStatus::Complete         then "COMPLETE"
              else
                raise Exception.new("unknown enum value for 'GeneratedTemplateStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::GeneratedTemplateStatus
      value = pull.read_string
      case value
      when "CREATE_PENDING"     then ACF::GeneratedTemplateStatus::CreatePending
      when "UPDATE_PENDING"     then ACF::GeneratedTemplateStatus::UpdatePending
      when "DELETE_PENDING"     then ACF::GeneratedTemplateStatus::DeletePending
      when "CREATE_IN_PROGRESS" then ACF::GeneratedTemplateStatus::CreateInProgress
      when "UPDATE_IN_PROGRESS" then ACF::GeneratedTemplateStatus::UpdateInProgress
      when "DELETE_IN_PROGRESS" then ACF::GeneratedTemplateStatus::DeleteInProgress
      when "FAILED"             then ACF::GeneratedTemplateStatus::Failed
      when "COMPLETE"           then ACF::GeneratedTemplateStatus::Complete
      else
        raise Exception.new("unknown enum value for 'GeneratedTemplateStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::GeneratedTemplateStatus::CreatePending    then "CREATE_PENDING"
      when ACF::GeneratedTemplateStatus::UpdatePending    then "UPDATE_PENDING"
      when ACF::GeneratedTemplateStatus::DeletePending    then "DELETE_PENDING"
      when ACF::GeneratedTemplateStatus::CreateInProgress then "CREATE_IN_PROGRESS"
      when ACF::GeneratedTemplateStatus::UpdateInProgress then "UPDATE_IN_PROGRESS"
      when ACF::GeneratedTemplateStatus::DeleteInProgress then "DELETE_IN_PROGRESS"
      when ACF::GeneratedTemplateStatus::Failed           then "FAILED"
      when ACF::GeneratedTemplateStatus::Complete         then "COMPLETE"
      else
        raise Exception.new("unknown enum value for 'GeneratedTemplateStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::GeneratedTemplateStatus?
      case key
      when "CREATE_PENDING"     then ACF::GeneratedTemplateStatus::CreatePending
      when "UPDATE_PENDING"     then ACF::GeneratedTemplateStatus::UpdatePending
      when "DELETE_PENDING"     then ACF::GeneratedTemplateStatus::DeletePending
      when "CREATE_IN_PROGRESS" then ACF::GeneratedTemplateStatus::CreateInProgress
      when "UPDATE_IN_PROGRESS" then ACF::GeneratedTemplateStatus::UpdateInProgress
      when "DELETE_IN_PROGRESS" then ACF::GeneratedTemplateStatus::DeleteInProgress
      when "FAILED"             then ACF::GeneratedTemplateStatus::Failed
      when "COMPLETE"           then ACF::GeneratedTemplateStatus::Complete
      else
        nil
      end
    end
  end
end
