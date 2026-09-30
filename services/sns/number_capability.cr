private alias AS = Amazonite::Sns

module Amazonite::Sns
  # Enum listing out all supported number capabilities.
  enum NumberCapability
    Sms
    Mms
    Voice

    def self.to_json(e : NumberCapability, json : JSON::Builder) : Nil
      value = case e
              when AS::NumberCapability::Sms   then "SMS"
              when AS::NumberCapability::Mms   then "MMS"
              when AS::NumberCapability::Voice then "VOICE"
              else
                raise Exception.new("unknown enum value for 'NumberCapability' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::NumberCapability
      value = pull.read_string
      case value
      when "SMS"   then AS::NumberCapability::Sms
      when "MMS"   then AS::NumberCapability::Mms
      when "VOICE" then AS::NumberCapability::Voice
      else
        raise Exception.new("unknown enum value for 'NumberCapability' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::NumberCapability::Sms   then "SMS"
      when AS::NumberCapability::Mms   then "MMS"
      when AS::NumberCapability::Voice then "VOICE"
      else
        raise Exception.new("unknown enum value for 'NumberCapability' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::NumberCapability?
      case key
      when "SMS"   then AS::NumberCapability::Sms
      when "MMS"   then AS::NumberCapability::Mms
      when "VOICE" then AS::NumberCapability::Voice
      else
        nil
      end
    end
  end
end
