private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SnapshotState
    Pending
    Completed
    Error
    Recoverable
    Recovering

    def self.to_json(e : SnapshotState, json : JSON::Builder) : Nil
      value = case e
              when AEC::SnapshotState::Pending     then "pending"
              when AEC::SnapshotState::Completed   then "completed"
              when AEC::SnapshotState::Error       then "error"
              when AEC::SnapshotState::Recoverable then "recoverable"
              when AEC::SnapshotState::Recovering  then "recovering"
              else
                raise Exception.new("unknown enum value for 'SnapshotState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SnapshotState
      value = pull.read_string
      case value
      when "pending"     then AEC::SnapshotState::Pending
      when "completed"   then AEC::SnapshotState::Completed
      when "error"       then AEC::SnapshotState::Error
      when "recoverable" then AEC::SnapshotState::Recoverable
      when "recovering"  then AEC::SnapshotState::Recovering
      else
        raise Exception.new("unknown enum value for 'SnapshotState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SnapshotState::Pending     then "pending"
      when AEC::SnapshotState::Completed   then "completed"
      when AEC::SnapshotState::Error       then "error"
      when AEC::SnapshotState::Recoverable then "recoverable"
      when AEC::SnapshotState::Recovering  then "recovering"
      else
        raise Exception.new("unknown enum value for 'SnapshotState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SnapshotState?
      case key
      when "pending"     then AEC::SnapshotState::Pending
      when "completed"   then AEC::SnapshotState::Completed
      when "error"       then AEC::SnapshotState::Error
      when "recoverable" then AEC::SnapshotState::Recoverable
      when "recovering"  then AEC::SnapshotState::Recovering
      else
        nil
      end
    end
  end
end
