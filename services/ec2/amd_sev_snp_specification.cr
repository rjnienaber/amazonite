private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AmdSevSnpSpecification
    Enabled
    Disabled

    def self.to_json(e : AmdSevSnpSpecification, json : JSON::Builder) : Nil
      value = case e
              when AEC::AmdSevSnpSpecification::Enabled  then "enabled"
              when AEC::AmdSevSnpSpecification::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'AmdSevSnpSpecification' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AmdSevSnpSpecification
      value = pull.read_string
      case value
      when "enabled"  then AEC::AmdSevSnpSpecification::Enabled
      when "disabled" then AEC::AmdSevSnpSpecification::Disabled
      else
        raise Exception.new("unknown enum value for 'AmdSevSnpSpecification' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AmdSevSnpSpecification::Enabled  then "enabled"
      when AEC::AmdSevSnpSpecification::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'AmdSevSnpSpecification' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AmdSevSnpSpecification?
      case key
      when "enabled"  then AEC::AmdSevSnpSpecification::Enabled
      when "disabled" then AEC::AmdSevSnpSpecification::Disabled
      else
        nil
      end
    end
  end
end
