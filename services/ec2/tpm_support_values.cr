private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TpmSupportValues
    V20

    def self.to_json(e : TpmSupportValues, json : JSON::Builder) : Nil
      value = case e
              when AEC::TpmSupportValues::V20 then "v2.0"
              else
                raise Exception.new("unknown enum value for 'TpmSupportValues' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TpmSupportValues
      value = pull.read_string
      case value
      when "v2.0" then AEC::TpmSupportValues::V20
      else
        raise Exception.new("unknown enum value for 'TpmSupportValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TpmSupportValues::V20 then "v2.0"
      else
        raise Exception.new("unknown enum value for 'TpmSupportValues' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TpmSupportValues?
      case key
      when "v2.0" then AEC::TpmSupportValues::V20
      else
        nil
      end
    end
  end
end
