private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPoolState
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

    def self.to_json(e : IpamPoolState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPoolState::CreateInProgress  then "create-in-progress"
              when AEC::IpamPoolState::CreateComplete    then "create-complete"
              when AEC::IpamPoolState::CreateFailed      then "create-failed"
              when AEC::IpamPoolState::ModifyInProgress  then "modify-in-progress"
              when AEC::IpamPoolState::ModifyComplete    then "modify-complete"
              when AEC::IpamPoolState::ModifyFailed      then "modify-failed"
              when AEC::IpamPoolState::DeleteInProgress  then "delete-in-progress"
              when AEC::IpamPoolState::DeleteComplete    then "delete-complete"
              when AEC::IpamPoolState::DeleteFailed      then "delete-failed"
              when AEC::IpamPoolState::IsolateInProgress then "isolate-in-progress"
              when AEC::IpamPoolState::IsolateComplete   then "isolate-complete"
              when AEC::IpamPoolState::RestoreInProgress then "restore-in-progress"
              else
                raise Exception.new("unknown enum value for 'IpamPoolState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPoolState
      value = pull.read_string
      case value
      when "create-in-progress"  then AEC::IpamPoolState::CreateInProgress
      when "create-complete"     then AEC::IpamPoolState::CreateComplete
      when "create-failed"       then AEC::IpamPoolState::CreateFailed
      when "modify-in-progress"  then AEC::IpamPoolState::ModifyInProgress
      when "modify-complete"     then AEC::IpamPoolState::ModifyComplete
      when "modify-failed"       then AEC::IpamPoolState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamPoolState::DeleteInProgress
      when "delete-complete"     then AEC::IpamPoolState::DeleteComplete
      when "delete-failed"       then AEC::IpamPoolState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamPoolState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamPoolState::IsolateComplete
      when "restore-in-progress" then AEC::IpamPoolState::RestoreInProgress
      else
        raise Exception.new("unknown enum value for 'IpamPoolState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPoolState::CreateInProgress  then "create-in-progress"
      when AEC::IpamPoolState::CreateComplete    then "create-complete"
      when AEC::IpamPoolState::CreateFailed      then "create-failed"
      when AEC::IpamPoolState::ModifyInProgress  then "modify-in-progress"
      when AEC::IpamPoolState::ModifyComplete    then "modify-complete"
      when AEC::IpamPoolState::ModifyFailed      then "modify-failed"
      when AEC::IpamPoolState::DeleteInProgress  then "delete-in-progress"
      when AEC::IpamPoolState::DeleteComplete    then "delete-complete"
      when AEC::IpamPoolState::DeleteFailed      then "delete-failed"
      when AEC::IpamPoolState::IsolateInProgress then "isolate-in-progress"
      when AEC::IpamPoolState::IsolateComplete   then "isolate-complete"
      when AEC::IpamPoolState::RestoreInProgress then "restore-in-progress"
      else
        raise Exception.new("unknown enum value for 'IpamPoolState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPoolState?
      case key
      when "create-in-progress"  then AEC::IpamPoolState::CreateInProgress
      when "create-complete"     then AEC::IpamPoolState::CreateComplete
      when "create-failed"       then AEC::IpamPoolState::CreateFailed
      when "modify-in-progress"  then AEC::IpamPoolState::ModifyInProgress
      when "modify-complete"     then AEC::IpamPoolState::ModifyComplete
      when "modify-failed"       then AEC::IpamPoolState::ModifyFailed
      when "delete-in-progress"  then AEC::IpamPoolState::DeleteInProgress
      when "delete-complete"     then AEC::IpamPoolState::DeleteComplete
      when "delete-failed"       then AEC::IpamPoolState::DeleteFailed
      when "isolate-in-progress" then AEC::IpamPoolState::IsolateInProgress
      when "isolate-complete"    then AEC::IpamPoolState::IsolateComplete
      when "restore-in-progress" then AEC::IpamPoolState::RestoreInProgress
      else
        nil
      end
    end
  end
end
