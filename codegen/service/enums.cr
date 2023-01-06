require "json"

module Amazonite::Codegen::Service
  enum Protocol
    JSON
    Query
    RestJSON

    def self.from_json(json : ::JSON::Any) : Protocol
      value = json["protocol"].as_s
      case value
      when "json"      then Protocol::JSON
      when "query"     then Protocol::Query
      when "rest-json" then Protocol::RestJSON
      else
        raise Exception.new("unknown enum value for 'Protocol': '#{value}'")
      end
    end
  end
end
