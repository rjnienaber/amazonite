private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BootModeType
    LegacyBios
    Uefi

    def self.to_json(e : BootModeType, json : JSON::Builder) : Nil
      value = case e
              when AEC::BootModeType::LegacyBios then "legacy-bios"
              when AEC::BootModeType::Uefi       then "uefi"
              else
                raise Exception.new("unknown enum value for 'BootModeType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BootModeType
      value = pull.read_string
      case value
      when "legacy-bios" then AEC::BootModeType::LegacyBios
      when "uefi"        then AEC::BootModeType::Uefi
      else
        raise Exception.new("unknown enum value for 'BootModeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BootModeType::LegacyBios then "legacy-bios"
      when AEC::BootModeType::Uefi       then "uefi"
      else
        raise Exception.new("unknown enum value for 'BootModeType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BootModeType?
      case key
      when "legacy-bios" then AEC::BootModeType::LegacyBios
      when "uefi"        then AEC::BootModeType::Uefi
      else
        nil
      end
    end
  end
end
