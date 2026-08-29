private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AttachmentHashType
    Sha256

    def self.to_json(e : AttachmentHashType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AttachmentHashType
      value = pull.read_string
      case value
      when "Sha256" then AS::AttachmentHashType::Sha256
      else
        raise Exception.new("unknown enum value for 'AttachmentHashType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::AttachmentHashType?
      case key
      when "Sha256" then AS::AttachmentHashType::Sha256
      else
        nil
      end
    end
  end
end
