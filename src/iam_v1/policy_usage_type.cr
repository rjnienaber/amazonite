private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  # The policy usage type that indicates whether the policy is used as a permissions policy or as
  # the permissions boundary for an entity.
  #
  # For more information about permissions boundaries, see [Permissions boundaries for IAM
  # identities ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
  # in the *IAM User Guide*.
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
