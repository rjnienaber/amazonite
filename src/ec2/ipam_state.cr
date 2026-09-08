private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamState
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

    def self.to_json(e : IpamState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamState::CreateInProgress  then "create-in-progress"
              when AEC::IpamState::CreateComplete    then "create-complete"
              when AEC::IpamState::CreateFailed      then "create-failed"
              when AEC::IpamState::ModifyInProgress  then "modify-in-progress"
              when AEC::IpamState::ModifyComplete    then "modify-complete"
              when AEC::IpamState::ModifyFailed      then "modify-failed"
              when AEC::IpamState::DeleteInProgress  then "delete-in-progress"
              when AEC::IpamState::DeleteComplete    then "delete-complete"
              when AEC::IpamState::DeleteFailed      then "delete-failed"
              when AEC::IpamState::IsolateInProgress then "isolate-in-progress"
              when AEC::IpamState::IsolateComplete   then "isolate-complete"
              when AEC::IpamState::RestoreInProgress then "restore-in-progress"
              else
                raise Exception.new("unknown enum value for 'IpamState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamState
      value = pull.read_string
      case value
      when "create-in-progress"  then AEC::IpamState::CreateInProgress
      when "create-complete"     then AEC::IpamState::CreateComplete
      when "create-failed"       then AEC::IpamState::CreateFailed
      when "modify-in-progress"  then AEC::IpamState::ModifyInProgress
      when "modify-complete"     then AEC::IpamState::ModifyComplete
      when "modify-failed"       then AEC::IpamState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamState::DeleteInProgress
      when "delete-complete"     then AEC::IpamState::DeleteComplete
      when "delete-failed"       then AEC::IpamState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamState::IsolateComplete
      when "restore-in-progress" then AEC::IpamState::RestoreInProgress
      else
        raise Exception.new("unknown enum value for 'IpamState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamState::CreateInProgress  then "create-in-progress"
      when AEC::IpamState::CreateComplete    then "create-complete"
      when AEC::IpamState::CreateFailed      then "create-failed"
      when AEC::IpamState::ModifyInProgress  then "modify-in-progress"
      when AEC::IpamState::ModifyComplete    then "modify-complete"
      when AEC::IpamState::ModifyFailed      then "modify-failed"
      when AEC::IpamState::DeleteInProgress  then "delete-in-progress"
      when AEC::IpamState::DeleteComplete    then "delete-complete"
      when AEC::IpamState::DeleteFailed      then "delete-failed"
      when AEC::IpamState::IsolateInProgress then "isolate-in-progress"
      when AEC::IpamState::IsolateComplete   then "isolate-complete"
      when AEC::IpamState::RestoreInProgress then "restore-in-progress"
      else
        raise Exception.new("unknown enum value for 'IpamState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamState?
      case key
      when "create-in-progress"  then AEC::IpamState::CreateInProgress
      when "create-complete"     then AEC::IpamState::CreateComplete
      when "create-failed"       then AEC::IpamState::CreateFailed
      when "modify-in-progress"  then AEC::IpamState::ModifyInProgress
      when "modify-complete"     then AEC::IpamState::ModifyComplete
      when "modify-failed"       then AEC::IpamState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamState::DeleteInProgress
      when "delete-complete"     then AEC::IpamState::DeleteComplete
      when "delete-failed"       then AEC::IpamState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamState::IsolateComplete
      when "restore-in-progress" then AEC::IpamState::RestoreInProgress
      else
        nil
      end
    end
  end
end
