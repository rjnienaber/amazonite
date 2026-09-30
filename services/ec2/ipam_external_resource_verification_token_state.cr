private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamExternalResourceVerificationTokenState
    CreateInProgress
    CreateComplete
    CreateFailed
    DeleteInProgress
    DeleteComplete
    DeleteFailed

    def self.to_json(e : IpamExternalResourceVerificationTokenState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamExternalResourceVerificationTokenState::CreateInProgress then "create-in-progress"
              when AEC::IpamExternalResourceVerificationTokenState::CreateComplete   then "create-complete"
              when AEC::IpamExternalResourceVerificationTokenState::CreateFailed     then "create-failed"
              when AEC::IpamExternalResourceVerificationTokenState::DeleteInProgress then "delete-in-progress"
              when AEC::IpamExternalResourceVerificationTokenState::DeleteComplete   then "delete-complete"
              when AEC::IpamExternalResourceVerificationTokenState::DeleteFailed     then "delete-failed"
              else
                raise Exception.new("unknown enum value for 'IpamExternalResourceVerificationTokenState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamExternalResourceVerificationTokenState
      value = pull.read_string
      case value
      when "create-in-progress" then AEC::IpamExternalResourceVerificationTokenState::CreateInProgress
      when "create-complete"    then AEC::IpamExternalResourceVerificationTokenState::CreateComplete
      when "create-failed"      then AEC::IpamExternalResourceVerificationTokenState::CreateFailed
      when "delete-in-progress" then AEC::IpamExternalResourceVerificationTokenState::DeleteInProgress
      when "delete-complete"    then AEC::IpamExternalResourceVerificationTokenState::DeleteComplete
      when "delete-failed"      then AEC::IpamExternalResourceVerificationTokenState::DeleteFailed
      else
        raise Exception.new("unknown enum value for 'IpamExternalResourceVerificationTokenState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamExternalResourceVerificationTokenState::CreateInProgress then "create-in-progress"
      when AEC::IpamExternalResourceVerificationTokenState::CreateComplete   then "create-complete"
      when AEC::IpamExternalResourceVerificationTokenState::CreateFailed     then "create-failed"
      when AEC::IpamExternalResourceVerificationTokenState::DeleteInProgress then "delete-in-progress"
      when AEC::IpamExternalResourceVerificationTokenState::DeleteComplete   then "delete-complete"
      when AEC::IpamExternalResourceVerificationTokenState::DeleteFailed     then "delete-failed"
      else
        raise Exception.new("unknown enum value for 'IpamExternalResourceVerificationTokenState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamExternalResourceVerificationTokenState?
      case key
      when "create-in-progress" then AEC::IpamExternalResourceVerificationTokenState::CreateInProgress
      when "create-complete"    then AEC::IpamExternalResourceVerificationTokenState::CreateComplete
      when "create-failed"      then AEC::IpamExternalResourceVerificationTokenState::CreateFailed
      when "delete-in-progress" then AEC::IpamExternalResourceVerificationTokenState::DeleteInProgress
      when "delete-complete"    then AEC::IpamExternalResourceVerificationTokenState::DeleteComplete
      when "delete-failed"      then AEC::IpamExternalResourceVerificationTokenState::DeleteFailed
      else
        nil
      end
    end
  end
end
