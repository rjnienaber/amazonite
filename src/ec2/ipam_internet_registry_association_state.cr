private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The state of an IPAM internet registry association.
  enum IpamInternetRegistryAssociationState
    PendingEnable
    CreateInProgress
    CreateFailed
    EnableInProgress
    EnableComplete
    EnableFailed
    DeleteInProgress
    DeleteComplete
    DeleteFailed

    def self.to_json(e : IpamInternetRegistryAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamInternetRegistryAssociationState::PendingEnable    then "pending-enable"
              when AEC::IpamInternetRegistryAssociationState::CreateInProgress then "create-in-progress"
              when AEC::IpamInternetRegistryAssociationState::CreateFailed     then "create-failed"
              when AEC::IpamInternetRegistryAssociationState::EnableInProgress then "enable-in-progress"
              when AEC::IpamInternetRegistryAssociationState::EnableComplete   then "enable-complete"
              when AEC::IpamInternetRegistryAssociationState::EnableFailed     then "enable-failed"
              when AEC::IpamInternetRegistryAssociationState::DeleteInProgress then "delete-in-progress"
              when AEC::IpamInternetRegistryAssociationState::DeleteComplete   then "delete-complete"
              when AEC::IpamInternetRegistryAssociationState::DeleteFailed     then "delete-failed"
              else
                raise Exception.new("unknown enum value for 'IpamInternetRegistryAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamInternetRegistryAssociationState
      value = pull.read_string
      case value
      when "pending-enable"     then AEC::IpamInternetRegistryAssociationState::PendingEnable
      when "create-in-progress" then AEC::IpamInternetRegistryAssociationState::CreateInProgress
      when "create-failed"      then AEC::IpamInternetRegistryAssociationState::CreateFailed
      when "enable-in-progress" then AEC::IpamInternetRegistryAssociationState::EnableInProgress
      when "enable-complete"    then AEC::IpamInternetRegistryAssociationState::EnableComplete
      when "enable-failed"      then AEC::IpamInternetRegistryAssociationState::EnableFailed
      when "delete-in-progress" then AEC::IpamInternetRegistryAssociationState::DeleteInProgress
      when "delete-complete"    then AEC::IpamInternetRegistryAssociationState::DeleteComplete
      when "delete-failed"      then AEC::IpamInternetRegistryAssociationState::DeleteFailed
      else
        raise Exception.new("unknown enum value for 'IpamInternetRegistryAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamInternetRegistryAssociationState::PendingEnable    then "pending-enable"
      when AEC::IpamInternetRegistryAssociationState::CreateInProgress then "create-in-progress"
      when AEC::IpamInternetRegistryAssociationState::CreateFailed     then "create-failed"
      when AEC::IpamInternetRegistryAssociationState::EnableInProgress then "enable-in-progress"
      when AEC::IpamInternetRegistryAssociationState::EnableComplete   then "enable-complete"
      when AEC::IpamInternetRegistryAssociationState::EnableFailed     then "enable-failed"
      when AEC::IpamInternetRegistryAssociationState::DeleteInProgress then "delete-in-progress"
      when AEC::IpamInternetRegistryAssociationState::DeleteComplete   then "delete-complete"
      when AEC::IpamInternetRegistryAssociationState::DeleteFailed     then "delete-failed"
      else
        raise Exception.new("unknown enum value for 'IpamInternetRegistryAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamInternetRegistryAssociationState?
      case key
      when "pending-enable"     then AEC::IpamInternetRegistryAssociationState::PendingEnable
      when "create-in-progress" then AEC::IpamInternetRegistryAssociationState::CreateInProgress
      when "create-failed"      then AEC::IpamInternetRegistryAssociationState::CreateFailed
      when "enable-in-progress" then AEC::IpamInternetRegistryAssociationState::EnableInProgress
      when "enable-complete"    then AEC::IpamInternetRegistryAssociationState::EnableComplete
      when "enable-failed"      then AEC::IpamInternetRegistryAssociationState::EnableFailed
      when "delete-in-progress" then AEC::IpamInternetRegistryAssociationState::DeleteInProgress
      when "delete-complete"    then AEC::IpamInternetRegistryAssociationState::DeleteComplete
      when "delete-failed"      then AEC::IpamInternetRegistryAssociationState::DeleteFailed
      else
        nil
      end
    end
  end
end
