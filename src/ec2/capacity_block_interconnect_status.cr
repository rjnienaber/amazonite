private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityBlockInterconnectStatus
    Ok
    Impaired
    InsufficientData

    def self.to_json(e : CapacityBlockInterconnectStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityBlockInterconnectStatus::Ok               then "ok"
              when AEC::CapacityBlockInterconnectStatus::Impaired         then "impaired"
              when AEC::CapacityBlockInterconnectStatus::InsufficientData then "insufficient-data"
              else
                raise Exception.new("unknown enum value for 'CapacityBlockInterconnectStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityBlockInterconnectStatus
      value = pull.read_string
      case value
      when "ok"                then AEC::CapacityBlockInterconnectStatus::Ok
      when "impaired"          then AEC::CapacityBlockInterconnectStatus::Impaired
      when "insufficient-data" then AEC::CapacityBlockInterconnectStatus::InsufficientData
      else
        raise Exception.new("unknown enum value for 'CapacityBlockInterconnectStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityBlockInterconnectStatus::Ok               then "ok"
      when AEC::CapacityBlockInterconnectStatus::Impaired         then "impaired"
      when AEC::CapacityBlockInterconnectStatus::InsufficientData then "insufficient-data"
      else
        raise Exception.new("unknown enum value for 'CapacityBlockInterconnectStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityBlockInterconnectStatus?
      case key
      when "ok"                then AEC::CapacityBlockInterconnectStatus::Ok
      when "impaired"          then AEC::CapacityBlockInterconnectStatus::Impaired
      when "insufficient-data" then AEC::CapacityBlockInterconnectStatus::InsufficientData
      else
        nil
      end
    end
  end
end
