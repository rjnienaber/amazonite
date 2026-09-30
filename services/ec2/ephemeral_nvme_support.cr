private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EphemeralNvmeSupport
    Unsupported
    Supported
    Required

    def self.to_json(e : EphemeralNvmeSupport, json : JSON::Builder) : Nil
      value = case e
              when AEC::EphemeralNvmeSupport::Unsupported then "unsupported"
              when AEC::EphemeralNvmeSupport::Supported   then "supported"
              when AEC::EphemeralNvmeSupport::Required    then "required"
              else
                raise Exception.new("unknown enum value for 'EphemeralNvmeSupport' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EphemeralNvmeSupport
      value = pull.read_string
      case value
      when "unsupported" then AEC::EphemeralNvmeSupport::Unsupported
      when "supported"   then AEC::EphemeralNvmeSupport::Supported
      when "required"    then AEC::EphemeralNvmeSupport::Required
      else
        raise Exception.new("unknown enum value for 'EphemeralNvmeSupport' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EphemeralNvmeSupport::Unsupported then "unsupported"
      when AEC::EphemeralNvmeSupport::Supported   then "supported"
      when AEC::EphemeralNvmeSupport::Required    then "required"
      else
        raise Exception.new("unknown enum value for 'EphemeralNvmeSupport' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EphemeralNvmeSupport?
      case key
      when "unsupported" then AEC::EphemeralNvmeSupport::Unsupported
      when "supported"   then AEC::EphemeralNvmeSupport::Supported
      when "required"    then AEC::EphemeralNvmeSupport::Required
      else
        nil
      end
    end
  end
end
