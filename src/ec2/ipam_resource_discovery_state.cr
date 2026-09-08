private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamResourceDiscoveryState
    CreateInProgress
    CreateComplete
    CreateFailed
    ModifyInProgress
    ModifyComplete
    ModifyFailed
    DeleteInProgress
    DeleteComplete
    DeleteFailed
    IsolateInProgress
    IsolateComplete
    RestoreInProgress

    def self.to_json(e : IpamResourceDiscoveryState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamResourceDiscoveryState::CreateInProgress  then "create-in-progress"
              when AEC::IpamResourceDiscoveryState::CreateComplete    then "create-complete"
              when AEC::IpamResourceDiscoveryState::CreateFailed      then "create-failed"
              when AEC::IpamResourceDiscoveryState::ModifyInProgress  then "modify-in-progress"
              when AEC::IpamResourceDiscoveryState::ModifyComplete    then "modify-complete"
              when AEC::IpamResourceDiscoveryState::ModifyFailed      then "modify-failed"
              when AEC::IpamResourceDiscoveryState::DeleteInProgress  then "delete-in-progress"
              when AEC::IpamResourceDiscoveryState::DeleteComplete    then "delete-complete"
              when AEC::IpamResourceDiscoveryState::DeleteFailed      then "delete-failed"
              when AEC::IpamResourceDiscoveryState::IsolateInProgress then "isolate-in-progress"
              when AEC::IpamResourceDiscoveryState::IsolateComplete   then "isolate-complete"
              when AEC::IpamResourceDiscoveryState::RestoreInProgress then "restore-in-progress"
              else
                raise Exception.new("unknown enum value for 'IpamResourceDiscoveryState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamResourceDiscoveryState
      value = pull.read_string
      case value
      when "create-in-progress"  then AEC::IpamResourceDiscoveryState::CreateInProgress
      when "create-complete"     then AEC::IpamResourceDiscoveryState::CreateComplete
      when "create-failed"       then AEC::IpamResourceDiscoveryState::CreateFailed
      when "modify-in-progress"  then AEC::IpamResourceDiscoveryState::ModifyInProgress
      when "modify-complete"     then AEC::IpamResourceDiscoveryState::ModifyComplete
      when "modify-failed"       then AEC::IpamResourceDiscoveryState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamResourceDiscoveryState::DeleteInProgress
      when "delete-complete"     then AEC::IpamResourceDiscoveryState::DeleteComplete
      when "delete-failed"       then AEC::IpamResourceDiscoveryState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamResourceDiscoveryState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamResourceDiscoveryState::IsolateComplete
      when "restore-in-progress" then AEC::IpamResourceDiscoveryState::RestoreInProgress
      else
        raise Exception.new("unknown enum value for 'IpamResourceDiscoveryState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamResourceDiscoveryState::CreateInProgress  then "create-in-progress"
      when AEC::IpamResourceDiscoveryState::CreateComplete    then "create-complete"
      when AEC::IpamResourceDiscoveryState::CreateFailed      then "create-failed"
      when AEC::IpamResourceDiscoveryState::ModifyInProgress  then "modify-in-progress"
      when AEC::IpamResourceDiscoveryState::ModifyComplete    then "modify-complete"
      when AEC::IpamResourceDiscoveryState::ModifyFailed      then "modify-failed"
      when AEC::IpamResourceDiscoveryState::DeleteInProgress  then "delete-in-progress"
      when AEC::IpamResourceDiscoveryState::DeleteComplete    then "delete-complete"
      when AEC::IpamResourceDiscoveryState::DeleteFailed      then "delete-failed"
      when AEC::IpamResourceDiscoveryState::IsolateInProgress then "isolate-in-progress"
      when AEC::IpamResourceDiscoveryState::IsolateComplete   then "isolate-complete"
      when AEC::IpamResourceDiscoveryState::RestoreInProgress then "restore-in-progress"
      else
        raise Exception.new("unknown enum value for 'IpamResourceDiscoveryState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamResourceDiscoveryState?
      case key
      when "create-in-progress"  then AEC::IpamResourceDiscoveryState::CreateInProgress
      when "create-complete"     then AEC::IpamResourceDiscoveryState::CreateComplete
      when "create-failed"       then AEC::IpamResourceDiscoveryState::CreateFailed
      when "modify-in-progress"  then AEC::IpamResourceDiscoveryState::ModifyInProgress
      when "modify-complete"     then AEC::IpamResourceDiscoveryState::ModifyComplete
      when "modify-failed"       then AEC::IpamResourceDiscoveryState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamResourceDiscoveryState::DeleteInProgress
      when "delete-complete"     then AEC::IpamResourceDiscoveryState::DeleteComplete
      when "delete-failed"       then AEC::IpamResourceDiscoveryState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamResourceDiscoveryState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamResourceDiscoveryState::IsolateComplete
      when "restore-in-progress" then AEC::IpamResourceDiscoveryState::RestoreInProgress
      else
        nil
      end
    end
  end
end
