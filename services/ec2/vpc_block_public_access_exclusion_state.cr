private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcBlockPublicAccessExclusionState
    CreateInProgress
    CreateComplete
    CreateFailed
    UpdateInProgress
    UpdateComplete
    UpdateFailed
    DeleteInProgress
    DeleteComplete
    DisableInProgress
    DisableComplete

    def self.to_json(e : VpcBlockPublicAccessExclusionState, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcBlockPublicAccessExclusionState::CreateInProgress  then "create-in-progress"
              when AEC::VpcBlockPublicAccessExclusionState::CreateComplete    then "create-complete"
              when AEC::VpcBlockPublicAccessExclusionState::CreateFailed      then "create-failed"
              when AEC::VpcBlockPublicAccessExclusionState::UpdateInProgress  then "update-in-progress"
              when AEC::VpcBlockPublicAccessExclusionState::UpdateComplete    then "update-complete"
              when AEC::VpcBlockPublicAccessExclusionState::UpdateFailed      then "update-failed"
              when AEC::VpcBlockPublicAccessExclusionState::DeleteInProgress  then "delete-in-progress"
              when AEC::VpcBlockPublicAccessExclusionState::DeleteComplete    then "delete-complete"
              when AEC::VpcBlockPublicAccessExclusionState::DisableInProgress then "disable-in-progress"
              when AEC::VpcBlockPublicAccessExclusionState::DisableComplete   then "disable-complete"
              else
                raise Exception.new("unknown enum value for 'VpcBlockPublicAccessExclusionState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcBlockPublicAccessExclusionState
      value = pull.read_string
      case value
      when "create-in-progress"  then AEC::VpcBlockPublicAccessExclusionState::CreateInProgress
      when "create-complete"     then AEC::VpcBlockPublicAccessExclusionState::CreateComplete
      when "create-failed"       then AEC::VpcBlockPublicAccessExclusionState::CreateFailed
      when "update-in-progress"  then AEC::VpcBlockPublicAccessExclusionState::UpdateInProgress
      when "update-complete"     then AEC::VpcBlockPublicAccessExclusionState::UpdateComplete
      when "update-failed"       then AEC::VpcBlockPublicAccessExclusionState::UpdateFailed
      when "delete-in-progress"  then AEC::VpcBlockPublicAccessExclusionState::DeleteInProgress
      when "delete-complete"     then AEC::VpcBlockPublicAccessExclusionState::DeleteComplete
      when "disable-in-progress" then AEC::VpcBlockPublicAccessExclusionState::DisableInProgress
      when "disable-complete"    then AEC::VpcBlockPublicAccessExclusionState::DisableComplete
      else
        raise Exception.new("unknown enum value for 'VpcBlockPublicAccessExclusionState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcBlockPublicAccessExclusionState::CreateInProgress  then "create-in-progress"
      when AEC::VpcBlockPublicAccessExclusionState::CreateComplete    then "create-complete"
      when AEC::VpcBlockPublicAccessExclusionState::CreateFailed      then "create-failed"
      when AEC::VpcBlockPublicAccessExclusionState::UpdateInProgress  then "update-in-progress"
      when AEC::VpcBlockPublicAccessExclusionState::UpdateComplete    then "update-complete"
      when AEC::VpcBlockPublicAccessExclusionState::UpdateFailed      then "update-failed"
      when AEC::VpcBlockPublicAccessExclusionState::DeleteInProgress  then "delete-in-progress"
      when AEC::VpcBlockPublicAccessExclusionState::DeleteComplete    then "delete-complete"
      when AEC::VpcBlockPublicAccessExclusionState::DisableInProgress then "disable-in-progress"
      when AEC::VpcBlockPublicAccessExclusionState::DisableComplete   then "disable-complete"
      else
        raise Exception.new("unknown enum value for 'VpcBlockPublicAccessExclusionState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcBlockPublicAccessExclusionState?
      case key
      when "create-in-progress"  then AEC::VpcBlockPublicAccessExclusionState::CreateInProgress
      when "create-complete"     then AEC::VpcBlockPublicAccessExclusionState::CreateComplete
      when "create-failed"       then AEC::VpcBlockPublicAccessExclusionState::CreateFailed
      when "update-in-progress"  then AEC::VpcBlockPublicAccessExclusionState::UpdateInProgress
      when "update-complete"     then AEC::VpcBlockPublicAccessExclusionState::UpdateComplete
      when "update-failed"       then AEC::VpcBlockPublicAccessExclusionState::UpdateFailed
      when "delete-in-progress"  then AEC::VpcBlockPublicAccessExclusionState::DeleteInProgress
      when "delete-complete"     then AEC::VpcBlockPublicAccessExclusionState::DeleteComplete
      when "disable-in-progress" then AEC::VpcBlockPublicAccessExclusionState::DisableInProgress
      when "disable-complete"    then AEC::VpcBlockPublicAccessExclusionState::DisableComplete
      else
        nil
      end
    end
  end
end
