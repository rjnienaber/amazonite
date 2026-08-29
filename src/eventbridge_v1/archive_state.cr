private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  enum ArchiveState
    Enabled
    Disabled
    Creating
    Updating
    CreateFailed
    UpdateFailed

    def self.to_json(e : ArchiveState, json : JSON::Builder) : Nil
      value = case e
              when AEB::ArchiveState::Enabled      then "ENABLED"
              when AEB::ArchiveState::Disabled     then "DISABLED"
              when AEB::ArchiveState::Creating     then "CREATING"
              when AEB::ArchiveState::Updating     then "UPDATING"
              when AEB::ArchiveState::CreateFailed then "CREATE_FAILED"
              when AEB::ArchiveState::UpdateFailed then "UPDATE_FAILED"
              else
                raise Exception.new("unknown enum value for 'ArchiveState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::ArchiveState
      value = pull.read_string
      case value
      when "ENABLED"       then AEB::ArchiveState::Enabled
      when "DISABLED"      then AEB::ArchiveState::Disabled
      when "CREATING"      then AEB::ArchiveState::Creating
      when "UPDATING"      then AEB::ArchiveState::Updating
      when "CREATE_FAILED" then AEB::ArchiveState::CreateFailed
      when "UPDATE_FAILED" then AEB::ArchiveState::UpdateFailed
      else
        raise Exception.new("unknown enum value for 'ArchiveState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::ArchiveState::Enabled      then "ENABLED"
      when AEB::ArchiveState::Disabled     then "DISABLED"
      when AEB::ArchiveState::Creating     then "CREATING"
      when AEB::ArchiveState::Updating     then "UPDATING"
      when AEB::ArchiveState::CreateFailed then "CREATE_FAILED"
      when AEB::ArchiveState::UpdateFailed then "UPDATE_FAILED"
      else
        raise Exception.new("unknown enum value for 'ArchiveState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::ArchiveState?
      case key
      when "ENABLED"       then AEB::ArchiveState::Enabled
      when "DISABLED"      then AEB::ArchiveState::Disabled
      when "CREATING"      then AEB::ArchiveState::Creating
      when "UPDATING"      then AEB::ArchiveState::Updating
      when "CREATE_FAILED" then AEB::ArchiveState::CreateFailed
      when "UPDATE_FAILED" then AEB::ArchiveState::UpdateFailed
      else
        nil
      end
    end
  end
end
