private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BootModeOverrideValues
    Uefi

    def self.to_json(e : BootModeOverrideValues, json : JSON::Builder) : Nil
      value = case e
              when AEC::BootModeOverrideValues::Uefi then "uefi"
              else
                raise Exception.new("unknown enum value for 'BootModeOverrideValues' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BootModeOverrideValues
      value = pull.read_string
      case value
      when "uefi" then AEC::BootModeOverrideValues::Uefi
      else
        raise Exception.new("unknown enum value for 'BootModeOverrideValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BootModeOverrideValues::Uefi then "uefi"
      else
        raise Exception.new("unknown enum value for 'BootModeOverrideValues' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BootModeOverrideValues?
      case key
      when "uefi" then AEC::BootModeOverrideValues::Uefi
      else
        nil
      end
    end
  end
end
