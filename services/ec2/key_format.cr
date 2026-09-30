private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum KeyFormat
    Pem
    Ppk

    def self.to_json(e : KeyFormat, json : JSON::Builder) : Nil
      value = case e
              when AEC::KeyFormat::Pem then "pem"
              when AEC::KeyFormat::Ppk then "ppk"
              else
                raise Exception.new("unknown enum value for 'KeyFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::KeyFormat
      value = pull.read_string
      case value
      when "pem" then AEC::KeyFormat::Pem
      when "ppk" then AEC::KeyFormat::Ppk
      else
        raise Exception.new("unknown enum value for 'KeyFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::KeyFormat::Pem then "pem"
      when AEC::KeyFormat::Ppk then "ppk"
      else
        raise Exception.new("unknown enum value for 'KeyFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::KeyFormat?
      case key
      when "pem" then AEC::KeyFormat::Pem
      when "ppk" then AEC::KeyFormat::Ppk
      else
        nil
      end
    end
  end
end
