private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum DocumentFilterKey
    Name
    Owner
    PlatformTypes
    DocumentType

    def self.to_json(e : DocumentFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentFilterKey
      value = pull.read_string
      case value
      when "Name"          then AS::DocumentFilterKey::Name
      when "Owner"         then AS::DocumentFilterKey::Owner
      when "PlatformTypes" then AS::DocumentFilterKey::PlatformTypes
      when "DocumentType"  then AS::DocumentFilterKey::DocumentType
      else
        raise Exception.new("unknown enum value for 'DocumentFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
