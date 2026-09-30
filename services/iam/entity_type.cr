private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum EntityType
    User
    Role
    Group
    LocalManagedPolicy
    AwsManagedPolicy

    def self.to_json(e : EntityType, json : JSON::Builder) : Nil
      value = case e
              when AI::EntityType::User               then "User"
              when AI::EntityType::Role               then "Role"
              when AI::EntityType::Group              then "Group"
              when AI::EntityType::LocalManagedPolicy then "LocalManagedPolicy"
              when AI::EntityType::AwsManagedPolicy   then "AWSManagedPolicy"
              else
                raise Exception.new("unknown enum value for 'EntityType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::EntityType
      value = pull.read_string
      case value
      when "User"               then AI::EntityType::User
      when "Role"               then AI::EntityType::Role
      when "Group"              then AI::EntityType::Group
      when "LocalManagedPolicy" then AI::EntityType::LocalManagedPolicy
      when "AWSManagedPolicy"   then AI::EntityType::AwsManagedPolicy
      else
        raise Exception.new("unknown enum value for 'EntityType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::EntityType::User               then "User"
      when AI::EntityType::Role               then "Role"
      when AI::EntityType::Group              then "Group"
      when AI::EntityType::LocalManagedPolicy then "LocalManagedPolicy"
      when AI::EntityType::AwsManagedPolicy   then "AWSManagedPolicy"
      else
        raise Exception.new("unknown enum value for 'EntityType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::EntityType?
      case key
      when "User"               then AI::EntityType::User
      when "Role"               then AI::EntityType::Role
      when "Group"              then AI::EntityType::Group
      when "LocalManagedPolicy" then AI::EntityType::LocalManagedPolicy
      when "AWSManagedPolicy"   then AI::EntityType::AwsManagedPolicy
      else
        nil
      end
    end
  end
end
