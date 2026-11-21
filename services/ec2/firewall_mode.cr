private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FirewallMode
    Monitor
    Enforce

    def self.to_json(e : FirewallMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::FirewallMode::Monitor then "monitor"
              when AEC::FirewallMode::Enforce then "enforce"
              else
                raise Exception.new("unknown enum value for 'FirewallMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FirewallMode
      value = pull.read_string
      case value
      when "monitor" then AEC::FirewallMode::Monitor
      when "enforce" then AEC::FirewallMode::Enforce
      else
        raise Exception.new("unknown enum value for 'FirewallMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FirewallMode::Monitor then "monitor"
      when AEC::FirewallMode::Enforce then "enforce"
      else
        raise Exception.new("unknown enum value for 'FirewallMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FirewallMode?
      case key
      when "monitor" then AEC::FirewallMode::Monitor
      when "enforce" then AEC::FirewallMode::Enforce
      else
        nil
      end
    end
  end
end
