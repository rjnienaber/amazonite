private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum PolicySourceType
    User
    Group
    Role
    AwsManaged
    UserManaged
    Resource
    None

    def self.to_json(e : PolicySourceType, json : JSON::Builder) : Nil
      value = case e
              when AI::PolicySourceType::User        then "user"
              when AI::PolicySourceType::Group       then "group"
              when AI::PolicySourceType::Role        then "role"
              when AI::PolicySourceType::AwsManaged  then "aws-managed"
              when AI::PolicySourceType::UserManaged then "user-managed"
              when AI::PolicySourceType::Resource    then "resource"
              when AI::PolicySourceType::None        then "none"
              else
                raise Exception.new("unknown enum value for 'PolicySourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PolicySourceType
      value = pull.read_string
      case value
      when "user"         then AI::PolicySourceType::User
      when "group"        then AI::PolicySourceType::Group
      when "role"         then AI::PolicySourceType::Role
      when "aws-managed"  then AI::PolicySourceType::AwsManaged
      when "user-managed" then AI::PolicySourceType::UserManaged
      when "resource"     then AI::PolicySourceType::Resource
      when "none"         then AI::PolicySourceType::None
      else
        raise Exception.new("unknown enum value for 'PolicySourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::PolicySourceType::User        then "user"
      when AI::PolicySourceType::Group       then "group"
      when AI::PolicySourceType::Role        then "role"
      when AI::PolicySourceType::AwsManaged  then "aws-managed"
      when AI::PolicySourceType::UserManaged then "user-managed"
      when AI::PolicySourceType::Resource    then "resource"
      when AI::PolicySourceType::None        then "none"
      else
        raise Exception.new("unknown enum value for 'PolicySourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::PolicySourceType?
      case key
      when "user"         then AI::PolicySourceType::User
      when "group"        then AI::PolicySourceType::Group
      when "role"         then AI::PolicySourceType::Role
      when "aws-managed"  then AI::PolicySourceType::AwsManaged
      when "user-managed" then AI::PolicySourceType::UserManaged
      when "resource"     then AI::PolicySourceType::Resource
      when "none"         then AI::PolicySourceType::None
      else
        nil
      end
    end
  end
end
