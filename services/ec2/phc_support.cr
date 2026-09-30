private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PhcSupport
    Unsupported
    Supported

    def self.to_json(e : PhcSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::PhcSupport::Unsupported then "unsupported"
              when AEC::PhcSupport::Supported   then "supported"
              else
                raise Exception.new("unknown enum value for 'PhcSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PhcSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::PhcSupport::Unsupported
      when "supported"   then AEC::PhcSupport::Supported
      else
        raise Exception.new("unknown enum value for 'PhcSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PhcSupport::Unsupported then "unsupported"
      when AEC::PhcSupport::Supported   then "supported"
      else
        raise Exception.new("unknown enum value for 'PhcSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PhcSupport?
      case key
      when "unsupported" then AEC::PhcSupport::Unsupported
      when "supported"   then AEC::PhcSupport::Supported
      else
        nil
      end
    end
  end
end
