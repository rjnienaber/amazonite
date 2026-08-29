private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum PermissionsBoundaryAttachmentType
    PermissionsBoundaryPolicy

    def self.to_json(e : PermissionsBoundaryAttachmentType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AI::PermissionsBoundaryAttachmentType
      value = pull.read_string
      case value
      when "PermissionsBoundaryPolicy" then AI::PermissionsBoundaryAttachmentType::PermissionsBoundaryPolicy
      else
        raise Exception.new("unknown enum value for 'PermissionsBoundaryAttachmentType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AI::PermissionsBoundaryAttachmentType?
      case key
      when "PermissionsBoundaryPolicy" then AI::PermissionsBoundaryAttachmentType::PermissionsBoundaryPolicy
      else
        nil
      end
    end
  end
end
