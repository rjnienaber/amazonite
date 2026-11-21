private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FirewallOnboardingStatus
    Pending
    Active
    Disabling

    def self.to_json(e : FirewallOnboardingStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::FirewallOnboardingStatus::Pending   then "pending"
              when AEC::FirewallOnboardingStatus::Active    then "active"
              when AEC::FirewallOnboardingStatus::Disabling then "disabling"
              else
                raise Exception.new("unknown enum value for 'FirewallOnboardingStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FirewallOnboardingStatus
      value = pull.read_string
      case value
      when "pending"   then AEC::FirewallOnboardingStatus::Pending
      when "active"    then AEC::FirewallOnboardingStatus::Active
      when "disabling" then AEC::FirewallOnboardingStatus::Disabling
      else
        raise Exception.new("unknown enum value for 'FirewallOnboardingStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FirewallOnboardingStatus::Pending   then "pending"
      when AEC::FirewallOnboardingStatus::Active    then "active"
      when AEC::FirewallOnboardingStatus::Disabling then "disabling"
      else
        raise Exception.new("unknown enum value for 'FirewallOnboardingStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FirewallOnboardingStatus?
      case key
      when "pending"   then AEC::FirewallOnboardingStatus::Pending
      when "active"    then AEC::FirewallOnboardingStatus::Active
      when "disabling" then AEC::FirewallOnboardingStatus::Disabling
      else
        nil
      end
    end
  end
end
