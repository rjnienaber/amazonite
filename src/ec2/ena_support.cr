private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EnaSupport
    Unsupported
    Supported
    Required

    def self.to_json(e : EnaSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::EnaSupport::Unsupported then "unsupported"
              when AEC::EnaSupport::Supported   then "supported"
              when AEC::EnaSupport::Required    then "required"
              else
                raise Exception.new("unknown enum value for 'EnaSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EnaSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::EnaSupport::Unsupported
      when "supported"   then AEC::EnaSupport::Supported
      when "required"    then AEC::EnaSupport::Required
      else
        raise Exception.new("unknown enum value for 'EnaSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EnaSupport::Unsupported then "unsupported"
      when AEC::EnaSupport::Supported   then "supported"
      when AEC::EnaSupport::Required    then "required"
      else
        raise Exception.new("unknown enum value for 'EnaSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EnaSupport?
      case key
      when "unsupported" then AEC::EnaSupport::Unsupported
      when "supported"   then AEC::EnaSupport::Supported
      when "required"    then AEC::EnaSupport::Required
      else
        nil
      end
    end
  end
end
