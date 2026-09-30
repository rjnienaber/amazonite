private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum DocumentPermissionType
    Share

    def self.to_json(e : DocumentPermissionType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentPermissionType
      value = pull.read_string
      case value
      when "Share" then AS::DocumentPermissionType::Share
      else
        raise Exception.new("unknown enum value for 'DocumentPermissionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::DocumentPermissionType?
      case key
      when "Share" then AS::DocumentPermissionType::Share
      else
        nil
      end
    end
  end
end
