private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AllowedImagesSettingsDisabledState
    Disabled

    def self.to_json(e : AllowedImagesSettingsDisabledState, json : JSON::Builder) : Nil
      value = case e
              when AEC::AllowedImagesSettingsDisabledState::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'AllowedImagesSettingsDisabledState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AllowedImagesSettingsDisabledState
      value = pull.read_string
      case value
      when "disabled" then AEC::AllowedImagesSettingsDisabledState::Disabled
      else
        raise Exception.new("unknown enum value for 'AllowedImagesSettingsDisabledState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AllowedImagesSettingsDisabledState::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'AllowedImagesSettingsDisabledState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AllowedImagesSettingsDisabledState?
      case key
      when "disabled" then AEC::AllowedImagesSettingsDisabledState::Disabled
      else
        nil
      end
    end
  end
end
