private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TrafficMirrorRuleAction
    Accept
    Reject

    def self.to_json(e : TrafficMirrorRuleAction, json : JSON::Builder) : Nil
      value = case e
              when AEC::TrafficMirrorRuleAction::Accept then "accept"
              when AEC::TrafficMirrorRuleAction::Reject then "reject"
              else
                raise Exception.new("unknown enum value for 'TrafficMirrorRuleAction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TrafficMirrorRuleAction
      value = pull.read_string
      case value
      when "accept" then AEC::TrafficMirrorRuleAction::Accept
      when "reject" then AEC::TrafficMirrorRuleAction::Reject
      else
        raise Exception.new("unknown enum value for 'TrafficMirrorRuleAction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TrafficMirrorRuleAction::Accept then "accept"
      when AEC::TrafficMirrorRuleAction::Reject then "reject"
      else
        raise Exception.new("unknown enum value for 'TrafficMirrorRuleAction' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TrafficMirrorRuleAction?
      case key
      when "accept" then AEC::TrafficMirrorRuleAction::Accept
      when "reject" then AEC::TrafficMirrorRuleAction::Reject
      else
        nil
      end
    end
  end
end
