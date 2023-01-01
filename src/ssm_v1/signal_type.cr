private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum SignalType
    Approve
    Reject
    StartStep
    StopStep
    Resume

    def self.to_json(e : SignalType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::SignalType
      value = pull.read_string
      case value
      when "Approve"   then AS::SignalType::Approve
      when "Reject"    then AS::SignalType::Reject
      when "StartStep" then AS::SignalType::StartStep
      when "StopStep"  then AS::SignalType::StopStep
      when "Resume"    then AS::SignalType::Resume
      else
        raise Exception.new("unknown enum value for 'SignalType' when deserializing from json: '#{value}'")
      end
    end
  end
end
