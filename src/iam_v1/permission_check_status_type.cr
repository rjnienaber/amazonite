private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum PermissionCheckStatusType
    Complete
    InProgress
    Failed

    def self.to_json(e : PermissionCheckStatusType, json : JSON::Builder) : Nil
      value = case e
              when AI::PermissionCheckStatusType::Complete   then "COMPLETE"
              when AI::PermissionCheckStatusType::InProgress then "IN_PROGRESS"
              when AI::PermissionCheckStatusType::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'PermissionCheckStatusType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PermissionCheckStatusType
      value = pull.read_string
      case value
      when "COMPLETE"    then AI::PermissionCheckStatusType::Complete
      when "IN_PROGRESS" then AI::PermissionCheckStatusType::InProgress
      when "FAILED"      then AI::PermissionCheckStatusType::Failed
      else
        raise Exception.new("unknown enum value for 'PermissionCheckStatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::PermissionCheckStatusType::Complete   then "COMPLETE"
      when AI::PermissionCheckStatusType::InProgress then "IN_PROGRESS"
      when AI::PermissionCheckStatusType::Failed     then "FAILED"
      else
        raise Exception.new("unknown enum value for 'PermissionCheckStatusType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::PermissionCheckStatusType?
      case key
      when "COMPLETE"    then AI::PermissionCheckStatusType::Complete
      when "IN_PROGRESS" then AI::PermissionCheckStatusType::InProgress
      when "FAILED"      then AI::PermissionCheckStatusType::Failed
      else
        nil
      end
    end
  end
end
