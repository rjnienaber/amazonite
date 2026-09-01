private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum PolicyOwnerEntityType
    User
    Role
    Group

    def self.to_json(e : PolicyOwnerEntityType, json : JSON::Builder) : Nil
      value = case e
              when AI::PolicyOwnerEntityType::User  then "USER"
              when AI::PolicyOwnerEntityType::Role  then "ROLE"
              when AI::PolicyOwnerEntityType::Group then "GROUP"
              else
                raise Exception.new("unknown enum value for 'PolicyOwnerEntityType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PolicyOwnerEntityType
      value = pull.read_string
      case value
      when "USER"  then AI::PolicyOwnerEntityType::User
      when "ROLE"  then AI::PolicyOwnerEntityType::Role
      when "GROUP" then AI::PolicyOwnerEntityType::Group
      else
        raise Exception.new("unknown enum value for 'PolicyOwnerEntityType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::PolicyOwnerEntityType::User  then "USER"
      when AI::PolicyOwnerEntityType::Role  then "ROLE"
      when AI::PolicyOwnerEntityType::Group then "GROUP"
      else
        raise Exception.new("unknown enum value for 'PolicyOwnerEntityType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::PolicyOwnerEntityType?
      case key
      when "USER"  then AI::PolicyOwnerEntityType::User
      when "ROLE"  then AI::PolicyOwnerEntityType::Role
      when "GROUP" then AI::PolicyOwnerEntityType::Group
      else
        nil
      end
    end
  end
end
