private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum RebootOption
    RebootIfNeeded
    NoReboot

    def self.to_json(e : RebootOption, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::RebootOption
      value = pull.read_string
      case value
      when "RebootIfNeeded" then AS::RebootOption::RebootIfNeeded
      when "NoReboot"       then AS::RebootOption::NoReboot
      else
        raise Exception.new("unknown enum value for 'RebootOption' when deserializing from json: '#{value}'")
      end
    end
  end
end
