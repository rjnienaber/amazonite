private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceBootModeValues
    LegacyBios
    Uefi

    def self.to_json(e : InstanceBootModeValues, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceBootModeValues::LegacyBios then "legacy-bios"
              when AEC::InstanceBootModeValues::Uefi       then "uefi"
              else
                raise Exception.new("unknown enum value for 'InstanceBootModeValues' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceBootModeValues
      value = pull.read_string
      case value
      when "legacy-bios" then AEC::InstanceBootModeValues::LegacyBios
      when "uefi"        then AEC::InstanceBootModeValues::Uefi
      else
        raise Exception.new("unknown enum value for 'InstanceBootModeValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceBootModeValues::LegacyBios then "legacy-bios"
      when AEC::InstanceBootModeValues::Uefi       then "uefi"
      else
        raise Exception.new("unknown enum value for 'InstanceBootModeValues' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceBootModeValues?
      case key
      when "legacy-bios" then AEC::InstanceBootModeValues::LegacyBios
      when "uefi"        then AEC::InstanceBootModeValues::Uefi
      else
        nil
      end
    end
  end
end
