private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
  enum EventSourceState
    Pending
    Active
    Deleted

    def self.to_json(e : EventSourceState, json : JSON::Builder) : Nil
      value = case e
              when AEB::EventSourceState::Pending then "PENDING"
              when AEB::EventSourceState::Active  then "ACTIVE"
              when AEB::EventSourceState::Deleted then "DELETED"
              else
                raise Exception.new("unknown enum value for 'EventSourceState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::EventSourceState
      value = pull.read_string
      case value
      when "PENDING" then AEB::EventSourceState::Pending
      when "ACTIVE"  then AEB::EventSourceState::Active
      when "DELETED" then AEB::EventSourceState::Deleted
      else
        raise Exception.new("unknown enum value for 'EventSourceState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::EventSourceState::Pending then "PENDING"
      when AEB::EventSourceState::Active  then "ACTIVE"
      when AEB::EventSourceState::Deleted then "DELETED"
      else
        raise Exception.new("unknown enum value for 'EventSourceState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::EventSourceState?
      case key
      when "PENDING" then AEB::EventSourceState::Pending
      when "ACTIVE"  then AEB::EventSourceState::Active
      when "DELETED" then AEB::EventSourceState::Deleted
      else
        nil
      end
    end
  end
end
