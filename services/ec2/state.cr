private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum State
    PendingAcceptance
    Pending
    Available
    Deleting
    Deleted
    Rejected
    Failed
    Expired
    Partial

    def self.to_json(e : State, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::State
      value = pull.read_string
      case value
      when "PendingAcceptance" then AEC::State::PendingAcceptance
      when "Pending"           then AEC::State::Pending
      when "Available"         then AEC::State::Available
      when "Deleting"          then AEC::State::Deleting
      when "Deleted"           then AEC::State::Deleted
      when "Rejected"          then AEC::State::Rejected
      when "Failed"            then AEC::State::Failed
      when "Expired"           then AEC::State::Expired
      when "Partial"           then AEC::State::Partial
      else
        raise Exception.new("unknown enum value for 'State' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::State?
      case key
      when "PendingAcceptance" then AEC::State::PendingAcceptance
      when "Pending"           then AEC::State::Pending
      when "Available"         then AEC::State::Available
      when "Deleting"          then AEC::State::Deleting
      when "Deleted"           then AEC::State::Deleted
      when "Rejected"          then AEC::State::Rejected
      when "Failed"            then AEC::State::Failed
      when "Expired"           then AEC::State::Expired
      when "Partial"           then AEC::State::Partial
      else
        nil
      end
    end
  end
end
