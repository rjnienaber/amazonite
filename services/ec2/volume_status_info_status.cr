private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VolumeStatusInfoStatus
    Ok
    Impaired
    InsufficientData
    Warning

    def self.to_json(e : VolumeStatusInfoStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::VolumeStatusInfoStatus::Ok               then "ok"
              when AEC::VolumeStatusInfoStatus::Impaired         then "impaired"
              when AEC::VolumeStatusInfoStatus::InsufficientData then "insufficient-data"
              when AEC::VolumeStatusInfoStatus::Warning          then "warning"
              else
                raise Exception.new("unknown enum value for 'VolumeStatusInfoStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VolumeStatusInfoStatus
      value = pull.read_string
      case value
      when "ok"                then AEC::VolumeStatusInfoStatus::Ok
      when "impaired"          then AEC::VolumeStatusInfoStatus::Impaired
      when "insufficient-data" then AEC::VolumeStatusInfoStatus::InsufficientData
      when "warning"           then AEC::VolumeStatusInfoStatus::Warning
      else
        raise Exception.new("unknown enum value for 'VolumeStatusInfoStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VolumeStatusInfoStatus::Ok               then "ok"
      when AEC::VolumeStatusInfoStatus::Impaired         then "impaired"
      when AEC::VolumeStatusInfoStatus::InsufficientData then "insufficient-data"
      when AEC::VolumeStatusInfoStatus::Warning          then "warning"
      else
        raise Exception.new("unknown enum value for 'VolumeStatusInfoStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VolumeStatusInfoStatus?
      case key
      when "ok"                then AEC::VolumeStatusInfoStatus::Ok
      when "impaired"          then AEC::VolumeStatusInfoStatus::Impaired
      when "insufficient-data" then AEC::VolumeStatusInfoStatus::InsufficientData
      when "warning"           then AEC::VolumeStatusInfoStatus::Warning
      else
        nil
      end
    end
  end
end
