private alias AS = Amazonite::S3

module Amazonite::S3
  enum SseKmsEncryptedObjectsStatus
    Enabled
    Disabled

    def self.to_json(e : SseKmsEncryptedObjectsStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::SseKmsEncryptedObjectsStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::SseKmsEncryptedObjectsStatus::Enabled
      when "Disabled" then AS::SseKmsEncryptedObjectsStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'SseKmsEncryptedObjectsStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::SseKmsEncryptedObjectsStatus?
      case key
      when "Enabled"  then AS::SseKmsEncryptedObjectsStatus::Enabled
      when "Disabled" then AS::SseKmsEncryptedObjectsStatus::Disabled
      else
        nil
      end
    end
  end
end
