private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AmdSevSnp
    Enabled
    Disabled

    def self.to_json(e : AmdSevSnp, json : JSON::Builder) : Nil
      value = case e
              when AEC::AmdSevSnp::Enabled  then "enabled"
              when AEC::AmdSevSnp::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'AmdSevSnp' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AmdSevSnp
      value = pull.read_string
      case value
      when "enabled"  then AEC::AmdSevSnp::Enabled
      when "disabled" then AEC::AmdSevSnp::Disabled
      else
        raise Exception.new("unknown enum value for 'AmdSevSnp' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AmdSevSnp::Enabled  then "enabled"
      when AEC::AmdSevSnp::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'AmdSevSnp' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AmdSevSnp?
      case key
      when "enabled"  then AEC::AmdSevSnp::Enabled
      when "disabled" then AEC::AmdSevSnp::Disabled
      else
        nil
      end
    end
  end
end
