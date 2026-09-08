private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceHealthStatus
    Healthy
    Unhealthy

    def self.to_json(e : InstanceHealthStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceHealthStatus::Healthy   then "healthy"
              when AEC::InstanceHealthStatus::Unhealthy then "unhealthy"
              else
                raise Exception.new("unknown enum value for 'InstanceHealthStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceHealthStatus
      value = pull.read_string
      case value
      when "healthy"   then AEC::InstanceHealthStatus::Healthy
      when "unhealthy" then AEC::InstanceHealthStatus::Unhealthy
      else
        raise Exception.new("unknown enum value for 'InstanceHealthStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceHealthStatus::Healthy   then "healthy"
      when AEC::InstanceHealthStatus::Unhealthy then "unhealthy"
      else
        raise Exception.new("unknown enum value for 'InstanceHealthStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceHealthStatus?
      case key
      when "healthy"   then AEC::InstanceHealthStatus::Healthy
      when "unhealthy" then AEC::InstanceHealthStatus::Unhealthy
      else
        nil
      end
    end
  end
end
