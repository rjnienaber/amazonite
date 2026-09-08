private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPrefixListResolverState
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

    def self.to_json(e : IpamPrefixListResolverState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPrefixListResolverState::CreateInProgress  then "create-in-progress"
              when AEC::IpamPrefixListResolverState::CreateComplete    then "create-complete"
              when AEC::IpamPrefixListResolverState::CreateFailed      then "create-failed"
              when AEC::IpamPrefixListResolverState::ModifyInProgress  then "modify-in-progress"
              when AEC::IpamPrefixListResolverState::ModifyComplete    then "modify-complete"
              when AEC::IpamPrefixListResolverState::ModifyFailed      then "modify-failed"
              when AEC::IpamPrefixListResolverState::DeleteInProgress  then "delete-in-progress"
              when AEC::IpamPrefixListResolverState::DeleteComplete    then "delete-complete"
              when AEC::IpamPrefixListResolverState::DeleteFailed      then "delete-failed"
              when AEC::IpamPrefixListResolverState::IsolateInProgress then "isolate-in-progress"
              when AEC::IpamPrefixListResolverState::IsolateComplete   then "isolate-complete"
              when AEC::IpamPrefixListResolverState::RestoreInProgress then "restore-in-progress"
              else
                raise Exception.new("unknown enum value for 'IpamPrefixListResolverState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPrefixListResolverState
      value = pull.read_string
      case value
      when "create-in-progress"  then AEC::IpamPrefixListResolverState::CreateInProgress
      when "create-complete"     then AEC::IpamPrefixListResolverState::CreateComplete
      when "create-failed"       then AEC::IpamPrefixListResolverState::CreateFailed
      when "modify-in-progress"  then AEC::IpamPrefixListResolverState::ModifyInProgress
      when "modify-complete"     then AEC::IpamPrefixListResolverState::ModifyComplete
      when "modify-failed"       then AEC::IpamPrefixListResolverState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamPrefixListResolverState::DeleteInProgress
      when "delete-complete"     then AEC::IpamPrefixListResolverState::DeleteComplete
      when "delete-failed"       then AEC::IpamPrefixListResolverState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamPrefixListResolverState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamPrefixListResolverState::IsolateComplete
      when "restore-in-progress" then AEC::IpamPrefixListResolverState::RestoreInProgress
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPrefixListResolverState::CreateInProgress  then "create-in-progress"
      when AEC::IpamPrefixListResolverState::CreateComplete    then "create-complete"
      when AEC::IpamPrefixListResolverState::CreateFailed      then "create-failed"
      when AEC::IpamPrefixListResolverState::ModifyInProgress  then "modify-in-progress"
      when AEC::IpamPrefixListResolverState::ModifyComplete    then "modify-complete"
      when AEC::IpamPrefixListResolverState::ModifyFailed      then "modify-failed"
      when AEC::IpamPrefixListResolverState::DeleteInProgress  then "delete-in-progress"
      when AEC::IpamPrefixListResolverState::DeleteComplete    then "delete-complete"
      when AEC::IpamPrefixListResolverState::DeleteFailed      then "delete-failed"
      when AEC::IpamPrefixListResolverState::IsolateInProgress then "isolate-in-progress"
      when AEC::IpamPrefixListResolverState::IsolateComplete   then "isolate-complete"
      when AEC::IpamPrefixListResolverState::RestoreInProgress then "restore-in-progress"
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPrefixListResolverState?
      case key
      when "create-in-progress"  then AEC::IpamPrefixListResolverState::CreateInProgress
      when "create-complete"     then AEC::IpamPrefixListResolverState::CreateComplete
      when "create-failed"       then AEC::IpamPrefixListResolverState::CreateFailed
      when "modify-in-progress"  then AEC::IpamPrefixListResolverState::ModifyInProgress
      when "modify-complete"     then AEC::IpamPrefixListResolverState::ModifyComplete
      when "modify-failed"       then AEC::IpamPrefixListResolverState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamPrefixListResolverState::DeleteInProgress
      when "delete-complete"     then AEC::IpamPrefixListResolverState::DeleteComplete
      when "delete-failed"       then AEC::IpamPrefixListResolverState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamPrefixListResolverState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamPrefixListResolverState::IsolateComplete
      when "restore-in-progress" then AEC::IpamPrefixListResolverState::RestoreInProgress
      else
        nil
      end
    end
  end
end
