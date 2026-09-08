private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BootModeValues
    LegacyBios
    Uefi
    UefiPreferred

    def self.to_json(e : BootModeValues, json : JSON::Builder) : Nil
      value = case e
              when AEC::BootModeValues::LegacyBios    then "legacy-bios"
              when AEC::BootModeValues::Uefi          then "uefi"
              when AEC::BootModeValues::UefiPreferred then "uefi-preferred"
              else
                raise Exception.new("unknown enum value for 'BootModeValues' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BootModeValues
      value = pull.read_string
      case value
      when "legacy-bios"    then AEC::BootModeValues::LegacyBios
      when "uefi"           then AEC::BootModeValues::Uefi
      when "uefi-preferred" then AEC::BootModeValues::UefiPreferred
      else
        raise Exception.new("unknown enum value for 'BootModeValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BootModeValues::LegacyBios    then "legacy-bios"
      when AEC::BootModeValues::Uefi          then "uefi"
      when AEC::BootModeValues::UefiPreferred then "uefi-preferred"
      else
        raise Exception.new("unknown enum value for 'BootModeValues' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BootModeValues?
      case key
      when "legacy-bios"    then AEC::BootModeValues::LegacyBios
      when "uefi"           then AEC::BootModeValues::Uefi
      when "uefi-preferred" then AEC::BootModeValues::UefiPreferred
      else
        nil
      end
    end
  end
end
