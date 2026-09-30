private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamScopeState
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

    def self.to_json(e : IpamScopeState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamScopeState::CreateInProgress  then "create-in-progress"
              when AEC::IpamScopeState::CreateComplete    then "create-complete"
              when AEC::IpamScopeState::CreateFailed      then "create-failed"
              when AEC::IpamScopeState::ModifyInProgress  then "modify-in-progress"
              when AEC::IpamScopeState::ModifyComplete    then "modify-complete"
              when AEC::IpamScopeState::ModifyFailed      then "modify-failed"
              when AEC::IpamScopeState::DeleteInProgress  then "delete-in-progress"
              when AEC::IpamScopeState::DeleteComplete    then "delete-complete"
              when AEC::IpamScopeState::DeleteFailed      then "delete-failed"
              when AEC::IpamScopeState::IsolateInProgress then "isolate-in-progress"
              when AEC::IpamScopeState::IsolateComplete   then "isolate-complete"
              when AEC::IpamScopeState::RestoreInProgress then "restore-in-progress"
              else
                raise Exception.new("unknown enum value for 'IpamScopeState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamScopeState
      value = pull.read_string
      case value
      when "create-in-progress"  then AEC::IpamScopeState::CreateInProgress
      when "create-complete"     then AEC::IpamScopeState::CreateComplete
      when "create-failed"       then AEC::IpamScopeState::CreateFailed
      when "modify-in-progress"  then AEC::IpamScopeState::ModifyInProgress
      when "modify-complete"     then AEC::IpamScopeState::ModifyComplete
      when "modify-failed"       then AEC::IpamScopeState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamScopeState::DeleteInProgress
      when "delete-complete"     then AEC::IpamScopeState::DeleteComplete
      when "delete-failed"       then AEC::IpamScopeState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamScopeState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamScopeState::IsolateComplete
      when "restore-in-progress" then AEC::IpamScopeState::RestoreInProgress
      else
        raise Exception.new("unknown enum value for 'IpamScopeState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamScopeState::CreateInProgress  then "create-in-progress"
      when AEC::IpamScopeState::CreateComplete    then "create-complete"
      when AEC::IpamScopeState::CreateFailed      then "create-failed"
      when AEC::IpamScopeState::ModifyInProgress  then "modify-in-progress"
      when AEC::IpamScopeState::ModifyComplete    then "modify-complete"
      when AEC::IpamScopeState::ModifyFailed      then "modify-failed"
      when AEC::IpamScopeState::DeleteInProgress  then "delete-in-progress"
      when AEC::IpamScopeState::DeleteComplete    then "delete-complete"
      when AEC::IpamScopeState::DeleteFailed      then "delete-failed"
      when AEC::IpamScopeState::IsolateInProgress then "isolate-in-progress"
      when AEC::IpamScopeState::IsolateComplete   then "isolate-complete"
      when AEC::IpamScopeState::RestoreInProgress then "restore-in-progress"
      else
        raise Exception.new("unknown enum value for 'IpamScopeState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamScopeState?
      case key
      when "create-in-progress"  then AEC::IpamScopeState::CreateInProgress
      when "create-complete"     then AEC::IpamScopeState::CreateComplete
      when "create-failed"       then AEC::IpamScopeState::CreateFailed
      when "modify-in-progress"  then AEC::IpamScopeState::ModifyInProgress
      when "modify-complete"     then AEC::IpamScopeState::ModifyComplete
      when "modify-failed"       then AEC::IpamScopeState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamScopeState::DeleteInProgress
      when "delete-complete"     then AEC::IpamScopeState::DeleteComplete
      when "delete-failed"       then AEC::IpamScopeState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamScopeState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamScopeState::IsolateComplete
      when "restore-in-progress" then AEC::IpamScopeState::RestoreInProgress
      else
        nil
      end
    end
  end
end
