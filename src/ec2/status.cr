private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Status
    MoveInProgress
    InVpc
    InClassic

    def self.to_json(e : Status, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Status
      value = pull.read_string
      case value
      when "MoveInProgress" then AEC::Status::MoveInProgress
      when "InVpc"          then AEC::Status::InVpc
      when "InClassic"      then AEC::Status::InClassic
      else
        raise Exception.new("unknown enum value for 'Status' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::Status?
      case key
      when "MoveInProgress" then AEC::Status::MoveInProgress
      when "InVpc"          then AEC::Status::InVpc
      when "InClassic"      then AEC::Status::InClassic
      else
        nil
      end
    end
  end
end
