private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NitroEnclavesSupport
    Unsupported
    Supported

    def self.to_json(e : NitroEnclavesSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::NitroEnclavesSupport::Unsupported then "unsupported"
              when AEC::NitroEnclavesSupport::Supported   then "supported"
              else
                raise Exception.new("unknown enum value for 'NitroEnclavesSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NitroEnclavesSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::NitroEnclavesSupport::Unsupported
      when "supported"   then AEC::NitroEnclavesSupport::Supported
      else
        raise Exception.new("unknown enum value for 'NitroEnclavesSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NitroEnclavesSupport::Unsupported then "unsupported"
      when AEC::NitroEnclavesSupport::Supported   then "supported"
      else
        raise Exception.new("unknown enum value for 'NitroEnclavesSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NitroEnclavesSupport?
      case key
      when "unsupported" then AEC::NitroEnclavesSupport::Unsupported
      when "supported"   then AEC::NitroEnclavesSupport::Supported
      else
        nil
      end
    end
  end
end
