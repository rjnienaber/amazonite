private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ElasticGpuStatus
    Ok
    Impaired

    def self.to_json(e : ElasticGpuStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::ElasticGpuStatus::Ok       then "OK"
              when AEC::ElasticGpuStatus::Impaired then "IMPAIRED"
              else
                raise Exception.new("unknown enum value for 'ElasticGpuStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ElasticGpuStatus
      value = pull.read_string
      case value
      when "OK"       then AEC::ElasticGpuStatus::Ok
      when "IMPAIRED" then AEC::ElasticGpuStatus::Impaired
      else
        raise Exception.new("unknown enum value for 'ElasticGpuStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ElasticGpuStatus::Ok       then "OK"
      when AEC::ElasticGpuStatus::Impaired then "IMPAIRED"
      else
        raise Exception.new("unknown enum value for 'ElasticGpuStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ElasticGpuStatus?
      case key
      when "OK"       then AEC::ElasticGpuStatus::Ok
      when "IMPAIRED" then AEC::ElasticGpuStatus::Impaired
      else
        nil
      end
    end
  end
end
