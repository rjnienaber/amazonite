private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PrefixListState
    CreateInProgress
    CreateComplete
    CreateFailed
    ModifyInProgress
    ModifyComplete
    ModifyFailed
    RestoreInProgress
    RestoreComplete
    RestoreFailed
    DeleteInProgress
    DeleteComplete
    DeleteFailed

    def self.to_json(e : PrefixListState, json : JSON::Builder) : Nil
      value = case e
              when AEC::PrefixListState::CreateInProgress  then "create-in-progress"
              when AEC::PrefixListState::CreateComplete    then "create-complete"
              when AEC::PrefixListState::CreateFailed      then "create-failed"
              when AEC::PrefixListState::ModifyInProgress  then "modify-in-progress"
              when AEC::PrefixListState::ModifyComplete    then "modify-complete"
              when AEC::PrefixListState::ModifyFailed      then "modify-failed"
              when AEC::PrefixListState::RestoreInProgress then "restore-in-progress"
              when AEC::PrefixListState::RestoreComplete   then "restore-complete"
              when AEC::PrefixListState::RestoreFailed     then "restore-failed"
              when AEC::PrefixListState::DeleteInProgress  then "delete-in-progress"
              when AEC::PrefixListState::DeleteComplete    then "delete-complete"
              when AEC::PrefixListState::DeleteFailed      then "delete-failed"
              else
                raise Exception.new("unknown enum value for 'PrefixListState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PrefixListState
      value = pull.read_string
      case value
      when "create-in-progress"  then AEC::PrefixListState::CreateInProgress
      when "create-complete"     then AEC::PrefixListState::CreateComplete
      when "create-failed"       then AEC::PrefixListState::CreateFailed
      when "modify-in-progress"  then AEC::PrefixListState::ModifyInProgress
      when "modify-complete"     then AEC::PrefixListState::ModifyComplete
      when "modify-failed"       then AEC::PrefixListState::ModifyFailed
      when "restore-in-progress" then AEC::PrefixListState::RestoreInProgress
      when "restore-complete"    then AEC::PrefixListState::RestoreComplete
      when "restore-failed"      then AEC::PrefixListState::RestoreFailed
      when "delete-in-progress"  then AEC::PrefixListState::DeleteInProgress
      when "delete-complete"     then AEC::PrefixListState::DeleteComplete
      when "delete-failed"       then AEC::PrefixListState::DeleteFailed
      else
        raise Exception.new("unknown enum value for 'PrefixListState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PrefixListState::CreateInProgress  then "create-in-progress"
      when AEC::PrefixListState::CreateComplete    then "create-complete"
      when AEC::PrefixListState::CreateFailed      then "create-failed"
      when AEC::PrefixListState::ModifyInProgress  then "modify-in-progress"
      when AEC::PrefixListState::ModifyComplete    then "modify-complete"
      when AEC::PrefixListState::ModifyFailed      then "modify-failed"
      when AEC::PrefixListState::RestoreInProgress then "restore-in-progress"
      when AEC::PrefixListState::RestoreComplete   then "restore-complete"
      when AEC::PrefixListState::RestoreFailed     then "restore-failed"
      when AEC::PrefixListState::DeleteInProgress  then "delete-in-progress"
      when AEC::PrefixListState::DeleteComplete    then "delete-complete"
      when AEC::PrefixListState::DeleteFailed      then "delete-failed"
      else
        raise Exception.new("unknown enum value for 'PrefixListState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PrefixListState?
      case key
      when "create-in-progress"  then AEC::PrefixListState::CreateInProgress
      when "create-complete"     then AEC::PrefixListState::CreateComplete
      when "create-failed"       then AEC::PrefixListState::CreateFailed
      when "modify-in-progress"  then AEC::PrefixListState::ModifyInProgress
      when "modify-complete"     then AEC::PrefixListState::ModifyComplete
      when "modify-failed"       then AEC::PrefixListState::ModifyFailed
      when "restore-in-progress" then AEC::PrefixListState::RestoreInProgress
      when "restore-complete"    then AEC::PrefixListState::RestoreComplete
      when "restore-failed"      then AEC::PrefixListState::RestoreFailed
      when "delete-in-progress"  then AEC::PrefixListState::DeleteInProgress
      when "delete-complete"     then AEC::PrefixListState::DeleteComplete
      when "delete-failed"       then AEC::PrefixListState::DeleteFailed
      else
        nil
      end
    end
  end
end
