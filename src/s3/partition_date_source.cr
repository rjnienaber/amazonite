private alias AS = Amazonite::S3

module Amazonite::S3
  enum PartitionDateSource
    EventTime
    DeliveryTime

    def self.to_json(e : PartitionDateSource, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PartitionDateSource
      value = pull.read_string
      case value
      when "EventTime"    then AS::PartitionDateSource::EventTime
      when "DeliveryTime" then AS::PartitionDateSource::DeliveryTime
      else
        raise Exception.new("unknown enum value for 'PartitionDateSource' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::PartitionDateSource?
      case key
      when "EventTime"    then AS::PartitionDateSource::EventTime
      when "DeliveryTime" then AS::PartitionDateSource::DeliveryTime
      else
        nil
      end
    end
  end
end
