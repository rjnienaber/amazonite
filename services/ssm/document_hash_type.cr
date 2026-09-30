private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum DocumentHashType
    Sha256
    Sha1

    def self.to_json(e : DocumentHashType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentHashType
      value = pull.read_string
      case value
      when "Sha256" then AS::DocumentHashType::Sha256
      when "Sha1"   then AS::DocumentHashType::Sha1
      else
        raise Exception.new("unknown enum value for 'DocumentHashType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::DocumentHashType?
      case key
      when "Sha256" then AS::DocumentHashType::Sha256
      when "Sha1"   then AS::DocumentHashType::Sha1
      else
        nil
      end
    end
  end
end
