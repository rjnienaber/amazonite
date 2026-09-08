private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPrefixListResolverTargetState
    CreateInProgress
    CreateComplete
    CreateFailed
    ModifyInProgress
    ModifyComplete
    ModifyFailed
    SyncInProgress
    SyncComplete
    SyncFailed
    DeleteInProgress
    DeleteComplete
    DeleteFailed
    IsolateInProgress
    IsolateComplete
    RestoreInProgress

    def self.to_json(e : IpamPrefixListResolverTargetState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPrefixListResolverTargetState::CreateInProgress  then "create-in-progress"
              when AEC::IpamPrefixListResolverTargetState::CreateComplete    then "create-complete"
              when AEC::IpamPrefixListResolverTargetState::CreateFailed      then "create-failed"
              when AEC::IpamPrefixListResolverTargetState::ModifyInProgress  then "modify-in-progress"
              when AEC::IpamPrefixListResolverTargetState::ModifyComplete    then "modify-complete"
              when AEC::IpamPrefixListResolverTargetState::ModifyFailed      then "modify-failed"
              when AEC::IpamPrefixListResolverTargetState::SyncInProgress    then "sync-in-progress"
              when AEC::IpamPrefixListResolverTargetState::SyncComplete      then "sync-complete"
              when AEC::IpamPrefixListResolverTargetState::SyncFailed        then "sync-failed"
              when AEC::IpamPrefixListResolverTargetState::DeleteInProgress  then "delete-in-progress"
              when AEC::IpamPrefixListResolverTargetState::DeleteComplete    then "delete-complete"
              when AEC::IpamPrefixListResolverTargetState::DeleteFailed      then "delete-failed"
              when AEC::IpamPrefixListResolverTargetState::IsolateInProgress then "isolate-in-progress"
              when AEC::IpamPrefixListResolverTargetState::IsolateComplete   then "isolate-complete"
              when AEC::IpamPrefixListResolverTargetState::RestoreInProgress then "restore-in-progress"
              else
                raise Exception.new("unknown enum value for 'IpamPrefixListResolverTargetState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPrefixListResolverTargetState
      value = pull.read_string
      case value
      when "create-in-progress"  then AEC::IpamPrefixListResolverTargetState::CreateInProgress
      when "create-complete"     then AEC::IpamPrefixListResolverTargetState::CreateComplete
      when "create-failed"       then AEC::IpamPrefixListResolverTargetState::CreateFailed
      when "modify-in-progress"  then AEC::IpamPrefixListResolverTargetState::ModifyInProgress
      when "modify-complete"     then AEC::IpamPrefixListResolverTargetState::ModifyComplete
      when "modify-failed"       then AEC::IpamPrefixListResolverTargetState::ModifyFailed
      when "sync-in-progress"    then AEC::IpamPrefixListResolverTargetState::SyncInProgress
      when "sync-complete"       then AEC::IpamPrefixListResolverTargetState::SyncComplete
      when "sync-failed"         then AEC::IpamPrefixListResolverTargetState::SyncFailed
      when "delete-in-progress"  then AEC::IpamPrefixListResolverTargetState::DeleteInProgress
      when "delete-complete"     then AEC::IpamPrefixListResolverTargetState::DeleteComplete
      when "delete-failed"       then AEC::IpamPrefixListResolverTargetState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamPrefixListResolverTargetState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamPrefixListResolverTargetState::IsolateComplete
      when "restore-in-progress" then AEC::IpamPrefixListResolverTargetState::RestoreInProgress
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverTargetState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPrefixListResolverTargetState::CreateInProgress  then "create-in-progress"
      when AEC::IpamPrefixListResolverTargetState::CreateComplete    then "create-complete"
      when AEC::IpamPrefixListResolverTargetState::CreateFailed      then "create-failed"
      when AEC::IpamPrefixListResolverTargetState::ModifyInProgress  then "modify-in-progress"
      when AEC::IpamPrefixListResolverTargetState::ModifyComplete    then "modify-complete"
      when AEC::IpamPrefixListResolverTargetState::ModifyFailed      then "modify-failed"
      when AEC::IpamPrefixListResolverTargetState::SyncInProgress    then "sync-in-progress"
      when AEC::IpamPrefixListResolverTargetState::SyncComplete      then "sync-complete"
      when AEC::IpamPrefixListResolverTargetState::SyncFailed        then "sync-failed"
      when AEC::IpamPrefixListResolverTargetState::DeleteInProgress  then "delete-in-progress"
      when AEC::IpamPrefixListResolverTargetState::DeleteComplete    then "delete-complete"
      when AEC::IpamPrefixListResolverTargetState::DeleteFailed      then "delete-failed"
      when AEC::IpamPrefixListResolverTargetState::IsolateInProgress then "isolate-in-progress"
      when AEC::IpamPrefixListResolverTargetState::IsolateComplete   then "isolate-complete"
      when AEC::IpamPrefixListResolverTargetState::RestoreInProgress then "restore-in-progress"
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverTargetState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPrefixListResolverTargetState?
      case key
      when "create-in-progress"  then AEC::IpamPrefixListResolverTargetState::CreateInProgress
      when "create-complete"     then AEC::IpamPrefixListResolverTargetState::CreateComplete
      when "create-failed"       then AEC::IpamPrefixListResolverTargetState::CreateFailed
      when "modify-in-progress"  then AEC::IpamPrefixListResolverTargetState::ModifyInProgress
      when "modify-complete"     then AEC::IpamPrefixListResolverTargetState::ModifyComplete
      when "modify-failed"       then AEC::IpamPrefixListResolverTargetState::ModifyFailed
      when "sync-in-progress"    then AEC::IpamPrefixListResolverTargetState::SyncInProgress
      when "sync-complete"       then AEC::IpamPrefixListResolverTargetState::SyncComplete
      when "sync-failed"         then AEC::IpamPrefixListResolverTargetState::SyncFailed
      when "delete-in-progress"  then AEC::IpamPrefixListResolverTargetState::DeleteInProgress
      when "delete-complete"     then AEC::IpamPrefixListResolverTargetState::DeleteComplete
      when "delete-failed"       then AEC::IpamPrefixListResolverTargetState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamPrefixListResolverTargetState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamPrefixListResolverTargetState::IsolateComplete
      when "restore-in-progress" then AEC::IpamPrefixListResolverTargetState::RestoreInProgress
      else
        nil
      end
    end
  end
end
