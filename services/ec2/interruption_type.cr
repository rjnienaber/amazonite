private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InterruptionType
    Adhoc

    def self.to_json(e : InterruptionType, json : JSON::Builder) : Nil
      value = case e
              when AEC::InterruptionType::Adhoc then "adhoc"
              else
                raise Exception.new("unknown enum value for 'InterruptionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InterruptionType
      value = pull.read_string
      case value
      when "adhoc" then AEC::InterruptionType::Adhoc
      else
        raise Exception.new("unknown enum value for 'InterruptionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InterruptionType::Adhoc then "adhoc"
      else
        raise Exception.new("unknown enum value for 'InterruptionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InterruptionType?
      case key
      when "adhoc" then AEC::InterruptionType::Adhoc
      else
        nil
      end
    end
  end
end
