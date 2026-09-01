private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum PermissionCheckResultType
    Allowed
    Denied
    Unsure

    def self.to_json(e : PermissionCheckResultType, json : JSON::Builder) : Nil
      value = case e
              when AI::PermissionCheckResultType::Allowed then "ALLOWED"
              when AI::PermissionCheckResultType::Denied  then "DENIED"
              when AI::PermissionCheckResultType::Unsure  then "UNSURE"
              else
                raise Exception.new("unknown enum value for 'PermissionCheckResultType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PermissionCheckResultType
      value = pull.read_string
      case value
      when "ALLOWED" then AI::PermissionCheckResultType::Allowed
      when "DENIED"  then AI::PermissionCheckResultType::Denied
      when "UNSURE"  then AI::PermissionCheckResultType::Unsure
      else
        raise Exception.new("unknown enum value for 'PermissionCheckResultType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::PermissionCheckResultType::Allowed then "ALLOWED"
      when AI::PermissionCheckResultType::Denied  then "DENIED"
      when AI::PermissionCheckResultType::Unsure  then "UNSURE"
      else
        raise Exception.new("unknown enum value for 'PermissionCheckResultType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::PermissionCheckResultType?
      case key
      when "ALLOWED" then AI::PermissionCheckResultType::Allowed
      when "DENIED"  then AI::PermissionCheckResultType::Denied
      when "UNSURE"  then AI::PermissionCheckResultType::Unsure
      else
        nil
      end
    end
  end
end
