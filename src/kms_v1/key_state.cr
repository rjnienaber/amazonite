private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum KeyState
    Creating
    Enabled
    Disabled
    PendingDeletion
    PendingImport
    PendingReplicaDeletion
    Unavailable
    Updating

    def self.to_json(e : KeyState, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AK::KeyState
      value = pull.read_string
      case value
      when "Creating"               then AK::KeyState::Creating
      when "Enabled"                then AK::KeyState::Enabled
      when "Disabled"               then AK::KeyState::Disabled
      when "PendingDeletion"        then AK::KeyState::PendingDeletion
      when "PendingImport"          then AK::KeyState::PendingImport
      when "PendingReplicaDeletion" then AK::KeyState::PendingReplicaDeletion
      when "Unavailable"            then AK::KeyState::Unavailable
      when "Updating"               then AK::KeyState::Updating
      else
        raise Exception.new("unknown enum value for 'KeyState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AK::KeyState?
      case key
      when "Creating"               then AK::KeyState::Creating
      when "Enabled"                then AK::KeyState::Enabled
      when "Disabled"               then AK::KeyState::Disabled
      when "PendingDeletion"        then AK::KeyState::PendingDeletion
      when "PendingImport"          then AK::KeyState::PendingImport
      when "PendingReplicaDeletion" then AK::KeyState::PendingReplicaDeletion
      when "Unavailable"            then AK::KeyState::Unavailable
      when "Updating"               then AK::KeyState::Updating
      else
        nil
      end
    end
  end
end
