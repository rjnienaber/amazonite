private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PartitionLoadFrequency
    None
    Daily
    Weekly
    Monthly

    def self.to_json(e : PartitionLoadFrequency, json : JSON::Builder) : Nil
      value = case e
              when AEC::PartitionLoadFrequency::None    then "none"
              when AEC::PartitionLoadFrequency::Daily   then "daily"
              when AEC::PartitionLoadFrequency::Weekly  then "weekly"
              when AEC::PartitionLoadFrequency::Monthly then "monthly"
              else
                raise Exception.new("unknown enum value for 'PartitionLoadFrequency' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PartitionLoadFrequency
      value = pull.read_string
      case value
      when "none"    then AEC::PartitionLoadFrequency::None
      when "daily"   then AEC::PartitionLoadFrequency::Daily
      when "weekly"  then AEC::PartitionLoadFrequency::Weekly
      when "monthly" then AEC::PartitionLoadFrequency::Monthly
      else
        raise Exception.new("unknown enum value for 'PartitionLoadFrequency' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PartitionLoadFrequency::None    then "none"
      when AEC::PartitionLoadFrequency::Daily   then "daily"
      when AEC::PartitionLoadFrequency::Weekly  then "weekly"
      when AEC::PartitionLoadFrequency::Monthly then "monthly"
      else
        raise Exception.new("unknown enum value for 'PartitionLoadFrequency' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PartitionLoadFrequency?
      case key
      when "none"    then AEC::PartitionLoadFrequency::None
      when "daily"   then AEC::PartitionLoadFrequency::Daily
      when "weekly"  then AEC::PartitionLoadFrequency::Weekly
      when "monthly" then AEC::PartitionLoadFrequency::Monthly
      else
        nil
      end
    end
  end
end
