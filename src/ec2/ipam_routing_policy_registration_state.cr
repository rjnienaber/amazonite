private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The state of a routing policy registration.
  enum IpamRoutingPolicyRegistrationState
    PendingActivate
    ActivateFailed
    CreateInProgress
    CreateComplete
    UpdateInProgress
    UpdateComplete
    DeleteInProgress
    DeleteComplete

    def self.to_json(e : IpamRoutingPolicyRegistrationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamRoutingPolicyRegistrationState::PendingActivate  then "pending-activate"
              when AEC::IpamRoutingPolicyRegistrationState::ActivateFailed   then "activate-failed"
              when AEC::IpamRoutingPolicyRegistrationState::CreateInProgress then "create-in-progress"
              when AEC::IpamRoutingPolicyRegistrationState::CreateComplete   then "create-complete"
              when AEC::IpamRoutingPolicyRegistrationState::UpdateInProgress then "update-in-progress"
              when AEC::IpamRoutingPolicyRegistrationState::UpdateComplete   then "update-complete"
              when AEC::IpamRoutingPolicyRegistrationState::DeleteInProgress then "delete-in-progress"
              when AEC::IpamRoutingPolicyRegistrationState::DeleteComplete   then "delete-complete"
              else
                raise Exception.new("unknown enum value for 'IpamRoutingPolicyRegistrationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamRoutingPolicyRegistrationState
      value = pull.read_string
      case value
      when "pending-activate"   then AEC::IpamRoutingPolicyRegistrationState::PendingActivate
      when "activate-failed"    then AEC::IpamRoutingPolicyRegistrationState::ActivateFailed
      when "create-in-progress" then AEC::IpamRoutingPolicyRegistrationState::CreateInProgress
      when "create-complete"    then AEC::IpamRoutingPolicyRegistrationState::CreateComplete
      when "update-in-progress" then AEC::IpamRoutingPolicyRegistrationState::UpdateInProgress
      when "update-complete"    then AEC::IpamRoutingPolicyRegistrationState::UpdateComplete
      when "delete-in-progress" then AEC::IpamRoutingPolicyRegistrationState::DeleteInProgress
      when "delete-complete"    then AEC::IpamRoutingPolicyRegistrationState::DeleteComplete
      else
        raise Exception.new("unknown enum value for 'IpamRoutingPolicyRegistrationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamRoutingPolicyRegistrationState::PendingActivate  then "pending-activate"
      when AEC::IpamRoutingPolicyRegistrationState::ActivateFailed   then "activate-failed"
      when AEC::IpamRoutingPolicyRegistrationState::CreateInProgress then "create-in-progress"
      when AEC::IpamRoutingPolicyRegistrationState::CreateComplete   then "create-complete"
      when AEC::IpamRoutingPolicyRegistrationState::UpdateInProgress then "update-in-progress"
      when AEC::IpamRoutingPolicyRegistrationState::UpdateComplete   then "update-complete"
      when AEC::IpamRoutingPolicyRegistrationState::DeleteInProgress then "delete-in-progress"
      when AEC::IpamRoutingPolicyRegistrationState::DeleteComplete   then "delete-complete"
      else
        raise Exception.new("unknown enum value for 'IpamRoutingPolicyRegistrationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamRoutingPolicyRegistrationState?
      case key
      when "pending-activate"   then AEC::IpamRoutingPolicyRegistrationState::PendingActivate
      when "activate-failed"    then AEC::IpamRoutingPolicyRegistrationState::ActivateFailed
      when "create-in-progress" then AEC::IpamRoutingPolicyRegistrationState::CreateInProgress
      when "create-complete"    then AEC::IpamRoutingPolicyRegistrationState::CreateComplete
      when "update-in-progress" then AEC::IpamRoutingPolicyRegistrationState::UpdateInProgress
      when "update-complete"    then AEC::IpamRoutingPolicyRegistrationState::UpdateComplete
      when "delete-in-progress" then AEC::IpamRoutingPolicyRegistrationState::DeleteInProgress
      when "delete-complete"    then AEC::IpamRoutingPolicyRegistrationState::DeleteComplete
      else
        nil
      end
    end
  end
end
