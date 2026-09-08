private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TrafficDirection
    Ingress
    Egress

    def self.to_json(e : TrafficDirection, json : JSON::Builder) : Nil
      value = case e
              when AEC::TrafficDirection::Ingress then "ingress"
              when AEC::TrafficDirection::Egress  then "egress"
              else
                raise Exception.new("unknown enum value for 'TrafficDirection' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TrafficDirection
      value = pull.read_string
      case value
      when "ingress" then AEC::TrafficDirection::Ingress
      when "egress"  then AEC::TrafficDirection::Egress
      else
        raise Exception.new("unknown enum value for 'TrafficDirection' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TrafficDirection::Ingress then "ingress"
      when AEC::TrafficDirection::Egress  then "egress"
      else
        raise Exception.new("unknown enum value for 'TrafficDirection' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TrafficDirection?
      case key
      when "ingress" then AEC::TrafficDirection::Ingress
      when "egress"  then AEC::TrafficDirection::Egress
      else
        nil
      end
    end
  end
end
