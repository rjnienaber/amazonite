private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ProtocolValue
    Gre

    def self.to_json(e : ProtocolValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::ProtocolValue::Gre then "gre"
              else
                raise Exception.new("unknown enum value for 'ProtocolValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ProtocolValue
      value = pull.read_string
      case value
      when "gre" then AEC::ProtocolValue::Gre
      else
        raise Exception.new("unknown enum value for 'ProtocolValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ProtocolValue::Gre then "gre"
      else
        raise Exception.new("unknown enum value for 'ProtocolValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ProtocolValue?
      case key
      when "gre" then AEC::ProtocolValue::Gre
      else
        nil
      end
    end
  end
end
