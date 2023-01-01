private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
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
  end
end
