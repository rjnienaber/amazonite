private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SecondarySubnetState
    CreateInProgress
    CreateComplete
    CreateFailed
    DeleteInProgress
    DeleteComplete
    DeleteFailed

    def self.to_json(e : SecondarySubnetState, json : JSON::Builder) : Nil
      value = case e
              when AEC::SecondarySubnetState::CreateInProgress then "create-in-progress"
              when AEC::SecondarySubnetState::CreateComplete   then "create-complete"
              when AEC::SecondarySubnetState::CreateFailed     then "create-failed"
              when AEC::SecondarySubnetState::DeleteInProgress then "delete-in-progress"
              when AEC::SecondarySubnetState::DeleteComplete   then "delete-complete"
              when AEC::SecondarySubnetState::DeleteFailed     then "delete-failed"
              else
                raise Exception.new("unknown enum value for 'SecondarySubnetState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SecondarySubnetState
      value = pull.read_string
      case value
      when "create-in-progress" then AEC::SecondarySubnetState::CreateInProgress
      when "create-complete"    then AEC::SecondarySubnetState::CreateComplete
      when "create-failed"      then AEC::SecondarySubnetState::CreateFailed
      when "delete-in-progress" then AEC::SecondarySubnetState::DeleteInProgress
      when "delete-complete"    then AEC::SecondarySubnetState::DeleteComplete
      when "delete-failed"      then AEC::SecondarySubnetState::DeleteFailed
      else
        raise Exception.new("unknown enum value for 'SecondarySubnetState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SecondarySubnetState::CreateInProgress then "create-in-progress"
      when AEC::SecondarySubnetState::CreateComplete   then "create-complete"
      when AEC::SecondarySubnetState::CreateFailed     then "create-failed"
      when AEC::SecondarySubnetState::DeleteInProgress then "delete-in-progress"
      when AEC::SecondarySubnetState::DeleteComplete   then "delete-complete"
      when AEC::SecondarySubnetState::DeleteFailed     then "delete-failed"
      else
        raise Exception.new("unknown enum value for 'SecondarySubnetState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SecondarySubnetState?
      case key
      when "create-in-progress" then AEC::SecondarySubnetState::CreateInProgress
      when "create-complete"    then AEC::SecondarySubnetState::CreateComplete
      when "create-failed"      then AEC::SecondarySubnetState::CreateFailed
      when "delete-in-progress" then AEC::SecondarySubnetState::DeleteInProgress
      when "delete-complete"    then AEC::SecondarySubnetState::DeleteComplete
      when "delete-failed"      then AEC::SecondarySubnetState::DeleteFailed
      else
        nil
      end
    end
  end
end
