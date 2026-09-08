private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InitializationType
    Default
    ProvisionedRate
    VolumeCopy

    def self.to_json(e : InitializationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::InitializationType::Default         then "default"
              when AEC::InitializationType::ProvisionedRate then "provisioned-rate"
              when AEC::InitializationType::VolumeCopy      then "volume-copy"
              else
                raise Exception.new("unknown enum value for 'InitializationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InitializationType
      value = pull.read_string
      case value
      when "default"          then AEC::InitializationType::Default
      when "provisioned-rate" then AEC::InitializationType::ProvisionedRate
      when "volume-copy"      then AEC::InitializationType::VolumeCopy
      else
        raise Exception.new("unknown enum value for 'InitializationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InitializationType::Default         then "default"
      when AEC::InitializationType::ProvisionedRate then "provisioned-rate"
      when AEC::InitializationType::VolumeCopy      then "volume-copy"
      else
        raise Exception.new("unknown enum value for 'InitializationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InitializationType?
      case key
      when "default"          then AEC::InitializationType::Default
      when "provisioned-rate" then AEC::InitializationType::ProvisionedRate
      when "volume-copy"      then AEC::InitializationType::VolumeCopy
      else
        nil
      end
    end
  end
end
