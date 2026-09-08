private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SecondaryNetworkState
    CreateInProgress
    CreateComplete
    CreateFailed
    DeleteInProgress
    DeleteComplete
    DeleteFailed

    def self.to_json(e : SecondaryNetworkState, json : JSON::Builder) : Nil
      value = case e
              when AEC::SecondaryNetworkState::CreateInProgress then "create-in-progress"
              when AEC::SecondaryNetworkState::CreateComplete   then "create-complete"
              when AEC::SecondaryNetworkState::CreateFailed     then "create-failed"
              when AEC::SecondaryNetworkState::DeleteInProgress then "delete-in-progress"
              when AEC::SecondaryNetworkState::DeleteComplete   then "delete-complete"
              when AEC::SecondaryNetworkState::DeleteFailed     then "delete-failed"
              else
                raise Exception.new("unknown enum value for 'SecondaryNetworkState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SecondaryNetworkState
      value = pull.read_string
      case value
      when "create-in-progress" then AEC::SecondaryNetworkState::CreateInProgress
      when "create-complete"    then AEC::SecondaryNetworkState::CreateComplete
      when "create-failed"      then AEC::SecondaryNetworkState::CreateFailed
      when "delete-in-progress" then AEC::SecondaryNetworkState::DeleteInProgress
      when "delete-complete"    then AEC::SecondaryNetworkState::DeleteComplete
      when "delete-failed"      then AEC::SecondaryNetworkState::DeleteFailed
      else
        raise Exception.new("unknown enum value for 'SecondaryNetworkState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SecondaryNetworkState::CreateInProgress then "create-in-progress"
      when AEC::SecondaryNetworkState::CreateComplete   then "create-complete"
      when AEC::SecondaryNetworkState::CreateFailed     then "create-failed"
      when AEC::SecondaryNetworkState::DeleteInProgress then "delete-in-progress"
      when AEC::SecondaryNetworkState::DeleteComplete   then "delete-complete"
      when AEC::SecondaryNetworkState::DeleteFailed     then "delete-failed"
      else
        raise Exception.new("unknown enum value for 'SecondaryNetworkState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SecondaryNetworkState?
      case key
      when "create-in-progress" then AEC::SecondaryNetworkState::CreateInProgress
      when "create-complete"    then AEC::SecondaryNetworkState::CreateComplete
      when "create-failed"      then AEC::SecondaryNetworkState::CreateFailed
      when "delete-in-progress" then AEC::SecondaryNetworkState::DeleteInProgress
      when "delete-complete"    then AEC::SecondaryNetworkState::DeleteComplete
      when "delete-failed"      then AEC::SecondaryNetworkState::DeleteFailed
      else
        nil
      end
    end
  end
end
