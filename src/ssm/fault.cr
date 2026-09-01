private alias AS = Amazonite::Ssm

module Amazonite::Ssm
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

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::Fault?
      case key
      when "Client"  then AS::Fault::Client
      when "Server"  then AS::Fault::Server
      when "Unknown" then AS::Fault::Unknown
      else
        nil
      end
    end
  end
end
