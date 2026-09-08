private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VolumeStatusName
    IoEnabled
    IoPerformance
    InitializationState

    def self.to_json(e : VolumeStatusName, json : JSON::Builder) : Nil
      value = case e
              when AEC::VolumeStatusName::IoEnabled           then "io-enabled"
              when AEC::VolumeStatusName::IoPerformance       then "io-performance"
              when AEC::VolumeStatusName::InitializationState then "initialization-state"
              else
                raise Exception.new("unknown enum value for 'VolumeStatusName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VolumeStatusName
      value = pull.read_string
      case value
      when "io-enabled"           then AEC::VolumeStatusName::IoEnabled
      when "io-performance"       then AEC::VolumeStatusName::IoPerformance
      when "initialization-state" then AEC::VolumeStatusName::InitializationState
      else
        raise Exception.new("unknown enum value for 'VolumeStatusName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VolumeStatusName::IoEnabled           then "io-enabled"
      when AEC::VolumeStatusName::IoPerformance       then "io-performance"
      when AEC::VolumeStatusName::InitializationState then "initialization-state"
      else
        raise Exception.new("unknown enum value for 'VolumeStatusName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VolumeStatusName?
      case key
      when "io-enabled"           then AEC::VolumeStatusName::IoEnabled
      when "io-performance"       then AEC::VolumeStatusName::IoPerformance
      when "initialization-state" then AEC::VolumeStatusName::InitializationState
      else
        nil
      end
    end
  end
end
