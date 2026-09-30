private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RuleAction
    Allow
    Deny

    def self.to_json(e : RuleAction, json : JSON::Builder) : Nil
      value = case e
              when AEC::RuleAction::Allow then "allow"
              when AEC::RuleAction::Deny  then "deny"
              else
                raise Exception.new("unknown enum value for 'RuleAction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RuleAction
      value = pull.read_string
      case value
      when "allow" then AEC::RuleAction::Allow
      when "deny"  then AEC::RuleAction::Deny
      else
        raise Exception.new("unknown enum value for 'RuleAction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RuleAction::Allow then "allow"
      when AEC::RuleAction::Deny  then "deny"
      else
        raise Exception.new("unknown enum value for 'RuleAction' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RuleAction?
      case key
      when "allow" then AEC::RuleAction::Allow
      when "deny"  then AEC::RuleAction::Deny
      else
        nil
      end
    end
  end
end
