private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
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
  end
end
