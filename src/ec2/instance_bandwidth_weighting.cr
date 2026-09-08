private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceBandwidthWeighting
    Default
    Vpc1
    Ebs1

    def self.to_json(e : InstanceBandwidthWeighting, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceBandwidthWeighting::Default then "default"
              when AEC::InstanceBandwidthWeighting::Vpc1    then "vpc-1"
              when AEC::InstanceBandwidthWeighting::Ebs1    then "ebs-1"
              else
                raise Exception.new("unknown enum value for 'InstanceBandwidthWeighting' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceBandwidthWeighting
      value = pull.read_string
      case value
      when "default" then AEC::InstanceBandwidthWeighting::Default
      when "vpc-1"   then AEC::InstanceBandwidthWeighting::Vpc1
      when "ebs-1"   then AEC::InstanceBandwidthWeighting::Ebs1
      else
        raise Exception.new("unknown enum value for 'InstanceBandwidthWeighting' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceBandwidthWeighting::Default then "default"
      when AEC::InstanceBandwidthWeighting::Vpc1    then "vpc-1"
      when AEC::InstanceBandwidthWeighting::Ebs1    then "ebs-1"
      else
        raise Exception.new("unknown enum value for 'InstanceBandwidthWeighting' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceBandwidthWeighting?
      case key
      when "default" then AEC::InstanceBandwidthWeighting::Default
      when "vpc-1"   then AEC::InstanceBandwidthWeighting::Vpc1
      when "ebs-1"   then AEC::InstanceBandwidthWeighting::Ebs1
      else
        nil
      end
    end
  end
end
