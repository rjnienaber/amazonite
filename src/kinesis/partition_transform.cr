private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum PartitionTransform
    TimeHour

    def self.to_json(e : PartitionTransform, json : JSON::Builder) : Nil
      value = case e
              when AK::PartitionTransform::TimeHour then "TIME_HOUR"
              else
                raise Exception.new("unknown enum value for 'PartitionTransform' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::PartitionTransform
      value = pull.read_string
      case value
      when "TIME_HOUR" then AK::PartitionTransform::TimeHour
      else
        raise Exception.new("unknown enum value for 'PartitionTransform' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::PartitionTransform::TimeHour then "TIME_HOUR"
      else
        raise Exception.new("unknown enum value for 'PartitionTransform' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::PartitionTransform?
      case key
      when "TIME_HOUR" then AK::PartitionTransform::TimeHour
      else
        nil
      end
    end
  end
end
