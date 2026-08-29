private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum PolicyIdentifierPolicyType
    Inline
    AwsManaged
    UserManaged
    PermissionBoundary
    Scp
    Rcp

    def self.to_json(e : PolicyIdentifierPolicyType, json : JSON::Builder) : Nil
      value = case e
              when AI::PolicyIdentifierPolicyType::Inline             then "inline"
              when AI::PolicyIdentifierPolicyType::AwsManaged         then "aws-managed"
              when AI::PolicyIdentifierPolicyType::UserManaged        then "user-managed"
              when AI::PolicyIdentifierPolicyType::PermissionBoundary then "permission-boundary"
              when AI::PolicyIdentifierPolicyType::Scp                then "scp"
              when AI::PolicyIdentifierPolicyType::Rcp                then "rcp"
              else
                raise Exception.new("unknown enum value for 'PolicyIdentifierPolicyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PolicyIdentifierPolicyType
      value = pull.read_string
      case value
      when "inline"              then AI::PolicyIdentifierPolicyType::Inline
      when "aws-managed"         then AI::PolicyIdentifierPolicyType::AwsManaged
      when "user-managed"        then AI::PolicyIdentifierPolicyType::UserManaged
      when "permission-boundary" then AI::PolicyIdentifierPolicyType::PermissionBoundary
      when "scp"                 then AI::PolicyIdentifierPolicyType::Scp
      when "rcp"                 then AI::PolicyIdentifierPolicyType::Rcp
      else
        raise Exception.new("unknown enum value for 'PolicyIdentifierPolicyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::PolicyIdentifierPolicyType::Inline             then "inline"
      when AI::PolicyIdentifierPolicyType::AwsManaged         then "aws-managed"
      when AI::PolicyIdentifierPolicyType::UserManaged        then "user-managed"
      when AI::PolicyIdentifierPolicyType::PermissionBoundary then "permission-boundary"
      when AI::PolicyIdentifierPolicyType::Scp                then "scp"
      when AI::PolicyIdentifierPolicyType::Rcp                then "rcp"
      else
        raise Exception.new("unknown enum value for 'PolicyIdentifierPolicyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::PolicyIdentifierPolicyType?
      case key
      when "inline"              then AI::PolicyIdentifierPolicyType::Inline
      when "aws-managed"         then AI::PolicyIdentifierPolicyType::AwsManaged
      when "user-managed"        then AI::PolicyIdentifierPolicyType::UserManaged
      when "permission-boundary" then AI::PolicyIdentifierPolicyType::PermissionBoundary
      when "scp"                 then AI::PolicyIdentifierPolicyType::Scp
      when "rcp"                 then AI::PolicyIdentifierPolicyType::Rcp
      else
        nil
      end
    end
  end
end
