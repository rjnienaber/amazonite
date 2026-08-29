private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum PolicyUsageType
    PermissionsPolicy
    PermissionsBoundary

    def self.to_json(e : PolicyUsageType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PolicyUsageType
      value = pull.read_string
      case value
      when "PermissionsPolicy"   then AI::PolicyUsageType::PermissionsPolicy
      when "PermissionsBoundary" then AI::PolicyUsageType::PermissionsBoundary
      else
        raise Exception.new("unknown enum value for 'PolicyUsageType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AI::PolicyUsageType?
      case key
      when "PermissionsPolicy"   then AI::PolicyUsageType::PermissionsPolicy
      when "PermissionsBoundary" then AI::PolicyUsageType::PermissionsBoundary
      else
        nil
      end
    end
  end
end
