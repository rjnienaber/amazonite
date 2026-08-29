private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AccessType
    Standard
    JustInTime

    def self.to_json(e : AccessType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AccessType
      value = pull.read_string
      case value
      when "Standard"   then AS::AccessType::Standard
      when "JustInTime" then AS::AccessType::JustInTime
      else
        raise Exception.new("unknown enum value for 'AccessType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::AccessType?
      case key
      when "Standard"   then AS::AccessType::Standard
      when "JustInTime" then AS::AccessType::JustInTime
      else
        nil
      end
    end
  end
end
