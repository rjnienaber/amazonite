private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AccountVpcEncryptionControlState
    DefaultState
    TransitionsInProgress
    TransitionsPartiallySuccessful
    TransitionsSuccessful
    TransitionsFailed

    def self.to_json(e : AccountVpcEncryptionControlState, json : JSON::Builder) : Nil
      value = case e
              when AEC::AccountVpcEncryptionControlState::DefaultState                   then "default-state"
              when AEC::AccountVpcEncryptionControlState::TransitionsInProgress          then "transitions-in-progress"
              when AEC::AccountVpcEncryptionControlState::TransitionsPartiallySuccessful then "transitions-partially-successful"
              when AEC::AccountVpcEncryptionControlState::TransitionsSuccessful          then "transitions-successful"
              when AEC::AccountVpcEncryptionControlState::TransitionsFailed              then "transitions-failed"
              else
                raise Exception.new("unknown enum value for 'AccountVpcEncryptionControlState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AccountVpcEncryptionControlState
      value = pull.read_string
      case value
      when "default-state"                    then AEC::AccountVpcEncryptionControlState::DefaultState
      when "transitions-in-progress"          then AEC::AccountVpcEncryptionControlState::TransitionsInProgress
      when "transitions-partially-successful" then AEC::AccountVpcEncryptionControlState::TransitionsPartiallySuccessful
      when "transitions-successful"           then AEC::AccountVpcEncryptionControlState::TransitionsSuccessful
      when "transitions-failed"               then AEC::AccountVpcEncryptionControlState::TransitionsFailed
      else
        raise Exception.new("unknown enum value for 'AccountVpcEncryptionControlState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AccountVpcEncryptionControlState::DefaultState                   then "default-state"
      when AEC::AccountVpcEncryptionControlState::TransitionsInProgress          then "transitions-in-progress"
      when AEC::AccountVpcEncryptionControlState::TransitionsPartiallySuccessful then "transitions-partially-successful"
      when AEC::AccountVpcEncryptionControlState::TransitionsSuccessful          then "transitions-successful"
      when AEC::AccountVpcEncryptionControlState::TransitionsFailed              then "transitions-failed"
      else
        raise Exception.new("unknown enum value for 'AccountVpcEncryptionControlState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AccountVpcEncryptionControlState?
      case key
      when "default-state"                    then AEC::AccountVpcEncryptionControlState::DefaultState
      when "transitions-in-progress"          then AEC::AccountVpcEncryptionControlState::TransitionsInProgress
      when "transitions-partially-successful" then AEC::AccountVpcEncryptionControlState::TransitionsPartiallySuccessful
      when "transitions-successful"           then AEC::AccountVpcEncryptionControlState::TransitionsSuccessful
      when "transitions-failed"               then AEC::AccountVpcEncryptionControlState::TransitionsFailed
      else
        nil
      end
    end
  end
end
