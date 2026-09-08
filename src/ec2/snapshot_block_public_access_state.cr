private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SnapshotBlockPublicAccessState
    BlockAllSharing
    BlockNewSharing
    Unblocked

    def self.to_json(e : SnapshotBlockPublicAccessState, json : JSON::Builder) : Nil
      value = case e
              when AEC::SnapshotBlockPublicAccessState::BlockAllSharing then "block-all-sharing"
              when AEC::SnapshotBlockPublicAccessState::BlockNewSharing then "block-new-sharing"
              when AEC::SnapshotBlockPublicAccessState::Unblocked       then "unblocked"
              else
                raise Exception.new("unknown enum value for 'SnapshotBlockPublicAccessState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SnapshotBlockPublicAccessState
      value = pull.read_string
      case value
      when "block-all-sharing" then AEC::SnapshotBlockPublicAccessState::BlockAllSharing
      when "block-new-sharing" then AEC::SnapshotBlockPublicAccessState::BlockNewSharing
      when "unblocked"         then AEC::SnapshotBlockPublicAccessState::Unblocked
      else
        raise Exception.new("unknown enum value for 'SnapshotBlockPublicAccessState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SnapshotBlockPublicAccessState::BlockAllSharing then "block-all-sharing"
      when AEC::SnapshotBlockPublicAccessState::BlockNewSharing then "block-new-sharing"
      when AEC::SnapshotBlockPublicAccessState::Unblocked       then "unblocked"
      else
        raise Exception.new("unknown enum value for 'SnapshotBlockPublicAccessState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SnapshotBlockPublicAccessState?
      case key
      when "block-all-sharing" then AEC::SnapshotBlockPublicAccessState::BlockAllSharing
      when "block-new-sharing" then AEC::SnapshotBlockPublicAccessState::BlockNewSharing
      when "unblocked"         then AEC::SnapshotBlockPublicAccessState::Unblocked
      else
        nil
      end
    end
  end
end
