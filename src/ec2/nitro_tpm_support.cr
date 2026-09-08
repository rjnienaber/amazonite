private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NitroTpmSupport
    Unsupported
    Supported

    def self.to_json(e : NitroTpmSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::NitroTpmSupport::Unsupported then "unsupported"
              when AEC::NitroTpmSupport::Supported   then "supported"
              else
                raise Exception.new("unknown enum value for 'NitroTpmSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NitroTpmSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::NitroTpmSupport::Unsupported
      when "supported"   then AEC::NitroTpmSupport::Supported
      else
        raise Exception.new("unknown enum value for 'NitroTpmSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NitroTpmSupport::Unsupported then "unsupported"
      when AEC::NitroTpmSupport::Supported   then "supported"
      else
        raise Exception.new("unknown enum value for 'NitroTpmSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NitroTpmSupport?
      case key
      when "unsupported" then AEC::NitroTpmSupport::Unsupported
      when "supported"   then AEC::NitroTpmSupport::Supported
      else
        nil
      end
    end
  end
end
