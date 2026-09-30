private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TaggableResourceType
    NetworkInterface
    Instance
    AutoScalingGroup

    def self.to_json(e : TaggableResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TaggableResourceType::NetworkInterface then "network-interface"
              when AEC::TaggableResourceType::Instance         then "instance"
              when AEC::TaggableResourceType::AutoScalingGroup then "auto-scaling-group"
              else
                raise Exception.new("unknown enum value for 'TaggableResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TaggableResourceType
      value = pull.read_string
      case value
      when "network-interface"  then AEC::TaggableResourceType::NetworkInterface
      when "instance"           then AEC::TaggableResourceType::Instance
      when "auto-scaling-group" then AEC::TaggableResourceType::AutoScalingGroup
      else
        raise Exception.new("unknown enum value for 'TaggableResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TaggableResourceType::NetworkInterface then "network-interface"
      when AEC::TaggableResourceType::Instance         then "instance"
      when AEC::TaggableResourceType::AutoScalingGroup then "auto-scaling-group"
      else
        raise Exception.new("unknown enum value for 'TaggableResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TaggableResourceType?
      case key
      when "network-interface"  then AEC::TaggableResourceType::NetworkInterface
      when "instance"           then AEC::TaggableResourceType::Instance
      when "auto-scaling-group" then AEC::TaggableResourceType::AutoScalingGroup
      else
        nil
      end
    end
  end
end
