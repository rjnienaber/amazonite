private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BandwidthWeightingType
    Default
    Vpc1
    Ebs1

    def self.to_json(e : BandwidthWeightingType, json : JSON::Builder) : Nil
      value = case e
              when AEC::BandwidthWeightingType::Default then "default"
              when AEC::BandwidthWeightingType::Vpc1    then "vpc-1"
              when AEC::BandwidthWeightingType::Ebs1    then "ebs-1"
              else
                raise Exception.new("unknown enum value for 'BandwidthWeightingType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BandwidthWeightingType
      value = pull.read_string
      case value
      when "default" then AEC::BandwidthWeightingType::Default
      when "vpc-1"   then AEC::BandwidthWeightingType::Vpc1
      when "ebs-1"   then AEC::BandwidthWeightingType::Ebs1
      else
        raise Exception.new("unknown enum value for 'BandwidthWeightingType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BandwidthWeightingType::Default then "default"
      when AEC::BandwidthWeightingType::Vpc1    then "vpc-1"
      when AEC::BandwidthWeightingType::Ebs1    then "ebs-1"
      else
        raise Exception.new("unknown enum value for 'BandwidthWeightingType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BandwidthWeightingType?
      case key
      when "default" then AEC::BandwidthWeightingType::Default
      when "vpc-1"   then AEC::BandwidthWeightingType::Vpc1
      when "ebs-1"   then AEC::BandwidthWeightingType::Ebs1
      else
        nil
      end
    end
  end
end
