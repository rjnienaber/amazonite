private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TrafficMirrorFilterRuleField
    DestinationPortRange
    SourcePortRange
    Protocol
    Description

    def self.to_json(e : TrafficMirrorFilterRuleField, json : JSON::Builder) : Nil
      value = case e
              when AEC::TrafficMirrorFilterRuleField::DestinationPortRange then "destination-port-range"
              when AEC::TrafficMirrorFilterRuleField::SourcePortRange      then "source-port-range"
              when AEC::TrafficMirrorFilterRuleField::Protocol             then "protocol"
              when AEC::TrafficMirrorFilterRuleField::Description          then "description"
              else
                raise Exception.new("unknown enum value for 'TrafficMirrorFilterRuleField' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TrafficMirrorFilterRuleField
      value = pull.read_string
      case value
      when "destination-port-range" then AEC::TrafficMirrorFilterRuleField::DestinationPortRange
      when "source-port-range"      then AEC::TrafficMirrorFilterRuleField::SourcePortRange
      when "protocol"               then AEC::TrafficMirrorFilterRuleField::Protocol
      when "description"            then AEC::TrafficMirrorFilterRuleField::Description
      else
        raise Exception.new("unknown enum value for 'TrafficMirrorFilterRuleField' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TrafficMirrorFilterRuleField::DestinationPortRange then "destination-port-range"
      when AEC::TrafficMirrorFilterRuleField::SourcePortRange      then "source-port-range"
      when AEC::TrafficMirrorFilterRuleField::Protocol             then "protocol"
      when AEC::TrafficMirrorFilterRuleField::Description          then "description"
      else
        raise Exception.new("unknown enum value for 'TrafficMirrorFilterRuleField' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TrafficMirrorFilterRuleField?
      case key
      when "destination-port-range" then AEC::TrafficMirrorFilterRuleField::DestinationPortRange
      when "source-port-range"      then AEC::TrafficMirrorFilterRuleField::SourcePortRange
      when "protocol"               then AEC::TrafficMirrorFilterRuleField::Protocol
      when "description"            then AEC::TrafficMirrorFilterRuleField::Description
      else
        nil
      end
    end
  end
end
