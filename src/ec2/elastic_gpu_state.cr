private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ElasticGpuState
    Attached

    def self.to_json(e : ElasticGpuState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ElasticGpuState::Attached then "ATTACHED"
              else
                raise Exception.new("unknown enum value for 'ElasticGpuState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ElasticGpuState
      value = pull.read_string
      case value
      when "ATTACHED" then AEC::ElasticGpuState::Attached
      else
        raise Exception.new("unknown enum value for 'ElasticGpuState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ElasticGpuState::Attached then "ATTACHED"
      else
        raise Exception.new("unknown enum value for 'ElasticGpuState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ElasticGpuState?
      case key
      when "ATTACHED" then AEC::ElasticGpuState::Attached
      else
        nil
      end
    end
  end
end
