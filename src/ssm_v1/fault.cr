private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum Fault
    Client
    Server
    Unknown

    def self.to_json(e : Fault, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::Fault
      value = pull.read_string
      case value
      when "Client"  then AS::Fault::Client
      when "Server"  then AS::Fault::Server
      when "Unknown" then AS::Fault::Unknown
      else
        raise Exception.new("unknown enum value for 'Fault' when deserializing from json: '#{value}'")
      end
    end
  end
end
