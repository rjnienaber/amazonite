private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The state of a routing policy registration delta.
  enum IpamRoutingPolicyRegistrationDeltaState
    Pending
    Published
    Failed

    def self.to_json(e : IpamRoutingPolicyRegistrationDeltaState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamRoutingPolicyRegistrationDeltaState::Pending   then "pending"
              when AEC::IpamRoutingPolicyRegistrationDeltaState::Published then "published"
              when AEC::IpamRoutingPolicyRegistrationDeltaState::Failed    then "failed"
              else
                raise Exception.new("unknown enum value for 'IpamRoutingPolicyRegistrationDeltaState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamRoutingPolicyRegistrationDeltaState
      value = pull.read_string
      case value
      when "pending"   then AEC::IpamRoutingPolicyRegistrationDeltaState::Pending
      when "published" then AEC::IpamRoutingPolicyRegistrationDeltaState::Published
      when "failed"    then AEC::IpamRoutingPolicyRegistrationDeltaState::Failed
      else
        raise Exception.new("unknown enum value for 'IpamRoutingPolicyRegistrationDeltaState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamRoutingPolicyRegistrationDeltaState::Pending   then "pending"
      when AEC::IpamRoutingPolicyRegistrationDeltaState::Published then "published"
      when AEC::IpamRoutingPolicyRegistrationDeltaState::Failed    then "failed"
      else
        raise Exception.new("unknown enum value for 'IpamRoutingPolicyRegistrationDeltaState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamRoutingPolicyRegistrationDeltaState?
      case key
      when "pending"   then AEC::IpamRoutingPolicyRegistrationDeltaState::Pending
      when "published" then AEC::IpamRoutingPolicyRegistrationDeltaState::Published
      when "failed"    then AEC::IpamRoutingPolicyRegistrationDeltaState::Failed
      else
        nil
      end
    end
  end
end
