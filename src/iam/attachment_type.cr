private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum AttachmentType
    User
    Group
    Role

    def self.to_json(e : AttachmentType, json : JSON::Builder) : Nil
      value = case e
              when AI::AttachmentType::User  then "user"
              when AI::AttachmentType::Group then "group"
              when AI::AttachmentType::Role  then "role"
              else
                raise Exception.new("unknown enum value for 'AttachmentType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::AttachmentType
      value = pull.read_string
      case value
      when "user"  then AI::AttachmentType::User
      when "group" then AI::AttachmentType::Group
      when "role"  then AI::AttachmentType::Role
      else
        raise Exception.new("unknown enum value for 'AttachmentType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::AttachmentType::User  then "user"
      when AI::AttachmentType::Group then "group"
      when AI::AttachmentType::Role  then "role"
      else
        raise Exception.new("unknown enum value for 'AttachmentType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::AttachmentType?
      case key
      when "user"  then AI::AttachmentType::User
      when "group" then AI::AttachmentType::Group
      when "role"  then AI::AttachmentType::Role
      else
        nil
      end
    end
  end
end
