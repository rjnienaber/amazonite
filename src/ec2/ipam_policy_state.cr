private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPolicyState
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

    def self.to_json(e : IpamPolicyState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPolicyState::CreateInProgress  then "create-in-progress"
              when AEC::IpamPolicyState::CreateComplete    then "create-complete"
              when AEC::IpamPolicyState::CreateFailed      then "create-failed"
              when AEC::IpamPolicyState::ModifyInProgress  then "modify-in-progress"
              when AEC::IpamPolicyState::ModifyComplete    then "modify-complete"
              when AEC::IpamPolicyState::ModifyFailed      then "modify-failed"
              when AEC::IpamPolicyState::DeleteInProgress  then "delete-in-progress"
              when AEC::IpamPolicyState::DeleteComplete    then "delete-complete"
              when AEC::IpamPolicyState::DeleteFailed      then "delete-failed"
              when AEC::IpamPolicyState::IsolateInProgress then "isolate-in-progress"
              when AEC::IpamPolicyState::IsolateComplete   then "isolate-complete"
              when AEC::IpamPolicyState::RestoreInProgress then "restore-in-progress"
              else
                raise Exception.new("unknown enum value for 'IpamPolicyState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPolicyState
      value = pull.read_string
      case value
      when "create-in-progress"  then AEC::IpamPolicyState::CreateInProgress
      when "create-complete"     then AEC::IpamPolicyState::CreateComplete
      when "create-failed"       then AEC::IpamPolicyState::CreateFailed
      when "modify-in-progress"  then AEC::IpamPolicyState::ModifyInProgress
      when "modify-complete"     then AEC::IpamPolicyState::ModifyComplete
      when "modify-failed"       then AEC::IpamPolicyState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamPolicyState::DeleteInProgress
      when "delete-complete"     then AEC::IpamPolicyState::DeleteComplete
      when "delete-failed"       then AEC::IpamPolicyState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamPolicyState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamPolicyState::IsolateComplete
      when "restore-in-progress" then AEC::IpamPolicyState::RestoreInProgress
      else
        raise Exception.new("unknown enum value for 'IpamPolicyState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPolicyState::CreateInProgress  then "create-in-progress"
      when AEC::IpamPolicyState::CreateComplete    then "create-complete"
      when AEC::IpamPolicyState::CreateFailed      then "create-failed"
      when AEC::IpamPolicyState::ModifyInProgress  then "modify-in-progress"
      when AEC::IpamPolicyState::ModifyComplete    then "modify-complete"
      when AEC::IpamPolicyState::ModifyFailed      then "modify-failed"
      when AEC::IpamPolicyState::DeleteInProgress  then "delete-in-progress"
      when AEC::IpamPolicyState::DeleteComplete    then "delete-complete"
      when AEC::IpamPolicyState::DeleteFailed      then "delete-failed"
      when AEC::IpamPolicyState::IsolateInProgress then "isolate-in-progress"
      when AEC::IpamPolicyState::IsolateComplete   then "isolate-complete"
      when AEC::IpamPolicyState::RestoreInProgress then "restore-in-progress"
      else
        raise Exception.new("unknown enum value for 'IpamPolicyState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPolicyState?
      case key
      when "create-in-progress"  then AEC::IpamPolicyState::CreateInProgress
      when "create-complete"     then AEC::IpamPolicyState::CreateComplete
      when "create-failed"       then AEC::IpamPolicyState::CreateFailed
      when "modify-in-progress"  then AEC::IpamPolicyState::ModifyInProgress
      when "modify-complete"     then AEC::IpamPolicyState::ModifyComplete
      when "modify-failed"       then AEC::IpamPolicyState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamPolicyState::DeleteInProgress
      when "delete-complete"     then AEC::IpamPolicyState::DeleteComplete
      when "delete-failed"       then AEC::IpamPolicyState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamPolicyState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamPolicyState::IsolateComplete
      when "restore-in-progress" then AEC::IpamPolicyState::RestoreInProgress
      else
        nil
      end
    end
  end
end
