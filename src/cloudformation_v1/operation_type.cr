private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum OperationType
    CreateStack
    UpdateStack
    DeleteStack
    ContinueRollback
    Rollback
    CreateChangeset

    def self.to_json(e : OperationType, json : JSON::Builder) : Nil
      value = case e
              when ACF::OperationType::CreateStack      then "CREATE_STACK"
              when ACF::OperationType::UpdateStack      then "UPDATE_STACK"
              when ACF::OperationType::DeleteStack      then "DELETE_STACK"
              when ACF::OperationType::ContinueRollback then "CONTINUE_ROLLBACK"
              when ACF::OperationType::Rollback         then "ROLLBACK"
              when ACF::OperationType::CreateChangeset  then "CREATE_CHANGESET"
              else
                raise Exception.new("unknown enum value for 'OperationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::OperationType
      value = pull.read_string
      case value
      when "CREATE_STACK"      then ACF::OperationType::CreateStack
      when "UPDATE_STACK"      then ACF::OperationType::UpdateStack
      when "DELETE_STACK"      then ACF::OperationType::DeleteStack
      when "CONTINUE_ROLLBACK" then ACF::OperationType::ContinueRollback
      when "ROLLBACK"          then ACF::OperationType::Rollback
      when "CREATE_CHANGESET"  then ACF::OperationType::CreateChangeset
      else
        raise Exception.new("unknown enum value for 'OperationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::OperationType::CreateStack      then "CREATE_STACK"
      when ACF::OperationType::UpdateStack      then "UPDATE_STACK"
      when ACF::OperationType::DeleteStack      then "DELETE_STACK"
      when ACF::OperationType::ContinueRollback then "CONTINUE_ROLLBACK"
      when ACF::OperationType::Rollback         then "ROLLBACK"
      when ACF::OperationType::CreateChangeset  then "CREATE_CHANGESET"
      else
        raise Exception.new("unknown enum value for 'OperationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::OperationType?
      case key
      when "CREATE_STACK"      then ACF::OperationType::CreateStack
      when "UPDATE_STACK"      then ACF::OperationType::UpdateStack
      when "DELETE_STACK"      then ACF::OperationType::DeleteStack
      when "CONTINUE_ROLLBACK" then ACF::OperationType::ContinueRollback
      when "ROLLBACK"          then ACF::OperationType::Rollback
      when "CREATE_CHANGESET"  then ACF::OperationType::CreateChangeset
      else
        nil
      end
    end
  end
end
