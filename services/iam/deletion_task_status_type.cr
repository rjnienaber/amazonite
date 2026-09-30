private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum DeletionTaskStatusType
    Succeeded
    InProgress
    Failed
    NotStarted

    def self.to_json(e : DeletionTaskStatusType, json : JSON::Builder) : Nil
      value = case e
              when AI::DeletionTaskStatusType::Succeeded  then "SUCCEEDED"
              when AI::DeletionTaskStatusType::InProgress then "IN_PROGRESS"
              when AI::DeletionTaskStatusType::Failed     then "FAILED"
              when AI::DeletionTaskStatusType::NotStarted then "NOT_STARTED"
              else
                raise Exception.new("unknown enum value for 'DeletionTaskStatusType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::DeletionTaskStatusType
      value = pull.read_string
      case value
      when "SUCCEEDED"   then AI::DeletionTaskStatusType::Succeeded
      when "IN_PROGRESS" then AI::DeletionTaskStatusType::InProgress
      when "FAILED"      then AI::DeletionTaskStatusType::Failed
      when "NOT_STARTED" then AI::DeletionTaskStatusType::NotStarted
      else
        raise Exception.new("unknown enum value for 'DeletionTaskStatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::DeletionTaskStatusType::Succeeded  then "SUCCEEDED"
      when AI::DeletionTaskStatusType::InProgress then "IN_PROGRESS"
      when AI::DeletionTaskStatusType::Failed     then "FAILED"
      when AI::DeletionTaskStatusType::NotStarted then "NOT_STARTED"
      else
        raise Exception.new("unknown enum value for 'DeletionTaskStatusType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::DeletionTaskStatusType?
      case key
      when "SUCCEEDED"   then AI::DeletionTaskStatusType::Succeeded
      when "IN_PROGRESS" then AI::DeletionTaskStatusType::InProgress
      when "FAILED"      then AI::DeletionTaskStatusType::Failed
      when "NOT_STARTED" then AI::DeletionTaskStatusType::NotStarted
      else
        nil
      end
    end
  end
end
