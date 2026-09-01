private alias ACW = Amazonite::CloudWatch

module Amazonite::CloudWatch
  # The status of OTel enrichment for the account.
  enum OTelEnrichmentStatus
    Running
    Stopped

    def self.to_json(e : OTelEnrichmentStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::OTelEnrichmentStatus
      value = pull.read_string
      case value
      when "Running" then ACW::OTelEnrichmentStatus::Running
      when "Stopped" then ACW::OTelEnrichmentStatus::Stopped
      else
        raise Exception.new("unknown enum value for 'OTelEnrichmentStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACW::OTelEnrichmentStatus?
      case key
      when "Running" then ACW::OTelEnrichmentStatus::Running
      when "Stopped" then ACW::OTelEnrichmentStatus::Stopped
      else
        nil
      end
    end
  end
end
